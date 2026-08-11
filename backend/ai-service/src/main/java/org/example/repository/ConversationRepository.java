package org.example.repository;

import org.example.entity.Conversation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface ConversationRepository extends JpaRepository<Conversation, UUID> {

    Page<Conversation> findByUserSubAndDeletedAtIsNullOrderByUpdatedAtDesc(String userSub, Pageable pageable);

    Optional<Conversation> findByIdAndUserSubAndDeletedAtIsNull(UUID id, String userSub);
}
