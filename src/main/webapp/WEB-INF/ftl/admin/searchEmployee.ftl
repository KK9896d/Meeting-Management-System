<!DOCTYPE html>
<html lang="en">
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
            Personnel management ><a href="/admin/searchEmployee?status=1">Search Employee</a>
        </div>
        <form action="/admin/searchEmployee" method="post">
            <fieldset>
                <legend>Search Employee</legend>
                <table class="formtable">
                    <tr>
                        <td>Employee Name：</td>
                        <td>
                            <input name="realName" type="text"
                                   value="<#if employee??>${employee.realName!''}</#if>" maxlength="20"/>
                        </td>
                        <td>Account Name：</td>
                        <td>
                            <input name="username" type="text"
                                   value="<#if employee??>${employee.username!''}</#if>" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Status：</td>
                        <td colspan="3">
                            <#if employee??>
                                <#if employee.status=="0">
                                    <input checked="checked"  type="radio" name="status" value="0"/><label>Normal</label>
                                    <input type="radio" name="status" value="1"/><label>Approval</label>
                                    <input type="radio" name="status" value="2"/><label>Closed</label>
                                <#elseif employee.status=="1">
                                    <input type="radio" name="status" value="0"/><label>Normal</label>
                                    <input checked="checked" type="radio" name="status" value="1"/><label>Approval</label>
                                    <input type="radio" name="status" value="2"/><label>Closed</label>
                                <#elseif employee.status=="2">
                                    <input type="radio" name="status" value="0"/><label>Normal</label>
                                    <input type="radio" name="status" value="1"/><label>Approval</label>
                                    <input checked="checked" type="radio" name="status" value="2"/><label>Closed</label>
                                </#if>
                            <#else>
                                <input type="radio" name="status" value="0"
                                       checked="checked"/><label>Normal</label>
                                <input type="radio" name="status" value="1"/><label>Approval</label>
                                <input type="radio" name="status" value="2"/><label>Closed</label>
                            </#if>
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
                <div class="header-info">
                    total <span class="info-number">${total}</span> results,
                    divide <span class="info-number">${pageNum}</span> page,
                    current <span class="info-number">${page}</span> page,Display 10 items per page
                </div>
                <div class="header-nav">

                    <a class="clickbutton" href='/admin/searchEmployee?page=1&status=${employee.status}'>
                        <input type="button" class="clickbutton" value="home page"/>
                    </a>

                    <a class="clickbutton" href='/admin/searchEmployee?page=<#if page gt 1>${page-1}<#else>1</#if>&status=${employee.status}'>
                        <input type="button" class="clickbutton" value="previous page "/>
                    </a>
                    <a class="clickbutton" href='/admin/searchEmployee?page=<#if page < pageNum>${page+1}<#else>${pageNum}</#if>&status=${employee.status}'>
                        <input type="button" class="clickbutton" value="next page"/>
                    </a>

                    <a class="clickbutton" href='/admin/searchEmployee?page=${pageNum}&status=${employee.status}'>
                        <input type="button" class="clickbutton" value="end page"/>
                    </a>
                </div>
            </div>
        </div>
        <table class="listtable">
            <tr class="listheader">
                <th>Employee Name</th>
                <th>Account Name</th>
                <th>Telephone</th>
                <th>Email</th>
                <th>Operate</th>
            </tr>
            <#if emps??>
                <#list emps as emp>
                    <tr>
                        <td>${emp.realName}</td>
                        <td>${emp.username}</td>
                        <td>${emp.phone}</td>
                        <td>${emp.email}</td>
                        <td>
                            <a class="clickbutton" href="/admin/closeEmp/${emp.id}">Close Account</a>
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
