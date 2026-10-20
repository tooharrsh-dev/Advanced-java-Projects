
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopSphere | My Cart</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #fff8fb;
            color: #30243b;
        }

        header {
            background: linear-gradient(120deg, #ff5c8a, #9b5de5);
            color: white;
            padding: 22px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
        }

        .logo {
            font-size: 26px;
            font-weight: bold;
        }

        header a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        main {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }

        h1 {
            color: #9b3dbb;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #756b7c;
            margin-bottom: 25px;
        }

        #cart-items {
            display: grid;
            gap: 15px;
        }

        .cart-item {
            background: white;
            padding: 20px;
            border-radius: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            box-shadow: 0 4px 15px #30243b12;
        }

        .item-name {
            font-size: 18px;
            font-weight: bold;
        }

        .item-price {
            color: #e84376;
            margin-top: 7px;
        }

        .controls {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        button {
            cursor: pointer;
            border: none;
            border-radius: 8px;
            padding: 9px 13px;
            font-weight: bold;
        }

        .quantity-btn {
            background: #f0e4ff;
            color: #783bb1;
        }

        .remove-btn {
            background: #ffe5ec;
            color: #c62855;
        }

        .summary {
            margin-top: 25px;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 15px #30243b12;
        }

        .total {
            display: flex;
            justify-content: space-between;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .checkout-btn {
            width: 100%;
            color: white;
            padding: 14px;
            font-size: 16px;
            background: linear-gradient(120deg, #ff5c8a, #9b5de5);
        }

        .continue {
            display: inline-block;
            margin-top: 20px;
            color: #9b3dbb;
            text-decoration: none;
            font-weight: bold;
        }

        .empty {
            background: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            color: #756b7c;
        }
    </style>
</head>

<body>

<header>
    <div class="logo">ShopSphere ✨</div>
    <a href="products.jsp">← Continue Shopping</a>
</header>

<main>
    <h1>My Shopping Cart 🛒</h1>
    <p class="subtitle">Your favourite picks, all in one place!</p>

    <div id="cart-items"></div>

    <section class="summary">
        <div class="total">
            <span>Total</span>
            <span id="grand-total">₹0</span>
        </div>

        <button class="checkout-btn" onclick="checkout()">
            Proceed to Checkout
        </button>
    </section>

    <a class="continue" href="products.jsp">← Continue Shopping</a>
</main>

<script>
    const CART_KEY = "shopsphereCart";

    function getCart() {
        try {
            const data = JSON.parse(localStorage.getItem(CART_KEY) || "[]");
            return Array.isArray(data) ? data : [];
        } catch (error) {
            return [];
        }
    }

    function saveCart(cart) {
        localStorage.setItem(CART_KEY, JSON.stringify(cart));
    }

    function renderCart() {
        const cart = getCart();
        const container = document.getElementById("cart-items");
        container.innerHTML = "";

        if (cart.length === 0) {
            container.innerHTML =
                '<div class="empty">Your cart is empty! 🛍️<br><br>' +
                'Visit Products and add something you love.</div>';
        }

        let total = 0;

        cart.forEach((item, index) => {
            const quantity = Math.max(1, Number(item.quantity) || 1);
            const price = Math.max(0, Number(item.price) || 0);
            const subtotal = price * quantity;
            total += subtotal;

            const row = document.createElement("div");
            row.className = "cart-item";

            const details = document.createElement("div");
            const name = document.createElement("div");
            name.className = "item-name";
            name.textContent = item.name;

            const priceText = document.createElement("div");
            priceText.className = "item-price";
            priceText.textContent =
                "₹" + price.toLocaleString("en-IN") +
                " each · Subtotal ₹" + subtotal.toLocaleString("en-IN");

            details.append(name, priceText);

            const controls = document.createElement("div");
            controls.className = "controls";

            const minus = document.createElement("button");
            minus.className = "quantity-btn";
            minus.textContent = "−";
            minus.onclick = () => changeQuantity(index, -1);

            const qty = document.createElement("span");
            qty.textContent = quantity;

            const plus = document.createElement("button");
            plus.className = "quantity-btn";
            plus.textContent = "+";
            plus.onclick = () => changeQuantity(index, 1);

            const remove = document.createElement("button");
            remove.className = "remove-btn";
            remove.textContent = "Remove";
            remove.onclick = () => removeItem(index);

            controls.append(minus, qty, plus, remove);
            row.append(details, controls);
            container.appendChild(row);
        });

        document.getElementById("grand-total").textContent =
            "₹" + total.toLocaleString("en-IN");
    }

    function changeQuantity(index, change) {
        const cart = getCart();

        if (!cart[index]) return;

        cart[index].quantity = (Number(cart[index].quantity) || 1) + change;

        if (cart[index].quantity <= 0) {
            cart.splice(index, 1);
        }

        saveCart(cart);
        renderCart();
    }

    function removeItem(index) {
        const cart = getCart();
        cart.splice(index, 1);
        saveCart(cart);
        renderCart();
    }

    function checkout() {
        const cart = getCart();

        if (cart.length === 0) {
            alert("Your cart is empty! Please add a product first.");
            return;
        }

        alert("Cart ready! We will build the checkout page next.");
    }

    renderCart();
</script>

</body>
</html>
