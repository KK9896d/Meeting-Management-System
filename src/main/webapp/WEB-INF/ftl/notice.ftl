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
            Personal Center ><a href="/notice">Latest notifications</a>
        </div>
        <table class="listtable">
            <caption>
                The meeting I attended:
            </caption>
            <tr class="listheader">
                <th>Meeting Name</th>
                <th>Meeting Room</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Reserve Name</th>
                <th>Operate</th>
            </tr>

            <#if normalMeetings??>
                <#list normalMeetings as nm>
                    <tr>
                        <td>${nm.name}</td>
                        <td>${nm.roomName}</td>
                        <td>${nm.startTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${nm.endTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${nm.reserveName}</td>
                        <td>
                            <a class="clickbutton" href="/meetingDetail/${nm.id}">View</a>
                        </td>
                    </tr>
                </#list>
            </#if>

        </table>
        <table class="listtable">
            <caption>
                Canceled meetings:
            </caption>
            <tr>
                <th style="width:150px">Meeting Name</th>
                <th>Meeting Room</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Reserve Name</th>
                <th>Cancel Reason</th>
                <th>Operate</th>
            </tr>

            <#if cancelMeetings??>
                <#list cancelMeetings as cm>
                    <tr>
                        <td>${cm.name}</td>
                        <td>${cm.roomName}</td>
                        <td>${cm.startTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${cm.endTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${cm.reserveName}</td>
                        <td>${(cm.cancelReason?trim)}</td>
                        <td>
                            <a class="clickbutton" href="/meetingDetail/${cm.id}">View</a>
                        </td>
                    </tr>
                </#list>
            </#if>

        </table>

    </div>

</div>

<#include 'footer.ftl'>

</body>
</html>