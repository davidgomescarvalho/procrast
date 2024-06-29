import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "check", "bar" ]

  toggle(event) {

    const checkbox = event.target

    checkbox.classList.toggle("done")
    const form  = checkbox.closest("form")

    const formData = new FormData(form)
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
        this.barTarget.style = `width: ${data.completion_percentage}%;`

        if (data.completion_percentage === 100) {
          this.buttontTarget.classList.add("d-none")
        } else {
          this.buttontTarget.classList.remove("d-none")
        }
      })
  }
}
