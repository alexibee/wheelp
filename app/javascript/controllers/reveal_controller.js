import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["reviews", "chat", "link"]

  connect() {

  }
  unhideReviews(event) {
    event.preventDefault()
    this.reviewsTarget.classList.remove('d-none')
  }
  unhideChat(event) {
    event.preventDefault()
    this.chatTarget.classList.remove('d-none')
    this.linkTarget.classList.add('d-none')
  }
  hideChat(event) {
    event.preventDefault()
    this.chatTarget.classList.add('d-none')
    this.linkTarget.classList.remove('d-none')
  }
}
