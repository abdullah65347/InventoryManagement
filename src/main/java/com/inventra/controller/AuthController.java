package com.inventra.controller;

import com.inventra.dto.request.LoginRequest;
import com.inventra.dto.request.RegisterRequest;
import com.inventra.dto.response.JwtResponse;
import com.inventra.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(
        name = "Authentication",
        description = "User registration, login and current-user APIs"
)
@RestController
@RequestMapping("/auth")
@CrossOrigin("http://localhost:4200")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    /* ---------------- REGISTER ---------------- */
    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody RegisterRequest request) {
        return ResponseEntity.ok(authService.register(request));
    }

    /* ---------------- LOGIN ---------------- */
    @PostMapping("/login")
    public ResponseEntity<JwtResponse> login(@RequestBody LoginRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }

    /* ---------------- ME ---------------- */
    @GetMapping("/me")
    public ResponseEntity<?> getCurrentUser(Authentication authentication) {
        return ResponseEntity.ok(authService.me(authentication));
    }
}