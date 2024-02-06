<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Language" content="en"/>
    <title>Meeting Management System</title>
    <link rel="stylesheet" href="/static/css/common.css"/>
</head>
<body>

<#include 'top.ftl'>

<div class="page-body">

    <#include 'leftMenu.ftl'>

    <div class="page-content">
        <div class="content-nav">
            Login
        </div>
        <form action="/doLogin" method="post">
            <fieldset>
                <legend>Login information</legend>
                <table class="formtable" style="width:50%">
                    <tr>
                        <td>Account name:</td>
                        <td>
                            <input name="username" type="text" required oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <input name="password" type="password" required oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="command">
                            <input type="submit" value="Login" class="clickbutton"/>
                            <input type="button" value="Back" class="clickbutton" onclick="window.history.back();"/>
                        </td>
                    </tr>
                </table>
                <div style="color: #ff0114">${error!''}</div>
            </fieldset>
        </form>
    </div>
</div>

<#include 'footer.ftl'>

</body>
</html>
