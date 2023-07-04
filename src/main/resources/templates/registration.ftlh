<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            font-family: Georgia, serif;
        }
        .custom-btn{
            border-radius: 50px;
            background-color: #ffa600;
        }
        a {
            color: #ffa600;
            text-decoration: none;
        }
        .card{
            box-shadow: 0 0 20px rgb(180, 121, 10);
        }
    </style>
    <title>Pipizza</title>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card col-6">
        <div class="card-body">
            <h1 class="card-title text-center"><strong>PIPIZZA</strong> <img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 50px"></h1>
            <hr>
            <h4>Регистрация</h4>
            <form action="/registration" method="post">
                <div class="form-group">
                    <label for="name">Имя пользователя:</label>
                    <input required type="text" class="form-control" id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input required type="email" class="form-control" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Номер телефона:</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                </div>
                <div class="form-group">
                    <label for="password">Пароль:</label>
                    <input required type="password" class="form-control" id="password" name="password">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" class="btn custom-btn" value="ЗАРЕГИСТРИРОВАТЬСЯ"/>
            </form>
            <br>Если аккаунта есть, то <a href="/login"><strong>авторизируйся!</strong></a>
            <#if errorMessage??>
                <h2 style="color: red">${errorMessage}</h2>
            </#if>
        </div>
    </div>
</div>
</body>
</html>
