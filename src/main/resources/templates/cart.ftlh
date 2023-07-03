<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
</head>
<body>
<h1>Pipizza</h1><hr>
<#if user.email??>
    <h3>Корзина пользователя: ${user.name}</h3>
    <#list cart_products as cart_product>
        <div>
            <p><b>${cart_product.title}</b> ${cart_product.price} руб. Кол-во: ${cart_product.quantity} <a href="/product/${cart_product.id}">Подробнее...</a></p>
            <form action="/user/cart/remove/product/${cart_product.getId()}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit/">Удалить</button>
            </form>
        </div>
    <#else>
        <h3>Товаров нет</h3>
    </#list>
    <#if (user.cart?size > 0) >
        <h2>Сумма заказа: ${user.total}</h2>
        <form action="/user/create/order" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Сделать заказ!</button>
        </form>
    </#if>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
<#else>
    <h2><a href="/login}">Авторизируйтесь</a> или <a href="/registration}">зарегитрируйтесь</a>, чтобы заказать у нас вкуснейшую пиццу!</h2>
</#if>
</body>
</html>