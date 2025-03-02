package post.service.post_service.serviceImpl;

import java.sql.Timestamp;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import post.service.post_service.models.ResponseHttp;
import post.service.post_service.repository.PostRepository;
import post.service.post_service.service.PostService;
import post.service.post_service.utils.PostCreateRequest;
import post.service.post_service.utils.PostEditRequest;

@Service
public class PostServiceImpl implements PostService {
    private final PostRepository postRepository;

    public PostServiceImpl(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    @Override
    public ResponseHttp createPost(PostCreateRequest postCreateRequest) {
        ResponseHttp responseHttp = new ResponseHttp();
        return responseHttp;
    }

    @Override
    public ResponseHttp editPost(PostEditRequest postEditRequest) {
        ResponseHttp responseHttp = new ResponseHttp();
        return responseHttp;
    }

    @Override
    public ResponseHttp deletePost(Long postID) {
        ResponseHttp responseHttp = new ResponseHttp();
        return responseHttp;
    }

    @Override
    public ResponseHttp searchPostByAttribute(Long postID, String title, Timestamp date, String category) {
        ResponseHttp responseHttp = new ResponseHttp();
        return responseHttp;
    }

    @Override
    public ResponseHttp getAllPost() {
        ResponseHttp responseHttp = new ResponseHttp();
        responseHttp.setStatus(HttpStatus.OK);
        responseHttp.setMessage("Success");
        responseHttp.setResponse(postRepository.findAll());
        return responseHttp;
    }
}
