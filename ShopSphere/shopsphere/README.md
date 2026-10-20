# ShopSphere – Online Shopping Web Application

## Project Overview
ShopSphere is a Java-based online shopping web application. It displays products with images, descriptions, prices, and available stock.

## Features
- Product listing
- Product images and descriptions
- Product prices
- Stock availability
- Add to Cart functionality
- MySQL database integration
- Responsive and colorful user interface

## Technologies Used
- Java
- JSP (JavaServer Pages)
- HTML
- CSS
- JavaScript
- Apache Maven
- Apache Tomcat 11
- MySQL

## Database
Database name: `shopsphere`

Table name: `products`

The products table stores product IDs, names, descriptions, prices, image URLs, and stock quantities.

## How to Run
1. Install the required Java JDK, Maven, Apache Tomcat, and MySQL.
2. Create or configure the `shopsphere` database.
3. Configure the database connection settings in the project.
4. Build the project using `mvn clean package`.
5. Deploy `target/shopsphere.war` to Tomcat's `webapps` directory.
6. Start Tomcat and open `http://localhost:8080/shopsphere/`.

## Developer
Created as a college Java project.
