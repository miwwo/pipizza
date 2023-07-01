package com.example.buysell.services;

import com.example.buysell.models.Order;
import com.example.buysell.repositories.OrderRepository;
import com.example.buysell.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;

    public List<Order> listOrder() {
        return orderRepository.findAll();
    }


    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }

    public Order getOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }
}
