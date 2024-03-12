import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-all"
export default class extends Controller {
  static targets = [ "select" ]

  connect() {
  }

  selectAll() {
    if (this.selectTarget.value.includes('All')) {
      this.selectTarget.querySelectorAll('option').forEach(option => {
        option.selected = true;
      });
    }
  }

  deselectAll() {
    if (!this.selectTarget.value.includes('All')) {
      this.selectTarget.querySelector('option[value="All"]').selected = false;
    }
  }
}
