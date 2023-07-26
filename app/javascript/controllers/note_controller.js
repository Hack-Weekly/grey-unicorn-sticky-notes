import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["textarea"];
  connect() {
    console.log("Note controller connected.");
  }
  enter(e) {
    if (e.which == 13) {
      this.textareaTarget.setAttribute("data-action", "");
      this.element.requestSubmit();
    }
    e.preventDefault();
    this.element.requestSubmit();
    e.stopImmediatePropagation();
    return false;
  }
}
