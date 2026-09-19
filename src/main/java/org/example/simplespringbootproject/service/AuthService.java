package org.example.simplespringbootproject.service;

import org.example.simplespringbootproject.dto.RegistrationRequest;
import org.example.simplespringbootproject.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.example.simplespringbootproject.model.User;
import org.springframework.stereotype.Service;

@Service
public class AuthService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthService(
            UserRepository userRepository,
            PasswordEncoder passwordEncoder){
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void register(RegistrationRequest request){
        if (userRepository.existsByEmail(request.getEmail()))
            throw new IllegalArgumentException("Пользователь с таким email уже существует");

        String encodedPassword = passwordEncoder.encode(request.getPassword());
        User user = new User(
                request.getEmail(),
                encodedPassword,
                request.getName()
        );

        userRepository.save(user);
    }
}
