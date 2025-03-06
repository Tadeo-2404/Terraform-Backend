package post.service.post_service.exceptions;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BadRequestException extends RuntimeException {
    private final String errorMessage;
    private final String information;
    private final HttpStatus httpStatus;

    public BadRequestException(BadRequestExceptionCode errorCode, HttpStatus httpStatus) {
        super(errorCode.getErrorMessage());
        this.errorMessage = errorCode.getErrorMessage();
        this.information = errorCode.getInformation();
        this.httpStatus = httpStatus;
    }

    @AllArgsConstructor
    @Getter
    public enum BadRequestExceptionCode {
        ERROR1("Incorrect data", "incorrect data");

        private final String errorMessage;
        private final String information;
    }
}

