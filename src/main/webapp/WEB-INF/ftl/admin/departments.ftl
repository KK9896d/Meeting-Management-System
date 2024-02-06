<!DOCTYPE html>
<html>
<head>
    <title>Meeting Management System</title>
    <link rel="stylesheet" href="/static/css/common.css"/>
    <script src="/static/js/jquery3.5.1.js"></script>
</head>
<body>

<#include '../top.ftl'>

<div class="page-body">

    <#include '../leftMenu.ftl'>

    <div class="page-content">
        <div class="content-nav">
            Personnel management ><a href="/admin/depts">Department management</a>
        </div>
        <form action="/admin/addDept" method="post">
            <fieldset>
                <legend>Add Department</legend>
                Department Name:
                <input type="text" required name="name" maxlength="20" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                <input type="submit" class="clickbutton" value="Add"/>

                <#if error??>
                    <span style="color: red">${error!''}</span>
                </#if>

            </fieldset>
        </form>

        <table class="listtable">
            <caption>All Department:</caption>
            <tr class="listheader">
                <th>Department NO</th>
                <th>Department Name</th>
                <th>Operate</th>
            </tr>

            <#if depts??>
                <#list depts as dept>
                    <tr>
                        <td>${dept.id}</td>
                        <td id="deptName${dept.id}">${dept.name}</td>
                        <td>
                            <a class="clickbutton" href="#" id="edit${dept.id}"
                               onclick="editDept(${dept.id})">Edit</a>
                            <a class="clickbutton" style="display: none" href="#" id="cancel${dept.id}"
                               onclick="cancelDept(${dept.id})">Cancel</a>
                            <a class="clickbutton" href="/admin/deleteDept/${dept.id}">Delete</a>
                        </td>
                    </tr>
                </#list>
            </#if>
        </table>
    </div>
</div>

<#include '../footer.ftl'>

<script>

    var deptNameInput;

    function editDept(depId) {
        var editBtn = $('#edit' + depId);
        var cancelBtn = $('#cancel' + depId);
        var ele = $('#deptName' + depId);
        deptNameInput = ele.html();


        if (cancelBtn.css('display') == 'none') {
            cancelBtn.css('display', 'inline');
            editBtn.html('Confirm');
            var deptName = ele.text();
            ele.html('<input type="text" required value="' + deptName + '" />')
        }else{
            var children = ele.children('input');
            var newDeptName = children.val();

            var oldDeptName = $(deptNameInput).get(0).value

            if(newDeptName.trim()==''){
                alert('Department name cannot be empty');
                ele.html(oldDeptName)
                cancelBtn.css('display', 'none');
                editBtn.html('Edit');
                return;
            }

            var oldDeptName = $(deptNameInput).get(0).value

            if(newDeptName==oldDeptName){
                ele.html(oldDeptName)
                cancelBtn.css('display', 'none');
                editBtn.html('Edit');
                return;
            }

            $.post('/admin/updateDept',{id:depId, name:newDeptName},function (msg) {
                if (msg == 'success') {
                    cancelBtn.css('display', 'none');
                    editBtn.html('Edit');
                    ele.html(newDeptName);
                }
                else {
                    alert(msg);
                    ele.html(oldDeptName)
                    cancelBtn.css('display', 'none');
                    editBtn.html('Edit');

                }
            })
        }
    }

    function cancelDept(depId) {
        var editBtn = $('#edit' + depId);
        var cancelBtn = $('#cancel' + depId);
        var ele = $('#deptName' + depId);
        cancelBtn.css('display', 'none');
        editBtn.html('Edit');
        ele.html(deptNameInput);
    }

</script>
</body>
</html>