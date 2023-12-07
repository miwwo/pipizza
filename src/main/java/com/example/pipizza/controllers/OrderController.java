package com.example.pipizza.controllers;

import com.example.pipizza.models.Order;
import com.example.pipizza.models.User;
import com.example.pipizza.services.OrderService;
import com.example.pipizza.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final UserService userService;

    @GetMapping("/order/{id}")
    public String orderInfo(@PathVariable Long id, Model model) {
        Order order = orderService.getOrderById(id);
        model.addAttribute("order", order);
        return "order-info";
    }

    @PostMapping("/order/create")
    public String createOrder(Principal principal) throws IOException {
        User user = userService.getUserByPrincipal(principal);
        orderService.createOrder(user);
        userService.saveUser(user);
        return "redirect:/account";
    }
    @PostMapping("/order/delete/{id}")
    public String deleteOrder(@PathVariable Long id) {
        orderService.deleteOrder(id);
        return "redirect:/";
    }
}
