package com.chat.websocket.backend.service;

import com.chat.websocket.backend.dto.ChatMessageDto;

public interface ChatMessageService {

    ChatMessageDto chat(ChatMessageDto message);

}
