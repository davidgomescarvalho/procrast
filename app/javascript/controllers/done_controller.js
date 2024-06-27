import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "check" ]
  connect() {
    console.log("Hello from done_controller.js")
  }
  toggle() {
    this.checkTarget.classList.toggle("done")
    console.log("checked!")
    const form  = this.checkTarget.closest("form")
    const formData = new FormData(
      form
    )
    const options = {
      method: "PATCH",
      body: formData,
      headers: {
        "Accept": "application/json"
      }
    }
    fetch( form.action, options)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
