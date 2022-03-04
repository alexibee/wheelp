import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

const availableDates = JSON.parse(document.querySelector('#booking-form').dataset.available)

export default class extends Controller {
  static targets = ["input"]
  // const dateInput = document.getElementById("booking_date")

  connect() {
    flatpickr(this.inputTarget, {
      minDate: "today",
      enable: availableDates,
      dateFormat: "Y-m-d",
    });
  }
}
