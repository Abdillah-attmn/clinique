import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {
  static targets = [ "slider" ]

  toggle() {
    const profileType = this.sliderTarget.checked ? "Doctor" : "Patient"
    const userId = this.element.dataset.userId

    fetch(`/users/${userId}/toggle_profile`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ profile_type: profileType })
    })
  }
}
