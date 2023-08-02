import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["active", "completed"];
  static classes = ["change"];

  connect() {
    console.log("Header controller connected");
  }

  toggle() {
    this.activeTarget.classList.toggle(this.changeClass);
    this.completedTarget.classList.toggle(this.changeClass);
  }
}
