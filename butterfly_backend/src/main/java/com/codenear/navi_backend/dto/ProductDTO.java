package com.codenear.navi_backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

    private Long productId;
    private String name;
    private int price;
    private Date orderDate;
    private String imageUrl;
    private String place;
    private String detail;
    private int currentPeopleNum;
}
