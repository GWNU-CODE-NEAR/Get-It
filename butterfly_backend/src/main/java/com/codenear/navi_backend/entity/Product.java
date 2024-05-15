package com.codenear.navi_backend.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

@Entity
@Table(name = "products")
@Getter
@Setter
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long productId;

    @Column(name="name")
    private String name;

    @Column(name="price")
    private int price;

    @Column(name="order_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderDate;

    @Column(name="image_url")
    private String imageUrl;

    @Column(name="place")
    private String place;

    @Column(name="detail")
    private String detail;

    @Column(name="current_people_num")
    private int currentPeopleNum;
}