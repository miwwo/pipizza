<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
</head>
<body>
<h1>Pipizza</h1><hr>
<h3>Подробная информация о пользователе ${user.name}</h3>
<b>Номер телефона: </b> ${user.phoneNumber}<br>
<h2>Заказы пользователя</h2>
<#list orders as order>
    <div>
        <p><b>${order.id}</b> ${order.total} руб. <a href="/order/${order.id}">Подробнее...</a></p>
    </div>
    <#else>
    <h3>Заказов нет</h3>
</#list>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>