<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            font-family: Georgia, serif;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            color: black;
            text-decoration: none;
        }
        .title{
            position: absolute;
            top: 10px;
            left: 10px
        }
    </style>
    <title>Pipizza</title>
</head>
<body>
<h1 class="title"><a href="/"><strong>PIPIZZA</strong> <img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 45px"></a></h1>
<h4>Подробная информация о заказе</h4>
<h3>Корзина пользователя: ${order.user.id}</h3>
<#list order.getOrderComponents() as cart_product>
<div>
    <p><b>${cart_product.title}</b> ${cart_product.price} руб. Кол-во: ${cart_product.quantity} <a href="/product/${cart_product.id}">Подробнее...</a></p>
</div>
<h2>Сумма заказа: ${order.total}</h2>
</#list>
</body>
</html>