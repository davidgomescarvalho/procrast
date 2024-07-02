import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "check", "bar", "completedButton" ]
  static values = { project: String }

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

        if (data.completion_percentage === 100) {
          const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
              confirmButton: "btn btn-success",
              cancelButton: "btn btn-danger"
            },
            buttonsStyling: false
          });
          swalWithBootstrapButtons.fire({
            title: "Are you sure to archive this project?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "<a data-turbo-method='delete' href='/projects/" + id  + "'>'Yes, i'm done !'</a>" ,
            cancelButtonText: "No, not yet!",
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
                text: "Your project is safe :)",
                icon: "error"
              });
            }
          });
        }
      })

  }


}
