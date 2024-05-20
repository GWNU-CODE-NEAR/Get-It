package com.codenear.butterfly.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@Builder
public class ProductDTO {

    private Long productId;
    private String name;
    private int price;
    private Date orderDate;
    private String imageUrl;
    private String place;
    private String detail;
    private int currentPeopleNum;

    public ProductDTO(Long productId, String name, int price, Date orderDate, String imageUrl, String place, String detail, int currentPeopleNum) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.orderDate = orderDate;
        this.imageUrl = imageUrl;
        this.place = place;
        this.detail = detail;
        this.currentPeopleNum = currentPeopleNum;
    }
}
