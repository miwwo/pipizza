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
        p{
            font-size: large;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="title">
        <a href="/"><strong>PIPIZZA</strong> <img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 45px"></a>
    </h1>
    <h4 class="mt-4"></h4>
    <div class="mt-4">
        <#list images as img>
            <img src="/images/${img.id}" height="500px" class="mb-4"/><br>
        </#list>
        <p><b>Название товара: </b>${product.title}</p>
        <p><b>Цена: </b>${product.price}</p>
        <p><b>Описание товара: </b>${product.description}</p>
    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
