import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["reviews", "chat", "link", "rlink", "wrapper"]

  connect() {

  }
  unhideReviews(event) {
    event.preventDefault()
    this.reviewsTarget.classList.remove('d-none')
    this.rlinkTarget.classList.add('d-none')
    this.wrapperTarget.scrollTo({
      top: 100,
      left: 100,
      behavior: 'smooth'
    })

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
