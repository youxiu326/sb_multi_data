package com.youxiu326.p.repository;

import com.youxiu326.p.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

}