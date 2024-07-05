import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "check", "bar", "completedButton" ]
  static values = { project: String, projectId: Number }

  toggle(event) {
    const checkbox = event.target
    let id = document.querySelector(".progress").getAttribute("data-project-id")

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
        this.completedButtonTarget.classList.toggle("d-none", data.completion_percentage !== 100)
        if (data.completion_percentage === 100) {
        }
      })

  }
  triggerModal() {
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: "btn btn-success",
        cancelButton: "btn btn-danger"
      },
      buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
      title: "Have you completed your Project?",
      icon: "success",
      showCancelButton: true,
      confirmButtonText: "<a data-turbo-method='delete' href='/projects/" + this.projectIdValue  + "'class='text-decoration-none text-black'>Yes!</a>" ,
      cancelButtonText: "No!",
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        swalWithBootstrapButtons.fire({
          title: "Deleted!",
          text: "Your file has been deleted.",
          icon: "success"
        });
      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire({
          title: "Cancelled",
          text: "Your project is still in progress :)",
          icon: "error"
        });
      }
    });
  }

}
