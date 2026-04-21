# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "html2canvas", to: "https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/+esm"
pin "jspdf", to: "https://cdn.jsdelivr.net/npm/jspdf@2.5.1/+esm"
