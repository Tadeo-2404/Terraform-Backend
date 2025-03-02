package post.service.post_service.models;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Post")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PostModel {
    @Id
    private Long id;
    private String title;
    private String description;
    private Timestamp date; 
    private String category;
}
