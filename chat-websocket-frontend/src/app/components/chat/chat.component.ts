import {Component, OnInit} from '@angular/core';
import {ChatMessage} from "../../models/chat-message";
import {ChatService} from "../../services/chat.service";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-chat',
  templateUrl: './chat.component.html',
  styleUrls: ['./chat.component.scss']
})
export class ChatComponent implements OnInit {

  messageInput: string = '';
  userId: string="";
  messageList: ChatMessage [] = [];

  constructor(private chatService: ChatService,
              private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.userId = this.route.snapshot.params["userId"];
    this.chatService.joinRoom("SupportClient");
    this.listenerMessage();
  }

  sendMessage() {
    const chatMessage: ChatMessage = {
      message: this.messageInput,
      user: this.userId
    };
    this.chatService.sendMessage("SupportClient", chatMessage);
    this.messageInput = '';
  }

  listenerMessage() {
    this.chatService.getMessageSubject().subscribe((messages: ChatMessage[]) => {
      this.messageList = messages.map((item: ChatMessage) => ({
        ...item,
        message_side: item.user === this.userId ? 'sender' : 'receiver'
      }))
    });
  }
}
