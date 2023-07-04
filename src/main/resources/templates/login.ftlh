    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            body{
                font-family: Georgia, serif;
            }
            .custom-btn{
                border-radius: 50px;
                background-color: #bfff00;
            }
            a {
                color: #68940d;
                text-decoration: none;
            }
            .card{
                box-shadow: 0 0 20px rgb(104, 148, 13);
            }
        </style>
        <title>Pipizza</title>
    </head>
    <body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card col-6">
            <div class="card-body">
                <h1 class="card-title text-center"><strong>PIPIZZA</strong><img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 50px"></h1>

                <hr>
                <h4>Авторизация</h4>
                <form action="/login" method="post">
                    <div class="form-group">
                        <label for="username">Email:</label>
                        <input type="email" class="form-control" id="username" name="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Пароль:</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" class="btn custom-btn" value="ВОЙТИ"/>
                </form>
                <br>Если нет аккаунта, то <a href="/registration"><strong>зарегистрируйся!</strong></a>
            </div>
        </div>
    </div>
    </body>
    </html>
