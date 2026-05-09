package com.inventra.service;

import com.inventra.entity.User;
import com.inventra.exception.ResourceNotFoundException;
import com.inventra.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository,
                       PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    // GET ALL
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // GET BY ID
    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not found with id " + id));
    }

    // UPDATE (basic profile)
    public User updateUser(Long id, User updated) {
        User existing = getUserById(id);

        if (updated.getName() != null) existing.setName(updated.getName());
        if (updated.getPhone() != null) existing.setPhone(updated.getPhone());
        if (updated.getAddress() != null) existing.setAddress(updated.getAddress());

        // NOTE: Email update is optional; if you don't want it, remove this block
        if (updated.getEmail() != null && !updated.getEmail().trim().isEmpty()) {
            String newEmail = updated.getEmail().trim().toLowerCase();
            userRepository.findByEmail(newEmail).ifPresent(u -> {
                if (!u.getId().equals(existing.getId())) {
                    throw new RuntimeException("Email already in use");
                }
            });
            existing.setEmail(newEmail);
        }

        return userRepository.save(existing);
    }

    // CHANGE PASSWORD
    public void changePassword(Long id, String newPassword) {
        if (newPassword == null || newPassword.isBlank()) {
            throw new RuntimeException("New password is required");
        }
        User user = getUserById(id);
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

    // ACTIVATE / DEACTIVATE
    public User setActive(Long id, boolean active) {
        User user = getUserById(id);
        user.setActive(active);
        return userRepository.save(user);
    }

    // DELETE
    public void deleteUser(Long id) {
        User user = getUserById(id);
        userRepository.delete(user);
    }
}