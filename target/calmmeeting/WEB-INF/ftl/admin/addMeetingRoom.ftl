<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Language" content="en"/>
        <title>Meeting Management System</title>
        <link rel="stylesheet" href="/static/css/common.css"/>
    </head>
    <body>

    <#include '../top.ftl'>

        <div class="page-body">

            <#include '../leftMenu.ftl'>

            <div class="page-content">
                <div class="content-nav">
                    Meeting reservation ><a href="/admin/addMeetingRoom">Add Meeting Room</a>
                </div>
                <form action="/admin/doAddMr" method="post">
                    <fieldset>
                        <legend>Meeting Room Information</legend>
                        <table class="formtable">
                            <tr>
                                <td>Room NO:</td>
                                <td>
                                    <input name="roomNum" type="text" required placeholder="eg：201" maxlength="10" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Meeting Room Name:</td>
                                <td>
                                    <input name="name" type="text" required placeholder="eg：First Meeting Room" maxlength="20" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Maximum capacity：</td>
                                <td>
                                    <input name="capacity" type="text" required placeholder="Fill in a positive integer" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Current state：</td>
                                <td>
                                    <input type="radio" name="status" checked="checked" value="0"/><label for="status">Enable</label>
                                    <input type="radio" name="status" value="1"/><label for="status">Closed</label>
                                </td>
                            </tr>
                            <tr>
                                <td>Notes：</td>
                                <td>
                                    <textarea name="desc" maxlength="200" rows="5" cols="60" placeholder="Text description within 200 words"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="submit" value="Add" class="clickbutton"/>
                                    <input type="reset" value="Reset" class="clickbutton"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
        </div>

    <#include '../footer.ftl'>

    </body>
</html>
