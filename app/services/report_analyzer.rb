class ReportAnalyzer
  MODEL = "llama-3.3-70b-versatile"

  def initialize(report)
    @report = report
  end

  def call
    response = client.chat(
      parameters: {
        model: MODEL,
        response_format: { type: "json_object" },
        messages: [
          { role: "system", content: system_prompt },
          { role: "user",   content: user_prompt }
        ],
        temperature: 0.2
      }
    )
    raw = response.dig("choices", 0, "message", "content")
    JSON.parse(raw, symbolize_names: true)
  end

  private

  def client
    @client ||= OpenAI::Client.new(
      access_token: ENV.fetch("GROQ_API_KEY"),
      uri_base: "https://api.groq.com/openai"
    )
  end

def system_prompt
  <<~PROMPT
    You are a strict editor evaluating a short business report.
    Return ONLY a JSON object with this exact shape:
    {
      "grammar": {
        "issues": [
          { "label": "<entry label>", "problem": "<short description>", "suggestion": "<fix>" }
        ]
      },
      "coherence": {
        "score": 0-100,
        "summary": "<one short sentence summarizing overall quality>",
        "per_entry": [
          { "label": "<entry label>", "verdict": "relevant" | "off_topic" | "too_vague", "note": "<one short sentence>" }
        ]
      }
    }

    LANGUAGE:
    - Detect the language of the report content (French, English, etc.).
    - Conduct the entire analysis in that same language.
    - Every "problem", "suggestion", "summary", and "note" field MUST be written in the content's language.

    GRAMMAR (be strict — flag all issues, not just obvious ones):
    - Spelling mistakes, conjugation errors, agreement mistakes (accords en genre/nombre for French, subject-verb agreement for English).
    - Typos and malformed words.
    - Stray numbers, symbols, or random words that do not belong in the sentence. Example: if a sentence contains "Le chantier 47 est terminé bleu.", flag "47" and "bleu" as out of place.
    - Broken, incomplete, or run-on sentences.
    - Missing punctuation that changes meaning.
    - Flag EVERY issue found; do not be lenient.

    COHERENCE (score 0-100):
    - Judge against the report title AND the depth of information.
    - 80-100: entries are relevant, detailed, substantive.
    - 50-79: relevant but thin — several entries are short or vague.
    - Below 50: many entries are empty, one-word, or extremely brief.
    - If the report is light on information, the summary MUST explicitly say so and the score MUST be lowered accordingly.

    OUTPUT:
    - Return JSON only. No prose outside the JSON.
    - For a clean, full report: empty grammar.issues, high score, summary stating completeness.
  PROMPT
end


  def user_prompt
    entries = @report.report_entries.reject { |e| e.label == "Titre" }.map do |e|
      "Label: #{e.label}\nContent: #{e.value_text}"
    end.join("\n\n")

    <<~PROMPT
      Report title: #{@report.title}

      Entries:
      #{entries}
    PROMPT
  end
end
