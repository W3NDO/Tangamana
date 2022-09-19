import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["chats"]

  scrollToBottom() {
    const chatBox = document.getElementById("chat");
    console.log(chatBox);
    if (!chatBox) return;
    
    chatBox.scrollTo({top: chatBox.scrollHeight});
  }
  scrollToBottom()
}
