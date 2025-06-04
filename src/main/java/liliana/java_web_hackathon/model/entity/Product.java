package liliana.java_web_hackathon.model.entity;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int id;
    @NotBlank(message = "Ten san pham khong duoc de trong")
    private String name;

    @NotBlank(message = "Mô tả san pham khong duoc de trong")
    private String description;

    @NotNull(message = "ko dc de trong")
    @Positive(message = "Gia san pham phai la 1 so nguyen duong lon hon 0")
    private Double price;

    MultipartFile file;

    String img_url;

    boolean status;

    String create_at;

    int category_id;

    public Product(int id, String name, String description, Double price, String img_url ,boolean status, String create_at, int category_id) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.img_url = img_url;
        this.status = status;
        this.create_at = create_at;
        this.category_id = category_id;
    }
}
