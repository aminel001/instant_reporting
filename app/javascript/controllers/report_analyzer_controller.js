import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values  = { url: String }
  static targets = ["idle", "loading", "result", "button"]

  async analyze() {
    this.showLoading()

    try {
      const response = await fetch(this.urlValue, {
        method: "POST",
        headers: {
          "X-CSRF-Token": this.csrfToken(),
          "Accept": "text/html"
        }
      })

      const html = await response.text()
      this.showResult(html)
    } catch (err) {
      this.showResult(`<div class="alert alert-danger small mb-0">Network error: ${err.message}</div>`)
    }
  }

  showLoading() {
    this.idleTarget.classList.add("d-none")
    this.resultTarget.classList.add("d-none")
    this.loadingTarget.classList.remove("d-none")
    this.buttonTarget.disabled = true
  }

  showResult(html) {
    this.loadingTarget.classList.add("d-none")
    this.resultTarget.innerHTML = html
    this.resultTarget.classList.remove("d-none")
    this.buttonTarget.disabled = false
    this.buttonTarget.textContent = "Re-run"
  }

  csrfToken() {
    return document.querySelector('meta[name="csrf-token"]')?.content || ""
  }
}
