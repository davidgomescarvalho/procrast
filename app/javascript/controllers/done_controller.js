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
      confirmButtonText: "<a class='text-decoration-none text-black'>Yes!</a>",
      cancelButtonText: "No!",
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        confetti({
          particleCount: 200,
          spread: 70,
          origin: { y: 0.6 }
        });

        Swal.fire({
          title: "Great work!",
          text: "You just won a new Trophy! 🏆",
          imageUrl: "https://uikit.lewagon.com/assets/logo-b3807c5a8a56ea45dfd790015bc4e88acab54ba679ed343230a4cb9ac0b53dba.png",
          imageWidth: 200,
          imageHeight: 200,
          imageAlt: "Wagon Logo",
          confirmButtonText: "<a data-turbo-method='delete' href='/projects/" + this.projectIdValue  + "' class='text-decoration-none text-black'>Great</a>",
        });
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        swalWithBootstrapButtons.fire({
          title: "Cancelled",
          text: "Your project is still in progress :)",
          icon: "error"
        });
      }
    });
  }
}
