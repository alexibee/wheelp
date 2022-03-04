import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"


// if ((location.pathname).includes('/bookings/new')) {

  export default class extends Controller {
    static targets = ["input"]
    static values = { "available": Array }

    connect() {
      flatpickr(this.inputTarget, {
        minDate: "today",
        enable: this.availableValue,
        dateFormat: "Y-m-d",
      });
    }
  }
// }
