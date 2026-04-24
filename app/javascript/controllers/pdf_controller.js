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

    html2canvas(this.contentTarget, { scale: 2, useCORS: true, allowTaint: true, logging: false })
      .then(canvas => {
        const imgData = canvas.toDataURL("image/png")
        const pdf = new jsPDF({ orientation: "portrait", unit: "mm", format: "a4" })
        const pageWidth = pdf.internal.pageSize.getWidth()
        const pageHeight = pdf.internal.pageSize.getHeight()
        const imgHeight = (canvas.height * pageWidth) / canvas.width
        let tempHeight = imgHeight - pageHeight
        let totalPages = 1
        while (tempHeight > 2) {
          totalPages++
          tempHeight -= pageHeight
        }
        let heightLeft = imgHeight
        let position = 0
        let pageNumber = 1

        pdf.addImage(imgData, "PNG", 0, position, pageWidth, imgHeight)
        addFooter(pdf, pageNumber, totalPages, pageWidth, pageHeight)
        heightLeft -= pageHeight

        while (heightLeft > 2) {
          pageNumber++
          position = heightLeft - imgHeight
          pdf.addPage()
          pdf.addImage(imgData, "PNG", 0, position, pageWidth, imgHeight)
          addFooter(pdf, pageNumber, totalPages, pageWidth, pageHeight)
          heightLeft -= pageHeight
        }

        pdf.save(this.filenameValue || "report.pdf")
      })
      .catch(err => {
        console.error("PDF generation failed:", err)
        alert("PDF generation failed. Check the browser console for details.")
      })
      .finally(() => {
        button.textContent = "Download PDF"
        button.disabled = false
      })
  }
}

function addFooter(pdf, pageNumber, totalPages, pageWidth, pageHeight) {
  pdf.setFontSize(9)
  pdf.setTextColor(150)
  pdf.text(
    `Page ${pageNumber} of ${totalPages}`,
    pageWidth / 2,
    pageHeight - 8,
    { align: "center" }
  )
  pdf.setTextColor(0)
}
