<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body{
            font-family: Georgia, serif;
        }
        .card {
            width: 100%;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            padding-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .card:hover .card-img-top {
            transform: scale(1.1);
        }

        .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        a {
            color: #000000;
            text-decoration: none;
        }
        a:hover {
            color: #000000;
            text-decoration: none;
        }

        .btn-log {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .title{
            position: absolute;
            top: 10px;
            left: 10px
        }
        .btn{
            border-color: #ffa600;
            border-radius: 50px;
            background-color: #ffa600;
        }
        .menu{
            margin-top: 10%;
        }
        body {
            max-width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="title"><strong>PIPIZZA</strong><img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 50px"></h1>
    <hr>
    <div class="adminPanel"></div>
    <#if user.email??>
        <h3>Имя пользователя: <i>${user.name}</i></h3>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Выйти" class="btn btn-log">
        </form>
        <a href="/account" class="btn">Личный кабинет</a>
        <a href="/user/cart" class="btn">Корзина</a>
        <#if user.isAdmin()>
            <a href="/admin" class="btn">Панель администратора</a>
            <hr>
            <h3>Создать новый товар</h3>
            <form action="/product/create" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Название объявления:</label>
                    <input type="text" name="title" id="title" class="form-control">
                </div>
                <div class="form-group">
                    <label for="description">Описание объявления:</label>
                    <input type="text" name="description" id="description" class="form-control">
                </div>
                <div class="form-group">
                    <label for="price">Цена:</label>
                    <input type="number" name="price" id="price" class="form-control">
                </div>
                <div class="form-group">
                    <label for="file1">Первая фотография:</label>
                    <input type="file" name="file1" id="file1" class="form-control-file">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Добавить товар" class="btn">
            </form>
        </#if>
    <#else>
        <a href="/login" class="btn btn-log">Войти</a>
    </#if>
    <div class="menu">
        <form method="get" action="/" class="d-flex align-items-center">
            <div class="form-group col-md-10 d-flex align-items-center justify-content-between">
                <label for="searchWord"></label>
                <input placeholder="Поиск" type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control">
                <button type="submit" class="btn">Поиск</button>
            </div>
        </form>

        <hr>
        <div class="row">
            <#list products as product>
                <#if product.isMenuComponent()>
                    <div class="col-md-3">
                        <div class="card">
                            <img src="/images/${product.previewImageId}" class="card-img-top" alt="Product Image">
                            <div class="card-body">
                                <h5 class="card-title"><a href="/product/${product.id}">${product.title}</a></h5>
                                <p class="card-text">${product.price} руб.</p>
                            </div>
                            <div class="card-footer">
                                <form action="/user/cart/add/product/${product.getId()}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button type="submit" class="btn">В корзину</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </#if>
            </#list>
        </div>
    </div>
    </div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
