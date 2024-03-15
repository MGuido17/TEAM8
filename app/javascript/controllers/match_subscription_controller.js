import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { matchId: Number, userId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "MatchChannel", id: this.matchIdValue },
      { received: data => {
        if (this.userIdValue == data.user) {
          this.currentUser(data.message, data.created_at)
        } else {
          this.otherUser(data.message, data.created_at)
        }
      } }
    )
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  // #insertMessageAndScrollDown(data) {
  //   this.messagesTarget.insertAdjacentHTML("beforeend", data.html)
  //   window.scrollTo(0, this.messagesTarget.scrollHeight)
  //   const messageUser = document.querySelector(".message-user")
  //   const messageCard = document.querySelector(".message-card")
  //   if (this.userIdValue == data.user) {
  //     messageUser.classList.add("current-user-message")
  //     messageCard.classList.add("current-user-message")
  //     console.log(messageUser)
  //   } else {
  //     messageUser.classList.add("other-user-message")
  //     messageCard.classList.add("other-user-message")
  //   }
  //   console.log(this.userIdValue == data.user)
  // }

  resetForm(event) {
    event.target.reset()
  }

  currentUser(message, created_at) {
    const html = `<div class="message-user current-user-message">
    <div class="message-card current-user-message">
      <div class="card-body">
      <p>${message} <i>${created_at}</i></p>
      </div>
    </div>
  </div>
  `
  this.messagesTarget.insertAdjacentHTML("beforeend", html)
  window.scrollTo(0, this.messagesTarget.scrollHeight - 300)
  }

  otherUser(message, created_at) {
    const html = `<div class="message-user other-user-message">
    <div class="message-card other-user-message">
      <div class="card-body">
        <p>${message} <i>${created_at}</i></p>
      </div>
    </div>
  </div>
  `
  this.messagesTarget.insertAdjacentHTML("beforeend", html)
  window.scrollTo(0, this.messagesTarget.scrollHeight - 300)
  }
}
