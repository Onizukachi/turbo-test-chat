import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="input-reset"
export default class extends Controller {
  clear() {
    this.element.reset()
  }
}
