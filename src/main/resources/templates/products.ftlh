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

        .menu {
            margin-top: 10%;
        }

        body {
            max-width: 100%;
        }
        .remove-button:focus{
            border: 0;
            background: transparent;
            outline: none;
            cursor: pointer;
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
         </#if>
    <#else>
        <a href="/login" class="btn btn-log">Войти</a>
    </#if>
    <div class="menu">
        <form method="get" action="/" class="d-flex align-items-center">
            <div class="form-group col-md-10 d-flex align-items-center justify-content-between">
                <label for="searchWord"></label>
                <input placeholder="Поиск" type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if>
                       class="form-control">
                    <label style="margin-left: 10px" for="sort">Сортировка:</label>
                    <select style="width: 500px" name="sort" class="form-control">
                        <option value="price_asc">По возрастанию цены</option>
                        <option value="price_desc">По убыванию цены</option>
                    </select>
                <button style="margin-left: 5px" type="submit" class="btn">Поиск</button>
            </div>
        </form>

        <hr>
        <div class="row">
            <#list products as product>
                <#if product.isMenuComponent()>
                    <div class="col-md-3">
                        <div class="card">
                            <a data-bs-toggle="modal" data-bs-target="#myModal${product.getId()}">
                                <img src="/images/${product.previewImageId}" class="card-img-top" alt="Product Image">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">${product.title}</h5>
                                <p class="card-text">${product.price} руб.</p>
                            </div>
                            <div class="card-footer d-flex justify-content-between align-items-center">
                                <form action="/cart/add/product/${product.getId()}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button type="submit" class="btn">В корзину</button>
                                </form>
                                <#if user.isAdmin()>
                                    <form action="/admin/product/delete/${product.getId()}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <button type="submit" class="remove-button" style="border: 0; background: transparent">
                                            <img src="https://i.ibb.co/QQ4JzPC/remove.png" style="width: 30px;"
                                                 alt="remove"></button>
                                    </form>
                                </#if>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="myModal${product.getId()}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel">${product.title}</h4>
                                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <img src="/images/${product.previewImageId}" class="card-img-popup" alt="Product Image">
                                        <p>${product.description}</p>
                                    </div>
                                </div>
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
