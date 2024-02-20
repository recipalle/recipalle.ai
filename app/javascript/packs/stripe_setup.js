// app/javascript/stripe_setup.js

function setupStripe() {
    const stripePublicKey = document.querySelector('meta[name="stripe-public-key"]').content;
    const stripe = Stripe(stripePublicKey);
    const elements = stripe.elements();
    const card = elements.create("card");
    card.mount("#card-element");
  
    card.addEventListener("change", function (event) {
      const displayError = document.getElementById("card-errors");
      if (event.error) {
        displayError.textContent = event.error.message;
      } else {
        displayError.textContent = "";
      }
    });
  
    const form = document.querySelector("#payment-form");
    form.addEventListener("submit", function (event) {
      event.preventDefault();
  
      stripe.createToken(card).then(function (result) {
        if (result.error) {
          const errorElement = document.getElementById("card-errors");
          errorElement.textContent = result.error.message;
        } else {
          stripeTokenHandler(result.token);
        }
      });
    });
  
    function stripeTokenHandler(token) {
      const form = document.querySelector("#payment-form");
      const hiddenInput = document.createElement("input");
      hiddenInput.setAttribute("type", "hidden");
      hiddenInput.setAttribute("name", "stripeToken");
      hiddenInput.setAttribute("value", token.id);
      form.appendChild(hiddenInput);
  
      form.submit();
    }
  }
  
  export default setupStripe;  