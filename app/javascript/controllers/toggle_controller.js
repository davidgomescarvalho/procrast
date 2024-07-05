import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "togglableElement", "anchor", "form", "list" ]

  toggleElement() {
    this.togglableElementTarget.classList.toggle('d-none')
    window.scrollTo({top: this.anchorTarget.offsetTop, behavior: 'auto'})
  }

  scroll(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          // beforeend could also be dynamic with Stimulus values
          this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
    // window.scrollTo(0, this.anchorbisTarget.offsetTop)
  }
}
