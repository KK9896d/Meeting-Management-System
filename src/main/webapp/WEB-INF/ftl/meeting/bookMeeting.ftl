<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Language" content="en"/>
    <title>Meeting Management System</title>
    <link rel="stylesheet" href="/static/css/common.css"/>
    <script src="/static/js/jquery3.5.1.js"></script>
    <script src="/static/My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        #divFrom {
            float: left;
            width: 150px;
        }

        #divTo {
            float: left;
            width: 150px;
        }

        #divOperator {
            float: left;
            width: 50px;
            padding: 60px 5px;
        }

        #divOperator input[type="button"] {
            margin: 10px 0;
        }

        #selDepartments {
            display: block;
            width: 100%;
        }

        #selEmployees {
            display: block;
            width: 100%;
            height: 200px;
        }

        #selSelectedEmployees {
            display: block;
            width: 100%;
            height: 225px;
        }
    </style>
</head>

<body onload="body_load()">

<#include '../top.ftl'>

<div class="page-body">
    <#include '../leftMenu.ftl'>
    <div class="page-content">
        <div class="content-nav">
            Meeting reservation ><a href="/bookMeeting">Reserve Meeting</a>
        </div>
        <form action="/doAddMeeting" method="post">
            <fieldset>
                <legend>Meeting information</legend>
                <table class="formtable">
                    <tr>
                        <td>Meeting Name：</td>
                        <td>
                            <input name="name" required type="text" maxlength="20" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Expected Number：</td>
                        <td>
                            <input name="numberOfPerson" required type="text" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Expected Start Time：</td>
                        <td>
                            <input type="text" class="Wdate" required name="startTime" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Expected End Time：</td>
                        <td>
                            <input type="text" class="Wdate" required name="endTime" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})" />
                        </td>
                    </tr>
                    <tr>
                        <td>Room Name：</td>
                        <td>
                            <select name="roomId">
                                <#list rooms as room>
                                    <option value="${room.id}">${room.name}</option>
                                </#list>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Meeting Description：</td>
                        <td>
                            <textarea name="desc" required rows="5" oninvalid="setCustomValidity('Please fill in this field!');" oninput="setCustomValidity('');"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>Select attendees：</td>
                        <td>
                            <div id="divFrom">
                                <select id="selDepartments" onchange="fillEmployees()">
                                </select>
                                <select id="selEmployees" multiple="true">
                                </select>
                            </div>
                            <div id="divOperator">
                                <input type="button" class="clickbutton" value="&gt;" onclick="selectEmployees()"/>
                                <input type="button" class="clickbutton" value="&lt;" onclick="deSelectEmployees()"/>
                            </div>
                            <div id="divTo">
                                <select name="empIds" id="selSelectedEmployees" multiple="true">
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="command" colspan="2">
                            <input type="submit" class="clickbutton" value="Reserve Meeting"/>
                            <input type="reset" class="clickbutton" value="Reset"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>

<#include '../footer.ftl'>

</body>

<script type="application/javascript">

    var selDepartments;
    var selEmployees;
    var selSelectedEmployees;

    function body_load() {
        selDepartments = document.getElementById("selDepartments");
        selEmployees = document.getElementById("selEmployees");
        selSelectedEmployees = document.getElementById("selSelectedEmployees");

        $.get("/getAllDepts", function (data) {
            for (let i = 0; i < data.length; i++) {
                var item = data[i];
                var dep = document.createElement("option");
                dep.value = item.id;
                dep.text = item.name;
                selDepartments.appendChild(dep);
            }
            fillEmployees();
        })

    }

    function fillEmployees() {
        clearList(selEmployees);
        var deptId = selDepartments.options[selDepartments.selectedIndex].value;
        $.get("/getEmpByDeptId/"+deptId, function (data) {
            for (i = 0; i < data.length; i++) {
                var emp = document.createElement("option");
                emp.value = data[i].id;
                emp.text = data[i].realName;
                selEmployees.appendChild(emp);
            }
        })
    }

    function clearList(list) {
        while (list.childElementCount > 0) {
            list.removeChild(list.lastChild);
        }
    }

    function selectEmployees() {
        for (var i = 0; i < selEmployees.options.length; i++) {
            if (selEmployees.options[i].selected) {
                addEmployee(selEmployees.options[i]);
                selEmployees.options[i].selected = false;
            }
        }
    }

    function deSelectEmployees() {
        var elementsToRemoved = new Array();
        var options = selSelectedEmployees.options;
        for (var i = 0; i < options.length; i++) {
            if (options[i].selected) {
                elementsToRemoved.push(options[i]);
            }
        }
        for (i = 0; i < elementsToRemoved.length; i++) {
            selSelectedEmployees.removeChild(elementsToRemoved[i]);
        }
    }

    function addEmployee(optEmployee) {
        var options = selSelectedEmployees.options;
        var i = 0;
        var insertIndex = -1;
        while (i < options.length) {
            if (optEmployee.value == options[i].value) {
                return;
            } else if (optEmployee.value < options[i].value) {
                insertIndex = i;
                break;
            }
            i++;
        }
        var opt = document.createElement("option");
        opt.value = optEmployee.value;
        opt.text = optEmployee.text;
        opt.selected = true;

        if (insertIndex == -1) {
            selSelectedEmployees.appendChild(opt);
        } else {
            selSelectedEmployees.insertBefore(opt, options[insertIndex]);
        }
    }
</script>

</html>