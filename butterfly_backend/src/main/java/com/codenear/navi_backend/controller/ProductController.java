package com.codenear.navi_backend.controller;

import com.codenear.navi_backend.dto.ProductDTO;
import com.codenear.navi_backend.service.ProductService;
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
