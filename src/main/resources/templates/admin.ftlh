<!DOCTYPE html>
<html>
<head>
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
        .title {
            top: 5px;
            left: 10px;
            font-size: 2.5rem;
        }
        table {
            margin-top: 20px;
        }
    </style>
    <title>Pipizza</title>
</head>
<body>
<div class="container">
    <div style="display: flex; align-items: center"><h1 class="title"><a href="/"><strong>PIPIZZA</strong></a></h1><img src="https://i.ibb.co/vqX1LfW/logo.png" alt="logo" border="0" style="width: 45px"></div>
    <div>
        <h4>Панель администратора</h4>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Номер телефона</th>
                <th>Активность</th>
                <th>Роли</th>
                <th>Бан</th>
            </tr>
            <#list users as user>
                <tr>
                    <td>${user.id}</td>
                    <td>${user.email}</td>
                    <td>${user.phoneNumber}</td>
                    <td><#if user.active>true<#else>false</#if></td>
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
</body>
</html>
