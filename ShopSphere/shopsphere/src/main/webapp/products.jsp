
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shopsphere.Product" %>
<%@ page import="com.shopsphere.ProductDAO" %>
<%
    List<Product> products = new java.util.ArrayList<>();

    try {
        products = new ProductDAO().getAllProducts();
    } catch (Exception e) {
        application.log("Could not load ShopSphere products", e);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopSphere | Products</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #fff8fb;
            color: #292334;
        }

        header {
            background: linear-gradient(120deg, #ff5c8a, #9b5de5);
            color: white;
            padding: 22px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .logo {
            font-size: 27px;
            font-weight: bold;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
        }

        .hero {
            text-align: center;
            padding: 45px 15px 25px;
        }

        .hero h1 {
            font-size: 36px;
            color: #9b3dbb;
            margin-bottom: 12px;
        }

        .hero p {
            color: #756b7c;
            font-size: 16px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            padding: 25px 7% 55px;
        }

        .product-card {
            background: white;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(80, 40, 90, 0.10);
            transition: transform 0.25s, box-shadow 0.25s;
        }

        .product-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 10px 25px rgba(80, 40, 90, 0.17);
        }

        .product-card img {
            width: 100%;
            height: 230px;
            object-fit: cover;
            display: block;
            background: #f5eaf4;
        }

        .product-info {
            padding: 18px;
        }

        .category {
            color: #a04ac0;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .product-info h2 {
            font-size: 19px;
            margin: 10px 0;
        }

        .description {
            color: #777080;
            font-size: 14px;
            line-height: 1.5;
            min-height: 42px;
        }

        .price {
            font-size: 21px;
            font-weight: bold;
            color: #e84376;
            margin: 15px 0;
        }

        .add-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            color: white;
            background: linear-gradient(120deg, #ff5c8a, #9b5de5);
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .add-btn:hover {
            opacity: 0.88;
        }

        footer {
            background: #30243b;
            color: white;
            text-align: center;
            padding: 22px;
        }

        @media (max-width: 500px) {
            header {
                justify-content: center;
                text-align: center;
            }

            nav a {
                margin: 0 8px;
            }

            .hero h1 {
                font-size: 29px;
            }
        }
    </style>
</head>

<body>

    <header>
        <div class="logo">ShopSphere ✨</div>

        <nav>
    <a href="index.jsp">Home</a>
    <a href="products.jsp">Products</a>
    <a href="cart.jsp">🛒 My Cart</a>
</nav>
    </header>

    <section class="hero">
        <h1>Find Your Favourite ✨</h1>
        <p>Trendy picks, lovely prices and a little shopping happiness!</p>
    </section>

    <main class="products">

    <% for (Product product : products) { %>

        <div class="product-card">

            <img
    src="<%= request.getContextPath() %>/images/<%= product.getImageUrl() %>"
    alt="<%= product.getName() %>"
    onerror="this.alt='Product image unavailable';">

            <div class="product-info">

                <span class="category">ShopSphere Pick</span>

                <h2><%= product.getName() %></h2>

                <p class="description">
                    <%= product.getDescription() %>
                </p>

               <p style="color: #6b6275; font-size: 14px; margin-bottom: 15px;">
    📦 Stock Available: <strong><%= product.getStock() %></strong> units
</p>
                       <button class="add-btn"
    onclick="addToCart(this.dataset.name, Number(this.dataset.price))"
    data-name="<%= product.getName().replace("&", "&amp;").replace("\"", "&quot;").replace("<", "&lt;").replace(">", "&gt;") %>"
    data-price="<%= product.getPrice() %>">
    Add to Cart
</button>
            </div>
        </div>

    <% } %>

    <% if (products.isEmpty()) { %>
        <p>No products available right now.</p>
    <% } %>

</main>

    <footer>
        <p>© 2026 ShopSphere | Made for your happy shopping ✨</p>
    </footer>

    <script>
        
function addToCart(productName, price) {
    const cartKey = "shopsphereCart";
    let cart = [];

    try {
        cart = JSON.parse(localStorage.getItem(cartKey) || "[]");
        if (!Array.isArray(cart)) {
            cart = [];
        }
    } catch (error) {
        cart = [];
    }

    const existingProduct = cart.find(
        item => item.name === productName
    );

    if (existingProduct) {
        existingProduct.quantity =
            (Number(existingProduct.quantity) || 1) + 1;
    } else {
        cart.push({
            name: productName,
            price: price,
            quantity: 1
        });
    }

    localStorage.setItem(cartKey, JSON.stringify(cart));

    alert(productName + " added to your cart! 🛒");
}

    </script>

</body>
</html>
