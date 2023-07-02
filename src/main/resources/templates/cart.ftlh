<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
</head>
<body>
<h1>Pipizza</h1><hr>
<h3>Корзина пользователя: ${user.name}</h3>
<#list cart_products as cart_product>
    <div>
        <p><b>${cart_product.title}</b> ${cart_product.price} руб. | <a href="/product/${cart_product.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Товаров нет</h3>
</#list>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>