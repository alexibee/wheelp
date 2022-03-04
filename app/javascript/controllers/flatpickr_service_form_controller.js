import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    flatpickr(this.inputTarget, {
        minDate: "today",
        mode: "multiple",
        dateFormat: "Y-m-d",
    });
  }
}
