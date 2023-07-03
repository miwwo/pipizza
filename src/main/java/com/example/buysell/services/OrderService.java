package com.example.buysell.services;

import com.example.buysell.models.Order;
import com.example.buysell.models.Product;
import com.example.buysell.models.User;
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

    public void saveOrder(Order order) {orderRepository.save(order);}

    public void createOrder(User user){
        Order order = new Order();
        List<Product> usersCart = user.getCart();

        for (Product product : usersCart) {
            order.getOrderComponents().add(new Product(
                    product.getTitle(),
                    product.getDescription(),
                    product.getPrice(),
                    product.getQuantity(),
                    product.getPreviewImageId(),
                    false));
        }
        order.setTotal(user.getTotal());
        order.setUser(user);
        orderRepository.save(order);

        user.setTotal(0);
        for (Product product: usersCart)
            product.setQuantity(1);
        usersCart.clear();
    }

}
