package post.service.post_service.serviceImpl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import post.service.post_service.exceptions.BadRequestException;
import post.service.post_service.exceptions.BadRequestException.BadRequestCodeValidation;
import post.service.post_service.models.PostModel;
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
        responseHttp.setStatus(HttpStatus.OK.value());
        responseHttp.setMessage("Success");

        if(postCreateRequest == null) {
            throw new BadRequestException(BadRequestCodeValidation.ERR_OO1, HttpStatus.OK);
        }

        postRepository.save(new PostModel(1L, postCreateRequest.getTitle(), postCreateRequest.getDescription(), postCreateRequest.getDate(), postCreateRequest.getCategory()));
        responseHttp.setResponse("Entity created");
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
        responseHttp.setStatus(HttpStatus.OK.value());
        responseHttp.setMessage("Success");

        if(postID == null) {
            throw new BadRequestException(BadRequestCodeValidation.ERR_OO1, HttpStatus.OK);
        }

        Optional<PostModel> searched = postRepository.findById(postID);

        if(searched.isEmpty()) {
            responseHttp.setResponse("Registry not found");
            return responseHttp;   
        }


        postRepository.deleteById(postID);
        responseHttp.setResponse("Deleted correctly");
        return responseHttp;
    }

    @Override
    public ResponseHttp searchPostByAttribute(Long postID, String title, Timestamp date, String category) {
        ResponseHttp responseHttp = new ResponseHttp();
        responseHttp.setStatus(HttpStatus.OK.value());
        responseHttp.setMessage("Success");
        
        if(postID != null) {
            Optional<PostModel> result = postRepository.findById(postID);
            responseHttp.setResponse(result);
        }

        if(title != null) {
            List<PostModel> result = postRepository.findByTitle(title);
            responseHttp.setResponse(result);
        }

        if(category != null) {
            List<PostModel> result = postRepository.findByCategory(category);
            responseHttp.setResponse(result);
        }
        
        return responseHttp;
    }

    @Override
    public ResponseHttp getAllPost() {
        ResponseHttp responseHttp = new ResponseHttp();
        responseHttp.setStatus(HttpStatus.OK.value());
        responseHttp.setMessage("Success");
        responseHttp.setResponse(postRepository.findAll());
        return responseHttp;
    }
}
