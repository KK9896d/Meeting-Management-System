<!DOCTYPE html>
<html>
    <head>
        <title>Meeting Management System</title>
        <link rel="stylesheet" href="/static/css/common.css"/>
    </head>
    <body>

    <#include 'top.ftl'>

        <div class="page-body">

            <#include 'leftMenu.ftl'>

            <div class="page-content">
                <div class="content-nav">
                    Change password
                </div>
                <form action="/doChangePassword" method="post">
                    <fieldset>
                        <legend>Change password information</legend>
                        <table class="formtable" style="width:50%">
                            <tr>
                                <td>Original password:</td>
                                <td>
                                    <input name="oldPassword" required type="password" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                                </td>
                            </tr>
                            <tr>
                                <td>New password:</td>
                                <td>
                                    <input id="newPassword" name="newPassword" required type="password" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm password：</td>
                                <td>
                                    <input id="confirm" name="confirm" required type="password" onchange="check()" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                                    <div style="color: #ff0114" id="confirmInfo">${error!''}</div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="submit" value="Confirm" class="clickbutton"/>
                                    <input type="button" value="Back" class="clickbutton" onclick="window.history.back();"/>
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
            var password = document.getElementById('newPassword');
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
