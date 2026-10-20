
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopSphere | Shop Smart</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f8f8fb;
            color: #222;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 8%;
            background: #17172b;
            color: white;
        }

        .logo {
            font-size: 26px;
            font-weight: bold;
            color: #f6c85f;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 22px;
        }

        .hero {
            text-align: center;
            padding: 90px 20px;
            background: linear-gradient(135deg, #25254b, #6b4eff);
            color: white;
        }

        .hero h1 {
            font-size: 44px;
            margin-bottom: 18px;
        }

        .hero p {
            font-size: 18px;
            margin-bottom: 28px;
        }

        .shop-btn {
            display: inline-block;
            padding: 13px 28px;
            background: #f6c85f;
            color: #17172b;
            text-decoration: none;
            border-radius: 7px;
            font-weight: bold;
        }

        .section {
            padding: 45px 8%;
            text-align: center;
        }

        .categories {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 25px;
        }

        .category {
            background: white;
            padding: 28px;
            width: 190px;
            border-radius: 12px;
            box-shadow: 0 4px 15px #00000010;
        }

        .category h3 {
            margin-bottom: 10px;
        }

        footer {
            text-align: center;
            padding: 22px;
            background: #17172b;
            color: white;
        }

        @media (max-width: 600px) {
            nav {
                flex-direction: column;
                gap: 15px;
            }

            nav a {
                margin: 0 7px;
            }

            .hero h1 {
                font-size: 32px;
            }
        }
    </style>
</head>

<body>

<nav>
    <div class="logo">ShopSphere</div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="products">Products</a>
        <a href="login.jsp">Login</a>
    </div>
</nav>

<section class="hero">
    <h1>Discover Your Next Favourite</h1>
    <p>Everything you love, all in one place.</p>
    <a class="shop-btn" href="products">Explore Products</a>
</section>

<section class="section">
    <h2>Shop by Category</h2>

    <div class="categories">
        <div class="category">
            <h3>Fashion</h3>
            <p>Discover your style</p>
        </div>

        <div class="category">
            <h3>Electronics</h3>
            <p>Upgrade your tech</p>
        </div>

        <div class="category">
            <h3>Home & Living</h3>
            <p>Make yourself at home</p>
        </div>

        <div class="category">
            <h3>Accessories</h3>
            <p>Complete your look</p>
        </div>
    </div>
</section>

<footer>
    <p>© 2026 ShopSphere | Your Shopping Destination</p>
</footer>

</body>
</html>
