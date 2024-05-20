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

        return users.stream()
                .map(user -> ProductDTO.builder()
                        .productId(user.getProductId())
                        .name(user.getName())
                        .price(user.getPrice())
                        .orderDate(user.getOrderDate())
                        .imageUrl(user.getImageUrl())
                        .place(user.getPlace())
                        .detail(user.getDetail())
                        .currentPeopleNum(user.getCurrentPeopleNum())
                        .build())
                .collect(Collectors.toList());
    }

    @CacheEvict(value = "ProductAllCache", allEntries = true)
    public String cacheReset() {
        return "Cache is reset";
    }
}
