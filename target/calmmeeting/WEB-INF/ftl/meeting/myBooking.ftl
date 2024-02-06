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
                    Personal Center ><a href="/myBooking">My reservation</a>
                </div>
                <table class="listtable">
                    <caption>My reserved meeting：</caption>

                    <tr class="listheader">
                        <th>Meeting Name</th>
                        <th>Meeting Status</th>
                        <th>Room Name</th>
                        <th>Meeting Start Time</th>
                        <th>Meeting End Time</th>
                        <th>Reserve Time</th>
                        <th>Operate</th>
                    </tr>

                    <#if meetingVos??>
                        <#list meetingVos as meetingVo>
                            <tr>
                                <td>${meetingVo.name}</td>
                                <td style="color:${(meetingVo.status=='0')?string('green','red')}">
                                    ${(meetingVo.status=="0")?string("Normal","Canceled")}
                                </td>
                                <td>${meetingVo.roomName}</td>
                                <td>${meetingVo.startTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td>${meetingVo.endTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td>${meetingVo.reserveTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td>
                                    <a class="clickbutton" href="/meetingDetail/${meetingVo.id}">View</a>
                                    <#if meetingVo.status=="0">
                                        <a class="clickbutton" href="/cancelMeeting/${meetingVo.id}">Cancel</a>
                                    </#if>
                                </td>
                            </tr>
                        </#list>
                    </#if>

                </table>
            </div>
        </div>

    <#include '../footer.ftl'>

    </body>
</html>
