<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
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
        .card-body{
            border-radius: 20px;
            border: 5px solid black;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="title">
        <a href="/"><strong>PIPIZZA</strong> <img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 45px"></a>
    </h1>
    <div class="mt-4">
            <h3>Корзина пользователя: ${user.name}</h3>
            <#list cart_products as cart_product>
                <div class="card mb-1">
                    <div class="card-body" style="border: none">
                        <h5 class="card-title">${cart_product.title}</h5>
                        <p class="card-text">Цена: ${cart_product.price} руб.</p>
                        <p class="card-text">Количество: ${cart_product.quantity}</p>
                        <div class="text-right">
                            <a href="/menu/product/${cart_product.id}" class="btn btn-primary" style="background-color: orange;border: none">Подробнее...</a>
                            <form action="/cart/remove/product/${cart_product.getId()}" method="post" class="d-inline ml-2">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-danger">Удалить</button>
                            </form>
                        </div>
                    </div>
                </div>
            </#list>
            <#if (user.cart?size > 0) >
                <h2 class="text-right">Сумма заказа: ${user.total} руб.</h2>
                <form action="/order/create" method="post" class="mt-3">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-success">Сделать заказ!</button>
                </form>
            <#else>
                <h3>Корзина пока пустая, но Вы можете это исправить!
                    <br><a href="/" style="color: orange; font-weight: bold">Перейдите туда, где вкусная пицца!</a></h3>
                <img src="https://i.ibb.co/Zm2JL34/pizza-cat.gif" alt="pizza-cat" border="0">
            </#if>

    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
