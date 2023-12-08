<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <!-- Bootstrap JS bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: Georgia, serif;
        }

        .card {
            width: 100%;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            transition: transform 0.3s ease;
        }

        .card-img-top {
            height: 250px;
            padding-left: 11px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .card-img-popup{
            height: 500px;
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
            color: aqua;
            text-decoration: none;
        }

        .btn-log {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .title {
            position: absolute;
            top: 10px;
            left: 10px
        }

        .btn {
            border-color: #ffa600;
            border-radius: 50px;
            background-color: #ffa600;
        }

        .menu {
            margin-top: 10%;
        }

        body {
            max-width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="title"><a href="/"><strong>PIPIZZA</strong> <img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo"
                                                                border="0" style="width: 45px"></a></h1>
    <hr>
    <#if user.email??>
        <h3>Имя пользователя: <i>${user.name}</i></h3>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Выйти" class="btn btn-log">
        </form>
        <a href="/account" class="btn">Личный кабинет</a>
        <a href="/cart" class="btn">Корзина</a>
        <#if user.isAdmin()>
            <a href="/admin" class="btn">Панель администратора</a>
            <hr>
            <h3>Создать новый товар</h3>
            <form action="/admin/product/create" method="post" enctype="multipart/form-data">
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
                    <#if bindingResult?has_content && bindingResult.hasFieldErrors("price")>
                        <p style="color: red">${bindingResult.getFieldError("price").defaultMessage}</p>
                    </#if>
                </div>
                <div class="form-group">
                    <label for="file1">Фотография продукта:</label>
                    <input type="file" name="file1" id="file1" class="form-control-file">
                </div>
                <#if picError?has_content>
                    <p style="color: red">${picError}</p>
                </#if>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Добавить товар" class="btn">
            </form>
        </#if>
    </#if>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
