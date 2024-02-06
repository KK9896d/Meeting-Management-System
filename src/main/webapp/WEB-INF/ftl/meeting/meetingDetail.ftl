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
                    Meeting reservation ><a href="/meetingDetail/${meetingVo.id}">Meeting details</a>
                </div>
                <form>
                    <fieldset>
                        <legend>Meeting information</legend>
                        <table class="formtable">
                            <tr>
                                <td>Meeting Name：</td>
                                <td>${meetingVo.name!''}</td>
                            </tr>
                            <tr>
                                <td>Meeting Status：</td>
                                <td style="color:${(meetingVo.status=='0')?string('green','red')}">
                                    ${(meetingVo.status=="0")?string("Normal","Canceled")}
                                </td>
                            </tr>
                            <tr>
                                <td>Room Name：</td>
                                <td>${meetingVo.roomName!''}</td>
                            </tr>
                            <tr>
                                <td>Expected Number：</td>
                                <td>${meetingVo.employeeList?size}</td>
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
                                <td>Meeting Description：</td>
                                <td>
                                    <textarea name="desc" rows="5" readonly>${meetingVo.desc!''}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>Participants：</td>
                                <td>
                                    <table class="listtable">

                                        <tr class="listheader">
                                            <th>Name</th>
                                            <th>Telephone</th>
                                            <td>Email</td>
                                        </tr>

                                        <#if meetingVo??>
                                            <#list meetingVo.employeeList as emp>
                                                <tr>
                                                    <td>${emp.realName}</td>
                                                    <td>${emp.phone}</td>
                                                    <td>${emp.email}</td>
                                                </tr>
                                            </#list>
                                        </#if>

                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="command" colspan="2">
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