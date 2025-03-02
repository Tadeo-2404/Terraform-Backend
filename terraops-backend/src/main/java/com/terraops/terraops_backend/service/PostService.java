package com.terraops.terraops_backend.service;

import java.sql.Timestamp;

import com.terraops.terraops_backend.models.ResponseHttp;
import com.terraops.terraops_backend.utils.PostCreateRequest;
import com.terraops.terraops_backend.utils.PostEditRequest;

public interface PostService {
    ResponseHttp createPost(PostCreateRequest postCreateRequest);
    ResponseHttp editPost(PostEditRequest postEditRequest);
    ResponseHttp deletePost(Long postID);
    ResponseHttp searchPostByAttribute(Long postID, String title, Timestamp date, String category);
}
