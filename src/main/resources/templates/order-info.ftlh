<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
</head>
<body>
<h1>Pipizza</h1><hr>
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