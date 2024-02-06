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
            Personnel management ><a href="/admin/approveAccount">Registration approval</a>
        </div>
        <table class="listtable">
            <caption>Registration information to be approved：</caption>
            <tr class="listheader">
                <th>Employee Name</th>
                <th>Account Name</th>
                <th>Telephone</th>
                <th>Email</th>
                <th>Operate</th>
            </tr>
            <#if emps ??>
                <#list emps as emp>
                    <tr>
                        <td>${emp.realName}</td>
                        <td>${emp.username}</td>
                        <td>${emp.phone}</td>
                        <td>${emp.email}</td>
                        <td>
                            <a type="button" class="clickbutton" href="/admin/updateEmpStatus?id=${emp.id}&status=0">Pass</a>
                            <a type="button" class="clickbutton" href="/admin/updateEmpStatus?id=${emp.id}&status=2">No Pass</a>
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