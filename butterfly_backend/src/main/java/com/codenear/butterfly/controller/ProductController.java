package com.codenear.butterfly.controller;

import com.codenear.butterfly.dto.ProductDTO;
import com.codenear.butterfly.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/products")
public class ProductController {
    private final ProductService productService;

    @GetMapping("/all")
    public List<ProductDTO> getAllSchedules() {
        return productService.getAllProducts();
    }

    @GetMapping("/all/cache/reset")
    public String cacheReset() {
        return productService.cacheReset();
    }
}
