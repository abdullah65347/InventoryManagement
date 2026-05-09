package com.inventra.repository;

import com.inventra.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);

    //Login using either email or phone
    Optional<User> findByEmailOrPhone(String email, String phone);

    boolean existsByEmail(String email);

    boolean existsByPhone(String phone);

    List<User> findByActiveTrue();
}