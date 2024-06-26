<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.*" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Urun Edit formu</title>
    <link rel="stylesheet" >
    <style>
        * {
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 20px;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

form {
    display: flex;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.left-section, .right-section {
    flex: 1;
    margin: 10px;
}

.left-section label,
.right-section label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
}

.left-section input,
.right-section input,
.right-section select {
    width: 100%;
    padding: 8px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

#image-preview {
    margin-top: 10px;
    max-width: 100%;
    height: auto;
    text-align: center;
}

button {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    background-color: #5cb85c;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background-color: #4cae4c;
}
<%
System.out.println(request.getParameter("urunID") );
%>

    </style>
</head>
<body>

    <div class="container">
        <form action="edit" method="GET">
            <div class="left-section">
                <label for="product-image">Ürün Fotoğrafı:</label>
                <input type="file" id="product-image" name="pimage" accept="image/*" onchange="previewImage(event)" 
                value="" >
                <div id="image-preview"></div>
            </div>
            <div class="right-section">
                <label for="product-name">Ürün Adı:</label>
                <input type="text" id="product-name" name="pname" value="<%=request.getParameter("ad")%>" required>
                <label for="product-category">Kategori:</label>
                <select id="product-category" name="pcategory" required>
                    <option value="elektronik">Elektronik</option>
                    <option value="moda">Moda</option>
                    <option value="ev">Ev</option>
                    <option value="ofis">Ofis</option>
                    <option value="anne">Anne</option>
                    <option value="bebek">Bebek</option>
                    <option value="oyuncak">Oyuncak</option>
                    <option value="spor">Spor</option>
                    <option value="ayakkabi">Ayaykkabı</option>
                    <option value="kosmetik">Kosmetik</option>
                    <option value="kisiselbakim">Kişisel Bakım</option>
                    <option value="supermarket">Süpermarket</option>
                    <option value="petshop">Petshop</option>
                    <option value="kitap">Kitap</option>
                    <option value="muzik">Müzik</option>
                    <option value="film">Film</option>
                    <option value="hobi">Hobi</option>
                    <option value="diger">Diğer</option>
                </select>
                <label for="product-quantity">Ürün Sayısı:</label>
                <input type="number" id="product-quantity" name="pquantity" min="0" value=<%=Integer.parseInt(request.getParameter("sayi"))%> required>


                <label for="product-price">Ürün Fiyatı:</label>
                <input type="text" id="product-price" name="pprice" value=<%=request.getParameter("fiyat") %> required>
                <input type="hidden" name="id" value=<%=request.getParameter("email")%> >
                <input type="hidden" name="urunID" value="<%= request.getParameter("urunID") %>" >
                <button type="submit">Urun Edit</button>
            </div>
        </form>
    </div>

    <script>
        function previewImage(event) {
            const imagePreview = document.getElementById('image-preview');
            imagePreview.innerHTML = '';

            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.style.maxWidth = '100%';
                    img.style.height = 'auto';
                    imagePreview.appendChild(img);
                }
                reader.readAsDataURL(file);
            }
        }
    </script>
</body>
</html>