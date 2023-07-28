import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["textarea", "select", "form"];

  connect() {
    console.log("Note controller connected.");
  }

  rejectBlankNote() {
    return this.textareaTarget.value.trim() != "";
  }

  submitNote(e) {
    if (!this.rejectBlankNote()) {
      return;
    }

    e.preventDefault();
    this.textareaTarget.setAttribute("data-action", "");
    this.element.requestSubmit();
  }

  changeSelectColor(e) {
    const selectedColor =
      this.selectTarget.options[this.selectTarget.selectedIndex].value;
    this.selectTarget.setAttribute(
      "style",
      `background-color: ${selectedColor};`
    );
    this.formTarget.setAttribute(
      "style",
      `background-color: ${selectedColor};`
    );
    this.textareaTarget.setAttribute(
      "style",
      `background-color: ${selectedColor};`
    );
  }
}
