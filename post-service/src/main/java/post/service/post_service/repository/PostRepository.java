package post.service.post_service.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import post.service.post_service.models.PostModel;
import java.util.List;


@Repository
public interface PostRepository extends CrudRepository<PostModel, Long>{
    List<PostModel> findByTitle(String title);
    List<PostModel> findByCategory(String category);
}
