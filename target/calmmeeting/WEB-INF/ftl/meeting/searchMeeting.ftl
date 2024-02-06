<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Meeting Management System</title>
        <link rel="stylesheet" href="/static/css/common.css"/>
        <script src="/static/js/jquery3.5.1.js"></script>
        <script src="/static/My97DatePicker/WdatePicker.js"></script>
    </head>
    <body>

    <#include '../top.ftl'>

        <div class="page-body">

            <#include '../leftMenu.ftl'>

            <div class="page-content">
                <div class="content-nav">
                    Meeting reservation ><a href="/searchMeeting">Search Meeting</a>
                </div>
                <form action="/doSearchMeeting" method="post">
                    <fieldset>
                        <legend>Search Meeting</legend>
                        <table class="formtable">
                            <tr>
                                <td>Meeting Name：</td>
                                <td>
                                    <input type="text" name="name" value="<#if name??>${name!''}</#if>" maxlength="20"/>
                                </td>
                                <td>Room Name：</td>
                                <td>
                                    <input type="text" name="roomName" value="<#if roomName??>${roomName!''}</#if>" maxlength="20"/>
                                </td>
                                <td>Reserve Name：</td>
                                <td>
                                    <input type="text" name="reserveName" value="<#if reserveName??>${reserveName!''}</#if>" maxlength="20"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Reserve Time：</td>
                                <td colspan="5">
                                    From <input id="reserveTimeFrom" class="Wdate" onclick="WdatePicker({readOnly:'true',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                type="text" value="${reserveTimeFrom!''}" name="reserveTimeFrom">
                                    To <input id="reserveTimeTo" class="Wdate" onclick="WdatePicker({readOnly:'true',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                              type="text" value="${reserveTimeTo!''}" name="reserveTimeTo">

                                </td>
                            </tr>
                            <tr>
                                <td>Meeting Time：</td>
                                <td colspan="5">
                                    From <input id="startTimeFrom" class="Wdate" onclick="WdatePicker({readOnly:'true',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                type="text" value="${startTimeFrom!''}" name="startTimeFrom">
                                    To <input id="startTimeTo" class="Wdate" onclick="WdatePicker({readOnly:'true',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                              type="text" value="${startTimeTo!''}" name="startTimeTo">

                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="command">
                                    <input type="submit" class="clickbutton" value="Query"/>
                                    <input type="reset" class="clickbutton" value="Reset"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
                <div>
                    <h3 style="text-align:center;color:black">Query Results</h3>
                    <div class="pager-header">


                    </div>
                </div>
                <table class="listtable">
                    <tr class="listheader">
                        <th>Meeting Name</th>
                        <th>Meeting Status</th>
                        <th>Room Name</th>
                        <th>Meeting Start Time</th>
                        <th>Meeting End Time</th>
                        <th>Reserve Time</th>
                        <th>Reserve Name</th>
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
                                <td>${meetingVo.reserveName}</td>
                                <td>
                                    <a class="clickbutton" href="/meetingDetail/${meetingVo.id}">View</a>
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