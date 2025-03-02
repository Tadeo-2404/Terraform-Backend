package post.service.post_service.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import post.service.post_service.models.PostModel;

@Repository
public interface PostRepository extends CrudRepository<PostModel, Long>{
    
}
