<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .navbar {
            display: flex;
            justify-content: flex-start;
            background-color: white;
            padding: 10px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            color: #333;
            text-decoration: none;
            padding: 14px 20px;
            margin: 0 10px;
            border: 1px solid transparent;
            transition: background-color 0.3s, color 0.3s, border-color 0.3s;
            
        }

        .navbar a:hover {
            background-color: #f4f4f4;
            color: #000;
            border-color: #ddd;
        }

        .navbar a.active {
            border-color: #000;
        }
    </style>

<div class="navbar">
    <a href="spHome.jsp" class="active">Musteriler</a>
    <a href="#urun">Urunler</a>
    <a href="#order">Siparisler</a>
    <a href="#cart">Sepet</a>
</div>
</body>
</html>