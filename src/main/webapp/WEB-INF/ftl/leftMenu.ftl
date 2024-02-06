<div class="page-sidebar">
    <div class="sidebar-menugroup">
        <div class="sidebar-grouptitle">Personal Center</div>
        <ul class="sidebar-menu">
            <li class="sidebar-menuitem"><a href="/notice">Latest notifications</a></li>
            <li class="sidebar-menuitem active"><a href="/myBooking">My reservation</a></li>
            <li class="sidebar-menuitem"><a href="/myMeeting">My Meeting</a></li>
        </ul>
    </div>
    <div class="sidebar-menugroup">
        <div class="sidebar-grouptitle">Personnel management</div>
        <ul class="sidebar-menu">
            <li class="sidebar-menuitem"><a href="/register">Employee registration</a></li>
            <#if user?? && (user.role=='1')>
                <li class="sidebar-menuitem"><a href="/admin/depts">Department management</a></li>
                <li class="sidebar-menuitem"><a href="/admin/approveAccount">Registration approval</a></li>
                <li class="sidebar-menuitem"><a href="/admin/searchEmployee?status=1">Search employee</a></li>
            </#if>
        </ul>
    </div>
    <div class="sidebar-menugroup">
        <div class="sidebar-grouptitle">Meeting reservation</div>
        <ul class="sidebar-menu">
            <#if user?? && (user.role=='1')>
                <li class="sidebar-menuitem"><a href="/admin/addMeetingRoom">Add Meeting Room</a></li>
            </#if>
            <li class="sidebar-menuitem"><a href="/meetingRoom">View Meeting Room</a></li>
            <li class="sidebar-menuitem"><a href="/bookMeeting">Reserve Meeting</a></li>
            <li class="sidebar-menuitem"><a href="/searchMeeting">Search Meeting</a></li>
        </ul>
    </div>
</div>

