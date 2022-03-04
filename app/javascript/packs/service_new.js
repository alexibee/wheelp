import flatpickr from "flatpickr"

// const availableDates = JSON.parse(document.querySelector('#booking-form').dataset.available)
const availInput = document.getElementById("service_availability")

if (availInput !== null) {
  flatpickr(availInput, {
      minDate: "today",
      mode: "multiple",
      dateFormat: "Y-m-d",
  });
}
