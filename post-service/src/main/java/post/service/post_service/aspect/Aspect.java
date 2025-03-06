package post.service.post_service.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Aspect {
    @AfterThrowing(value = "execution(* post.service.post_service.service.PostService.*(..))", throwing = "error")
    public void afterThrowingAdvice(JoinPoint jp, Throwable error) {
        System.out.println("Method Signature: " + jp.getSignature());
        System.out.println("Exception: " + error);
    }
}
