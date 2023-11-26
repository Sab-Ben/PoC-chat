package com.chat.websocket.backend.controller;

import com.chat.websocket.backend.dto.ChatMessageDto;
import com.chat.websocket.backend.service.ChatMessageService;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*", maxAge = 3600)
public class ChatMessageController {

    private final ChatMessageService chatMessageService;

    public ChatMessageController(ChatMessageService chatMessageService) {
        this.chatMessageService = chatMessageService;
    }

    @MessageMapping("/chat/{roomId}")
    @SendTo("/topic/{roomId}")

    public ChatMessageDto chat(@DestinationVariable String roomId, @Payload ChatMessageDto message) {
        return this.chatMessageService.chat(message);
    }

}
