package com.example.pipizza.services;

import com.example.pipizza.models.Product;
import com.example.pipizza.models.User;
import com.example.pipizza.models.enums.Role;
import com.example.pipizza.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);
        return true;
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void saveUser(User user){
        userRepository.save(user);
    }

    public void addProduct(User user, Product product){
        if (user.getCart().contains(product)){
            user.getCart().remove(product);
            product.setQuantity(product.getQuantity()+1);
        }
        user.getCart().add(product);
        user.setTotal(user.getTotal() + product.getPrice());
    }

    public void removeProduct(User user, Product product){
        if (user.getCart().contains(product)) {
            user.getCart().remove(product);
            user.setTotal(user.getTotal() - product.getPrice());
            if (product.getQuantity() - 1 != 0){
                product.setQuantity(product.getQuantity() - 1);
                user.getCart().add(product);
            }
        }
    }


}
