// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


document.addEventListener("DOMContentLoaded", () => {
  const input = document.getElementById("photo-input");
  const preview = document.getElementById("photo-preview");

  if (!input) return; // important: avoids errors on other pages

  input.addEventListener("change", (event) => {
    const file = event.target.files[0];

    if (file) {
      preview.src = URL.createObjectURL(file);
      preview.style.display = "block";
    }
  });
});
