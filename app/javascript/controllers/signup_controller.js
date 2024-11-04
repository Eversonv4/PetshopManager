import { Controller } from "@hotwired/stimulus"
import { formatPhoneNumber } from "./utils/addMask";

export default class extends Controller {
  static targets = ["inputPhone"]

  connect() {
    // console.log("Hello World!");
  }

  formatPhoneMask(event) {
    event.target.value = formatPhoneNumber(event.target.value);
  }
}