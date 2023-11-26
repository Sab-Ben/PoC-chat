package com.chat.websocket.backend.service;

import com.chat.websocket.backend.dto.ChatMessageDto;
import org.springframework.stereotype.Service;

@Service
public class ChatMessageServiceImpl implements ChatMessageService{

    public ChatMessageDto chat(ChatMessageDto message) {
        return new ChatMessageDto(message.getMessage(), message.getUser());
    }
}
