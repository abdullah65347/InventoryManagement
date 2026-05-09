package com.inventra.controller;

import com.inventra.entity.User;
import com.inventra.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(
        name = "User Management",
        description = "User profile management, password update, activation & deletion APIs"
)
@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // GET /api/users
    @GetMapping
    public ResponseEntity<List<User>> getAll() {
        return ResponseEntity.ok(userService.getAllUsers());
    }

    // GET /api/users/{id}
    @GetMapping("/{id}")
    public ResponseEntity<User> getById(@PathVariable Long id) {
        return ResponseEntity.ok(userService.getUserById(id));
    }

    // PUT /api/users/{id}
    @PutMapping("/{id}")
    public ResponseEntity<User> update(@PathVariable Long id, @RequestBody User updated) {
        return ResponseEntity.ok(userService.updateUser(id, updated));
    }

    // PUT /api/users/{id}/password  (Body: {"newPassword":"..."} )
    @PutMapping("/{id}/password")
    public ResponseEntity<Map<String, String>> changePassword(@PathVariable Long id,
                                                              @RequestBody Map<String, String> body) {
        String newPassword = body.get("newPassword");
        userService.changePassword(id, newPassword);
        return ResponseEntity.ok(Map.of("message", "Password updated successfully"));
    }

    // PUT /api/users/{id}/active?active=true|false
    @PutMapping("/{id}/active")
    public ResponseEntity<User> setActive(@PathVariable Long id, @RequestParam boolean active) {
        return ResponseEntity.ok(userService.setActive(id, active));
    }

    // DELETE /api/users/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        userService.deleteUser(id);
        return ResponseEntity.noContent().build();
    }
}