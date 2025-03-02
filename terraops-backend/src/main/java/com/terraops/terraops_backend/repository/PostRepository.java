package com.terraops.terraops_backend.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.terraops.terraops_backend.models.PostModel;

@Repository
public interface PostRepository extends CrudRepository<PostModel, Long>{
    
}
