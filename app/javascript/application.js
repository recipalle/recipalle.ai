// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// app/javascript/packs/application.js
import "bootstrap";

// app/javascript/packs/application.js

import setupStripe from "../stripe_setup";

document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector("#payment-form")) {
    setupStripe();
  }
});