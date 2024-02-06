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
            Meeting reservation ><a href="/roomDetail/${room.id}">Modifying Meeting Room Information</a>
        </div>
        <form action="/updateRoom" method="post">
            <fieldset>
                <legend>Meeting Room Information</legend>
                <table class="formtable">
                    <tr>
                        <td>Room NO:</td>
                        <td>
                            <input name="roomNum" type="text" value="${room.roomNum}" maxlength="10" <#if user?? && (user.role=='2')>disabled</#if>/>
                        </td>
                    </tr>
                    <tr>
                        <td>Meeting Room Name:</td>
                        <td>
                            <input name="name" type="text" value="${room.name}" maxlength="20" <#if user?? && (user.role=='2')>disabled</#if>/>
                        </td>
                    </tr>
                    <tr>
                        <td>Maximum capacity：</td>
                        <td>
                            <input name="capacity" type="text" value="${room.capacity}" <#if user?? && (user.role=='2')>disabled</#if>/>
                        </td>
                    </tr>
                    <tr>
                        <td>Current state：</td>
                        <td>
                            <#if room.status=="0">
                                <input type="radio" name="status" checked="checked" value="0" <#if user?? && (user.role=='2')>disabled</#if>/><label for="status">Enable</label>
                                <input type="radio" value="1" name="status" <#if user?? && (user.role=='2')>disabled</#if>/><label for="status">Closed</label>
                            <#else>
                                <input type="radio" name="status" value="0" <#if user?? && (user.role=='2')>disabled</#if>/><label for="status">Enable</label>
                                <input type="radio" name="status" value="1" checked="checked" <#if user?? && (user.role=='2')>disabled</#if>/><label for="status">Closed</label>
                            </#if>
                        </td>
                    </tr>
                    <tr>
                        <td>notes：</td>
                        <td>
                            <textarea name="desc" maxlength="200" rows="5" cols="60" <#if user?? && (user.role=='2')>disabled</#if>>${room.desc}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="command">
                            <input type="hidden" name="id" value="${room.id}">
                            <#if user?? && (user.role=='1')>
                            <input type="submit" value="Confirm" class="clickbutton" />
                            </#if>
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
