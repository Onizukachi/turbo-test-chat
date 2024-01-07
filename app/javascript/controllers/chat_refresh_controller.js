import consumer from "../channels/consumer"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.subscribe()
    this.scrollMessages()
  }

  subscribe() {
    const turboCableStreamTag = document.querySelector('turbo-cable-stream-source')
    const signedStreamName = turboCableStreamTag.channel.signed_stream_name
    const channelName = turboCableStreamTag.channel.channel
    const scrollMessages = this.scrollMessages.bind(this)

    this.subscription = consumer.subscriptions.create({ channel: channelName, signed_stream_name: signedStreamName }, {
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