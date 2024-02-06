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
            Meeting reservation ><a href="/meetingRoom">View Meeting Room</a>
        </div>
        <table class="listtable">
            <caption>All meeting rooms:</caption>
            <tr class="listheader">
                <th>Room No</th>
                <th>Room Name</th>
                <th>Capacity</th>
                <th>Current State</th>
                <th>Operate</th>
            </tr>
            <#if rooms??>
                <#list rooms as room>
                    <tr>
                        <td>${room.roomNum}</td>
                        <td>${room.name}</td>
                        <td>${room.capacity}</td>
                        <td style="color:${(room.status=="0")?string('green','red')}">${(room.status=="0")?string("Enable","Closed")}</td>
                        <td>
                            <a class="clickbutton" href="/roomDetail/${room.id}"><#if user?? && (user.role=='1')>Edit<#else>View</#if></a>
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
