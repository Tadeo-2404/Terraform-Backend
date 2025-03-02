package com.terraops.terraops_backend.utils;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PostCreateRequest {
    private String title;
    private String description;
    private Timestamp date; 
    private String category;
}
