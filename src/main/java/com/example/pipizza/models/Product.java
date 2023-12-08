package com.example.pipizza.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "products")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "title", length = 63)
    @NotNull
    private String title;

    @Column(name = "description", columnDefinition = "text")
    @NotNull
    private String description;

    @Column(name = "price")
    @Min(value = 1, message = "Укажите корректную цену")
    @NotNull(message = "Укажите корректную цену")
    private Double price;

    @Column(name = "menu_component")
    @NotNull
    private boolean menuComponent = true;

    @Column()
    @NotNull
    @Min(value = 1, message = "Quantity must be greater than one")
    private int quantity = 1;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
            mappedBy = "product")
    private List<Image> images = new ArrayList<>();
    private Long previewImageId;

    public Product(String title,
                   String description,
                   double price,
                   int quantity,
                   Long previewImageId,
                   boolean menuComponent) {
        this.title = title;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.previewImageId = previewImageId;
        this.menuComponent = menuComponent;
    }


    public void addImageToProduct(Image image) {
        image.setProduct(this);
        images.add(image);
    }
}
