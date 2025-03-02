package com.terraops.terraops_backend.serviceImpl;

import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import com.terraops.terraops_backend.models.ResponseHttp;
import com.terraops.terraops_backend.repository.PostRepository;
import com.terraops.terraops_backend.service.PostService;
import com.terraops.terraops_backend.utils.PostCreateRequest;
import com.terraops.terraops_backend.utils.PostEditRequest;
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
}
