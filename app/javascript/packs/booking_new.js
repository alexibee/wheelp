import flatpickr from "flatpickr"

const availableDates = JSON.parse(document.querySelector('#booking-form').dataset.available)
const dateInput = document.getElementById("booking_date")

flatpickr(dateInput, {
    minDate: "today",
    enable: availableDates,
    dateFormat: "Y-m-d",
});
