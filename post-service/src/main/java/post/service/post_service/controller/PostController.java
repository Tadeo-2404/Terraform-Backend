package post.service.post_service.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import post.service.post_service.models.ResponseHttp;
import post.service.post_service.serviceImpl.PostServiceImpl;
import post.service.post_service.utils.PostCreateRequest;
import post.service.post_service.utils.PostEditRequest;

import io.swagger.annotations.ApiOperation;

import java.sql.Timestamp;

import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;


@RestController
@RequestMapping("/v1/post")
public class PostController {
    private final PostServiceImpl postServiceImpl;

    public PostController(PostServiceImpl postServiceImpl) {
        this.postServiceImpl = postServiceImpl;
    }

    @GetMapping("/get-all")
    @ApiOperation(value = "Retrieve post object", notes = "get method")
    public ResponseEntity<ResponseHttp> getAllPosts() {
        return new ResponseEntity<>(postServiceImpl.getAllPost(), HttpStatus.OK);
    }

    @GetMapping("/get-post")
    @ApiOperation(value = "Retrieve post object", notes = "get method")
    public ResponseEntity<ResponseHttp> searchPostByAttribute(@Param("id") String ID, @Param("title") String title, @Param("date") String date,  @Param("category") String category) {
        return new ResponseEntity<>(postServiceImpl.searchPostByAttribute(ID != null ? Long.parseLong(ID) : null, title != null ? title : null, date != null ? Timestamp.valueOf(date) : null, category != null ? category : null), HttpStatus.OK);
    }

    @PostMapping("/")
    @ApiOperation(value = "Creation of post object", notes = "post method")
    public ResponseEntity<ResponseHttp> createPost(@RequestBody PostCreateRequest postCreateRequest) {
        return new ResponseEntity<>(postServiceImpl.createPost(postCreateRequest), HttpStatus.CREATED);
    }
    
    @PutMapping("/edit-post/{id}")
    @ApiOperation(value = "Edition of post object", notes = "put method")
    public ResponseEntity<ResponseHttp> editPost(@RequestBody PostEditRequest postEditRequest) {
        return new ResponseEntity<>(postServiceImpl.editPost(postEditRequest), HttpStatus.OK);
    }

    @DeleteMapping("/delete-post/{id}")
    @ApiOperation(value = "Edition of post object", notes = "delete method")
    public ResponseEntity<ResponseHttp> deletePost(@RequestBody Long ID) {
        return new ResponseEntity<>(postServiceImpl.deletePost(ID), HttpStatus.OK);
    }
}
