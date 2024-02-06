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
            Personnel management ><a href="/register">Employee register</a>
        </div>
        <form action="/doRegister" method="post">
            <fieldset>
                <legend>Employee information</legend>
                <div style="color: #ff0114">${error!''}</div>
                <table class="formtable" style="width:50%">
                    <tr>
                        <td>Employee name：</td>
                        <td>
                            <input name="realName" type="text" required value="<#if employee??>${employee.realName}</#if>" maxlength="20" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Account name：</td>
                        <td>
                            <input name="username" type="text" required value="<#if employee??>${employee.username}</#if>" maxlength="20" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Password：</td>
                        <td>
                            <input name="password" type="password" required id="password" maxlength="20" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm password：</td>
                        <td>
                            <input type="password" id="confirm" required maxlength="20" onchange="check()" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                            <div style="color: #ff0114" id="confirmInfo"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Telephone：</td>
                        <td>
                            <input name="phone" type="text" value="<#if employee??>${employee.phone}</#if>" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Email：</td>
                        <td>
                            <input name="email" type="text" value="<#if employee??>${employee.email}</#if>" maxlength="20"/>
                        </td>
                    </tr>
                    <td>Department：</td>
                    <td>
                        <select name="deptId">
                            <#if depts??>
                                <#list depts as dept>
                                    <option value="${dept.id}">${dept.name}</option>
                                </#list>
                            </#if>
                        </select>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="command">
                            <input type="submit" class="clickbutton" value="Register"/>
                            <input type="reset" class="clickbutton" value="Reset"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>

<#include 'footer.ftl'>

<script>
    // check password
    function check() {
        var password = document.getElementById('password');
        var confirm = document.getElementById('confirm');
        var confirmInfo = document.getElementById('confirmInfo');
        if (password.value !== confirm.value) {
            confirmInfo.innerHTML = 'The passwords entered twice are inconsistent';
            confirm.value="";
        }else{
            confirmInfo.innerHTML = '';
        }
    }
</script>
</body>
</html>