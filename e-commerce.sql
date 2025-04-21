CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Product Category Table
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Product Table
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    fk_brand_id INT,
    fk_category_id INT,
    base_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (fk_brand_id) REFERENCES brand(id),
    FOREIGN KEY (fk_category_id) REFERENCES product_category(id)
);

-- Product Image Table
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url TEXT NOT NULL,
    fk_product_id INT,
    FOREIGN KEY (fk_product_id) REFERENCES product(id)
);

-- Color Table
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    hex_code VARCHAR(7)
);

-- Size Category Table
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Size Option Table
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50) NOT NULL,
    fk_size_category_id INT,
    FOREIGN KEY (fk_size_category_id) REFERENCES size_category(id)
);

-- Product Item Table
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_product_id INT,
    fk_color_id INT,
    fk_size_option_id INT,
    stock INT DEFAULT 0,
    price DECIMAL(10, 2),
    FOREIGN KEY (fk_product_id) REFERENCES product(id),
    FOREIGN KEY (fk_color_id) REFERENCES color(id),
    FOREIGN KEY (fk_size_option_id) REFERENCES size_option(id)
);

-- Product Variation Table
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_product_id INT,
    fk_color_id INT,
    fk_size_option_id INT,
    FOREIGN KEY (fk_product_id) REFERENCES product(id),
    FOREIGN KEY (fk_color_id) REFERENCES color(id),
    FOREIGN KEY (fk_size_option_id) REFERENCES size_option(id)
);

-- Attribute Category Table
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Attribute Type Table
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Product Attribute Table
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    value TEXT,
    fk_product_id INT,
    fk_attribute_category_id INT,
    fk_attribute_type_id INT,
    FOREIGN KEY (fk_product_id) REFERENCES product(id),
    FOREIGN KEY (fk_attribute_category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (fk_attribute_type_id) REFERENCES attribute_type(id)
);


-- Sample Data Inserts

-- Brands
INSERT INTO brand (name, description) VALUES 
('Nike', 'Sportswear and sneakers brand'),
('Samsung', 'Electronics and appliances');

-- Product Categories
INSERT INTO product_category (name, description) VALUES 
('Clothing', 'Apparel and garments'),
('Electronics', 'Electronic devices and gadgets');

-- Colors
INSERT INTO color (name, hex_code) VALUES 
('Red', '#FF0000'),
('Blue', '#0000FF');

-- Size Categories
INSERT INTO size_category (name) VALUES 
('Clothing Sizes'),
('Shoe Sizes');

-- Size Options
INSERT INTO size_option (label, fk_size_category_id) VALUES 
('S', 1),
('M', 1),
('L', 1),
('42', 2),
('43', 2);

-- Attribute Categories
INSERT INTO attribute_category (name) VALUES 
('Physical'), 
('Technical');

-- Attribute Types
INSERT INTO attribute_type (name) VALUES 
('Text'), 
('Number'), 
('Boolean');

-- Products
INSERT INTO product (name, description, fk_brand_id, fk_category_id, base_price) VALUES 
('Nike Running T-Shirt', 'Comfortable and breathable running shirt', 1, 1, 29.99),
('Samsung Galaxy S21', 'Latest Samsung smartphone', 2, 2, 799.99);

-- Product Images
INSERT INTO product_image (image_url, fk_product_id) VALUES 
('https://example.com/images/nike-shirt.jpg', 1),
('https://example.com/images/galaxy-s21.jpg', 2);

-- Product Items (variations of products that can be purchased)
INSERT INTO product_item (fk_product_id, fk_color_id, fk_size_option_id, stock, price) VALUES 
(1, 1, 1, 100, 29.99),
(1, 2, 2, 50, 29.99);

-- Product Variations (optional mappings)
INSERT INTO product_variation (fk_product_id, fk_color_id, fk_size_option_id) VALUES 
(1, 1, 1),
(1, 2, 2);

-- Product Attributes
INSERT INTO product_attribute (name, value, fk_product_id, fk_attribute_category_id, fk_attribute_type_id) VALUES 
('Material', 'Polyester', 1, 1, 1),
('Weight', '200', 2, 1, 2),
('Waterproof', 'true', 2, 2, 3);
