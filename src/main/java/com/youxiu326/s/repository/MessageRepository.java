package com.youxiu326.s.repository;

import com.youxiu326.s.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<Message, Long> {

}