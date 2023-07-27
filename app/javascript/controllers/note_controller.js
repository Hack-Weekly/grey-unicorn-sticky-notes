import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["textarea"];

  connect() {
    console.log("Note controller connected.");
  }

  rejectBlankNote() {
    return this.textareaTarget.value.trim() != ""
  }

  submitNote(e) {
    if (!this.rejectBlankNote()) {
      return;
    }

    e.preventDefault();
    this.textareaTarget.setAttribute("data-action", "");
    this.element.requestSubmit();
  }
}
