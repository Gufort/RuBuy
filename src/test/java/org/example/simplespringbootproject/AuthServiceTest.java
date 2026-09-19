package org.example.simplespringbootproject;

import org.example.simplespringbootproject.dto.RegistrationRequest;
import org.example.simplespringbootproject.model.User;
import org.example.simplespringbootproject.repository.UserRepository;
import org.example.simplespringbootproject.service.AuthService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AuthServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @InjectMocks
    private AuthService authService;

    @Test
    void shouldRegisterUser() {
        RegistrationRequest request = new RegistrationRequest();

        request.setName("Gufort");
        request.setEmail("test@example.com");
        request.setPassword("password123");

        when(userRepository.existsByEmail(request.getEmail()))
                .thenReturn(false);

        when(passwordEncoder.encode(request.getPassword()))
                .thenReturn("hashed-password");

        authService.register(request);

        verify(userRepository).save(any(User.class));
        verify(passwordEncoder).encode("password123");
    }
}