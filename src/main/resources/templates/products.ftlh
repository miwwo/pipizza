<!DOCTYPE html>
<html>
<head>
    <title>Pipizza</title>
</head>
<body>
<h1>Pipizza</h1>
<hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <a href="/account">Личный кабинет</a>
    <a href="/user/cart">Корзина</a>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
        <hr>
        <h3>Создать новый товар</h3>
        <form action="/product/create" method="post" enctype="multipart/form-data">
            Название объявления: <input type="text" name="title"/><br><br>
            Описание объявления: <input type="text" name="description"/><br><br>
            Цена: <input type="number" name="price"/><br><br>
            Первая фотография: <input type="file" name="file1"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Добавить товар"/>
        </form>
    </#if>
<#else>
    <a href="/login">Войти</a></h1>
</#if>
<form method="get" action="/">
    <div class="form-row">
        <div class="form-group col-md-10">
            <label for="searchWord">Поиск по объявлениям</label>
            <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                   id="searchWord">
        </div>
        <button type="submit" class="btn btn-dark">Поиск</button>
    </div>
</form>
<hr>
<#list products as product>
    <#if product.isMenuComponent()>
        <div>
            <p><b>${product.title}</b><br>
                <img src="/images/${product.previewImageId}" height="200px"/>
                ${product.price} руб.
            <form action="/user/cart/add/product/${product.getId()}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit/">В корзину</button>
            </form>
            <a href="/product/${product.id}">Подробнее...</a></p>
        </div>
    </#if>
<#else>
    <h3>Товаров нет</h3>
</#list>

</body>
</html>