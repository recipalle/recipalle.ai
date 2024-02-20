// app/javascript/packs/subscription.js
import { loadStripe } from "@stripe/stripe-js";
import { CardElement, Elements, useElements, useStripe } from "@stripe/react-stripe-js";

document.addEventListener("DOMContentLoaded", () => {
  const public_key = "your_stripe_public_key"; // Replace with your Stripe public key
  const stripe = loadStripe(public_key);

  stripe.then((resolvedStripe) => {
    const elements = resolvedStripe.elements();
    const cardElement = elements.create("card");
    cardElement.mount("#card-element");

    const form = document.getElementById("payment-form");
    form.addEventListener("submit", async (event) => {
      event.preventDefault();

      const { token, error } = await resolvedStripe.createToken(cardElement);

      if (error) {
        const errorElement = document.getElementById("card-errors");
        errorElement.textContent = error.message;
      } else {
        stripeTokenHandler(token);
      }
    });
  });

  function stripeTokenHandler(token) {
    const form = document.getElementById("payment-form");
    const hiddenInput = document.createElement("input");
    hiddenInput.setAttribute("type", "hidden");
    hiddenInput.setAttribute("name", "stripeToken");
    hiddenInput.setAttribute("value", token.id);
    form.appendChild(hiddenInput);

    form.submit();
  }
});