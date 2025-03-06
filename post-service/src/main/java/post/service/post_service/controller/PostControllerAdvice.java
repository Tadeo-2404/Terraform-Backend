package post.service.post_service.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import post.service.post_service.exceptions.BadRequestException;
import post.service.post_service.models.ResponseHttp;

@RestControllerAdvice
public class PostControllerAdvice {
    @ExceptionHandler(BadRequestException.class)
    public ResponseEntity<ResponseHttp> badRequestException(BadRequestException ex) {
        ResponseHttp responseHttp = new ResponseHttp();
        responseHttp.setStatus(ex.getHttpStatus().value());
        responseHttp.setMessage(ex.getMessage());
        responseHttp.setResponse(ex.getCause());
        return new ResponseEntity<ResponseHttp>(responseHttp, HttpStatus.BAD_REQUEST);
    }
}
