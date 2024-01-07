import consumer from "../channels/consumer"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static  values = { room: String }

  connect() {
    this.subscribe();
    this.scrollMessages()
  }

  subscribe() {
    const scrollMessages = this.scrollMessages.bind(this)

    this.subscription = consumer.subscriptions.create({ channel: 'ChatChannel', room: this.roomValue }, {
      received(data) {
        setTimeout(scrollMessages, 100);
      }
    })
  }

  clearInput() {
    this.element.reset();
  }

  scrollMessages() {
    const chatContainer = document.getElementById('chat-container')
    if (chatContainer) chatContainer.scrollTop = chatContainer.scrollHeight
  }
}