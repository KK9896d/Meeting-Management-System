<!DOCTYPE html>
<html>
    <head>
        <title>Meeting Management System</title>
        <link rel="stylesheet" href="/static/css/common.css"/>
    </head>
    <body>

    <#include '../top.ftl'>

        <div class="page-body">

            <#include '../leftMenu.ftl'>

            <div class="page-content">
                <div class="content-nav">
                    Meeting reservation ><a href="/cancelMeeting/${meetingVo.id}">Cancel meeting reservation</a>
                </div>
                <form action="/doCancelMeeting" method="post">
                    <fieldset>
                        <legend>cancel the reservation</legend>
                        <table class="formtable">
                            <tr>
                                <td>Meeting Name：</td>
                                <td>${meetingVo.name!''}</td>
                            </tr>
                            <tr>
                                <td>Room Name：</td>
                                <td>${meetingVo.roomName!''}</td>
                            </tr>
                            <tr>
                                <td>Expected Start Time：</td>
                                <td>${meetingVo.startTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            </tr>
                            <tr>
                                <td>Expected End Time：</td>
                                <td>${meetingVo.endTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            </tr>
                            <tr>
                                <td>Reserve Time：</td>
                                <td>${meetingVo.reserveTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            </tr>
                            <tr>
                                <td>Reserve Name：</td>
                                <td>${meetingVo.reserveName}</td>
                            </tr>
                            <tr>
                                <td>Cancel Reason：</td>
                                <td><textarea name="cancelReason" required rows="5"></textarea></td>
                            </tr>
                            <tr>
                                <td class="command" colspan="2">
                                    <input type="hidden" name="id" value="${meetingVo.id}">
                                    <input type="submit" class="clickbutton" value="Confirm Cancel"/>
                                    <input type="button" class="clickbutton" value="Back" onclick="window.history.back();"/>
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