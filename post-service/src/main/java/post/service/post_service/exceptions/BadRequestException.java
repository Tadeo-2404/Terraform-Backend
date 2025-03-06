package post.service.post_service.exceptions;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class BadRequestException extends RuntimeException{
    private BadRequestCodeValidation badRequestCodeValidation;
    private HttpStatus httpStatus;

    @Getter
    @AllArgsConstructor
    public static enum BadRequestCodeValidation {
        ERR_OO1("Incorrect data", "Incorrect data");
        String message;
        String informacion;
    }
    
    public BadRequestException(BadRequestCodeValidation badRequestCodeValidation, HttpStatus httpStatus) {
        super(badRequestCodeValidation.getMessage());
        this.badRequestCodeValidation = badRequestCodeValidation;
        this.httpStatus = httpStatus;
    }
}