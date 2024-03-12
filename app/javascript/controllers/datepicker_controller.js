import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true, // Enable time picker
      dateFormat: "Y-m-d H:i", // Set the desired date-time format
      // Any other options you want to set
    })
  }
}
