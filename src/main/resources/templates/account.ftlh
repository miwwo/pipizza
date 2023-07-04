<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body{
            font-family: Georgia, serif;
        }
        .card-body{
            border-radius: 20px;
            border: 5px solid black;
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
</head>
<body>
<div class="container">
    <h1 class="title"><a href="/"><strong>PIPIZZA</strong> <img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 45px"></a></h1>
    <hr>
    <h2>Заказы пользователя ${user.name}:</h2>
    <#list orders as order>
        <div class="card">
            <div class="card-body mb-3">
                <h3 class="card-title border-bottom border-dark">ID заказа: ${order.id}</h3>
                <h5>Состав заказа:</h5>
                <ul>
                    <#list order.getOrderComponents() as component>
                        <li>${component.title} ${component.price} руб. X ${component.quantity} ............................... ${component.price*component.quantity} руб.</li>
                    </#list>
                </ul>
                <h5 class="text-right">Сумма заказа: ${order.total} руб.</h5>
            </div>
        </div>
    <#else>
        <h3>Заказов нет</h3>
    </#list>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
