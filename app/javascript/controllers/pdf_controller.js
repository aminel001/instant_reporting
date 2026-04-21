import { Controller } from "@hotwired/stimulus"
import html2canvas from "html2canvas"
import { jsPDF } from "jspdf"

export default class extends Controller {
  static targets = ["content"]
  static values = { filename: String }

  download() {
    const button = this.element.querySelector("[data-action]")
    button.textContent = "Generating..."
    button.disabled = true

    html2canvas(this.contentTarget, { scale: 2, useCORS: true }).then(canvas => {
      const imgData = canvas.toDataURL("image/png")
      const pdf = new jsPDF({ orientation: "portrait", unit: "mm", format: "a4" })
      const pageWidth = pdf.internal.pageSize.getWidth()
      const pageHeight = pdf.internal.pageSize.getHeight()
      const imgHeight = (canvas.height * pageWidth) / canvas.width
      let heightLeft = imgHeight
      let position = 0

      pdf.addImage(imgData, "PNG", 0, position, pageWidth, imgHeight)
      heightLeft -= pageHeight

      while (heightLeft > 0) {
        position = heightLeft - imgHeight
        pdf.addPage()
        pdf.addImage(imgData, "PNG", 0, position, pageWidth, imgHeight)
        heightLeft -= pageHeight
      }

      pdf.save(this.filenameValue || "report.pdf")
      button.textContent = "Download PDF"
      button.disabled = false
    })
  }
}
