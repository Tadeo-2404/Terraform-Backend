package post.service.post_service.service;

import java.sql.Timestamp;

import post.service.post_service.models.ResponseHttp;
import post.service.post_service.utils.PostCreateRequest;
import post.service.post_service.utils.PostEditRequest;

public interface PostService {
    ResponseHttp createPost(PostCreateRequest postCreateRequest);
    ResponseHttp editPost(PostEditRequest postEditRequest);
    ResponseHttp deletePost(Long postID);
    ResponseHttp searchPostByAttribute(Long postID, String title, Timestamp date, String category);
    ResponseHttp getAllPost();
}
