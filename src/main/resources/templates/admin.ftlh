<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style>
        body {
            font-family: Georgia, serif;
        }

        .card:hover .card-img-top {
            transform: scale(1.1);
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

        body {
            max-width: 100%;
        }
    </style>
</head>
<body>
<h1 class="title">
    <a href="/"><strong>PIPIZZA</strong> <img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 45px"></a>
</h1>
<div class="container">
        <div class="container mt-5">
            <h3>Имя пользователя: <i>${user.name}</i></h3>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Выйти" class="btn btn-log">
            </form>
            <a href="/account" class="btn">Личный кабинет</a>
            <a href="/cart" class="btn">Корзина</a>
            <a href="/admin/getNewProductForm" class="btn">Создать товар</a>
            <hr>
        <div class="row">
            <div class="col">
                <h4 class="mb-4">Панель администратора</h4>
                <table class="table table-bordered">
                    <tr>
                        <th>Email</th>
                        <th>ID</th>
                        <th>Номер телефона</th>
                        <th>Активность</th>
                        <th>Бан</th>
                    </tr>
                    <#list users as user>
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.email}</td>
                            <td>${user.phoneNumber}</td>
                            <td><#if user.active>Да<#else>Нет</#if></td>
                            <td>
                                <#list user.roles as role>${role}</#list>
                            </td>
                            <td>
                                <form action="/admin/user/ban/${user.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" value="Бан">
                                </form>
                            </td>
                        </tr>
                    <#else>
                        <tr>
                            <td colspan="6"><h3>Пользователей нет</h3></td>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
