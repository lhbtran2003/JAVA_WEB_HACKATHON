USE hackathon;

CREATE TABLE category
(
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description   TEXT,
    status        BIT DEFAULT 1 -- 1: active, 0: inactive
);

CREATE TABLE product
(
    product_id   INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description  TEXT,
    price        DOUBLE       NOT NULL CHECK (price > 0),
    image_url    VARCHAR(255),
    status       BIT DEFAULT 1, -- 0:inactive, 1:active
    created_at   DATETIME,
    category_id  INT          NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

-- Lấy danh sách danh mục theo thứ tự thêm mơới nhất trên đầu
DELIMITER //

CREATE PROCEDURE GetLatestCategories()
BEGIN
    SELECT * FROM category
    ORDER BY category_id DESC;
END //

DELIMITER ;

-- thêm mới danh mục
DELIMITER //

CREATE PROCEDURE AddCategory(
    IN p_category_name VARCHAR(50),
    IN p_description TEXT
)
BEGIN
    INSERT INTO category (category_name, description)
    VALUES (p_category_name, p_description);
END //

DELIMITER ;

-- lấy danh mục theo id
DELIMITER //

CREATE PROCEDURE GetCategoryById(
    IN p_category_id INT
)
BEGIN
    SELECT * FROM category
    WHERE category_id = p_category_id;
END //

DELIMITER ;

-- sửa tên, mô tả và trạng thái của danh mục.
DELIMITER //

CREATE PROCEDURE UpdateCategory(
    IN p_category_id INT,
    IN p_category_name VARCHAR(50),
    IN p_description TEXT,
    IN p_status BIT
)
BEGIN
    UPDATE category
    SET
        category_name = p_category_name,
        description = p_description,
        status = p_status
    WHERE category_id = p_category_id;
END //

DELIMITER ;

-- tìm kiếm danh mục theo tên
DELIMITER //

CREATE PROCEDURE SearchCategoryByName(
    IN p_search_name VARCHAR(50)
)
BEGIN
    SELECT * FROM category
    WHERE category_name LIKE CONCAT('%', p_search_name, '%');
END //

DELIMITER ;

-- xóa danh mục theo id
DELIMITER //

CREATE PROCEDURE DeleteCategoryById(
    IN p_category_id INT
)
BEGIN
    DELETE FROM category
    WHERE category_id = p_category_id;
END //

DELIMITER ;

-- lay ds spham
DELIMITER //

CREATE PROCEDURE GetLatestProducts()
BEGIN
    SELECT * FROM product
    ORDER BY product_id DESC;
END //

DELIMITER ;

-- thêm mới sản phẩm
DELIMITER //

CREATE PROCEDURE AddProduct(
    IN p_product_name VARCHAR(100),
    IN p_description TEXT,
    IN p_price DOUBLE,
    IN p_image_url VARCHAR(255),
    IN p_category_id INT
)
BEGIN
    INSERT INTO product (
        product_name, description, price, image_url, category_id
    ) VALUES (
                 p_product_name, p_description, p_price, p_image_url, p_category_id
             );
END //

DELIMITER ;

-- sửa tên, mô tả, giá, ảnh, trạng thái và danh mục của sản phẩm .
DELIMITER //

CREATE PROCEDURE UpdateProduct(
    IN p_product_id INT,
    IN p_product_name VARCHAR(100),
    IN p_description TEXT,
    IN p_price DOUBLE,
    IN p_image_url VARCHAR(255),
    IN p_status BIT,
    IN p_category_id INT
)
BEGIN
    UPDATE product
    SET
        product_name = p_product_name,
        description = p_description,
        price = p_price,
        image_url = p_image_url,
        status = p_status,
        category_id = p_category_id
    WHERE product_id = p_product_id;
END //

DELIMITER ;

-- tìm sản phẩm theo tên
DELIMITER //

CREATE PROCEDURE SearchProductByName(
    IN p_search_name VARCHAR(100)
)
BEGIN
    SELECT * FROM product
    WHERE product_name LIKE CONCAT('%', p_search_name, '%');
END //

DELIMITER ;

-- xóa sản phẩm theo id
DELIMITER //

CREATE PROCEDURE DeleteProductById(
    IN p_product_id INT
)
BEGIN
    DELETE FROM product
    WHERE product_id = p_product_id;
END //

DELIMITER ;













