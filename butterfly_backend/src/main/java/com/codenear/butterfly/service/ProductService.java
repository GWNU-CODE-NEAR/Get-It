package com.codenear.butterfly.service;

import com.codenear.butterfly.dto.ProductDTO;
import com.codenear.butterfly.entity.Product;
import com.codenear.butterfly.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;

    @Cacheable(value = "ProductAllCache")
    public List<ProductDTO> getAllProducts() {
        List<Product> users = productRepository.findAll();

        return users.stream().map(product -> {
            ProductDTO productDTO = new ProductDTO();

            productDTO.setProductId(product.getProductId());
            productDTO.setName(product.getName());
            productDTO.setPrice(product.getPrice());
            productDTO.setOrderDate(product.getOrderDate());
            productDTO.setImageUrl(product.getImageUrl());
            productDTO.setPlace(product.getPlace());
            productDTO.setDetail(product.getDetail());
            productDTO.setCurrentPeopleNum(product.getCurrentPeopleNum());
            return productDTO;
        }).collect(Collectors.toList());
    }

    @CacheEvict(value = "ProductAllCache", allEntries = true)
    public String cacheReset() {
        return "Cache is reset";
    }
}
