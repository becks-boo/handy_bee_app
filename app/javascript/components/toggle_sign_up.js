// JS to toggle the different forms with click event
// Look at toggle (add/remove)
// Function is called in application.js
const toggleSignUp = () => {
  const customerButton = document.getElementById("customer-btn");
  const customerForm = document.getElementById("customer-form");
  const contractorButton = document.getElementById("contractor-btn");
  const contractorForm = document.getElementById("contractor-form");

  if (customerButton) {
    contractorButton.addEventListener("click", () => {
      contractorForm.classList.remove("d-none");
      customerForm.classList.add("d-none");
    });

    customerButton.addEventListener("click", () => {
      customerForm.classList.remove("d-none");
      contractorForm.classList.add("d-none");
    });
  }
}

export { toggleSignUp };
