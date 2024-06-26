<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="services.CartService" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <%ArrayList<Cart> cartList =(ArrayList)request.getSession().getAttribute("ses");
    CartService cservice = new CartService(); 
    double toplam = cservice.cartCost(cartList);
    %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basit Ödeme Sayfası</title>
    <link rel="stylesheet">
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 600px;
}

h2, h3 {
    text-align: center;
}

.cart-summary, .payment-method {
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table, th, td {
    border: 1px solid #ddd;
    text-align: left;
    padding: 8px;
}

th {
    background-color: #f2f2f2;
}

tfoot td {
    font-weight: bold;
}

label {
    display: block;
    margin-bottom: 10px;
}

button {
    display: block;
    width: 100%;
    background-color: blue;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}


    </style>
</head>
<body>
    <div class="container">
        <h2>Ödeme Sayfası</h2>
        <div class="cart-summary">
            <h3>Sepet Özeti</h3>
            <table>
                 <thead>
                    <tr>
                        <th>Urun</th>
                        <th>Sayi</th>
                        <th>Fiyat</th>
                    </tr>
                </thead>
            <%if(!cartList.isEmpty()){
            for(Cart cart:cartList){ %>
                <thead>
                    <tr>
                        <th><%=cart.getAd()%></th>
                        <th><%=cart.getSayi() %></th>
                        <th><%=cart.getFiyat() %>$</th>
                    </tr>
                </thead>
            <%}} %>
                <tfoot>
                    <tr>
                        <td colspan="2">Toplam</td>
                        <td><%=toplam %>$</td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <div class="payment-method">
            <h3>Ödeme Yöntemi</h3>
            <form action="pay" method=Post>
                <label>
                    <input type="radio" name="payment" value="card" required> Kredi Kartı
                </label><br>
                <label>
                    <input type="radio" name="payment" value="cash" required> Nakit
                </label>
                <input type="hidden" name="id" value="cart">
        <button type="submit">Ödemeyi Tamamla</button>
            </form>
        </div>
    </div>
</body>
</html>