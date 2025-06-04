package liliana.java_web_hackathon.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    private int categoryId;
    private String categoryName;
    private String description;
    private boolean status;

    public Category(String categoryName, String description, boolean status) {
        this.categoryName = categoryName;
        this.description = description;
        this.status = status;
    }
}
