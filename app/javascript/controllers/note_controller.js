import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["textarea", "select", "form"];

  connect() {
    console.log("Note controller connected.");
    this.enteredOnce = false;
    this.formTarget.addEventListener(
      "focusout",
      this.focusoutFormHandler.bind(this)
    );
  }

  disconnect() {
    this.formTarget.removeEventListener(
      "focusout",
      this.focusoutFormHandler.bind(this)
    );
  }

  focusoutFormHandler(e) {
    if (this.enteredOnce) {
      return false;
    }
    if (e.relatedTarget == null) {
      this.submitNote(e);
    } else if (e.relatedTarget.tagName == "SELECT") {
      return false;
    }
  }

  rejectBlankNote() {
    return this.textareaTarget.value.trim() != "";
  }

  submitNote(e) {
    if (e.keyCode == 13) {
      this.enteredOnce = true;
    }
    if (!this.rejectBlankNote()) {
      return;
    }
    e.preventDefault();
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
