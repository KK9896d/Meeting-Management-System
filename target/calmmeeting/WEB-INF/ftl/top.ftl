<div class="page-header">
    <div class="header-banner">
        <img src="/static/img/head.png" alt="calmMeeting"/>
    </div>
    <div class="header-title">
        Welcome to CalmDown Meeting Management System
    </div>
    <div class="header-quicklink">
        Welcome,
        <#if user??>
            <span>${user.realName!''}</span>
            <a href="/changePassword">[change password] </a>
        <#else>
            <strong>Tourist</strong>
        </#if>
        <#if user??>
            <a href="/logOut">Log out</a>
        </#if>
    </div>
</div>