import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "togglableElement" ]

  toggleElement() {
    this.togglableElementTarget.classList.toggle('d-none')
  }
}
