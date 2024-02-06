<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">CalmMeeting 1.0.0</h1>
<h4 align="center">Based on the SpringMVC + Mybatis + Freemarker framework</h4>

## Project Introduction
Implement an online conference room reservation system.

1. Employee users: Through user authentication, users can query meeting room information, manage appointments, register and submit, and change passwords.
2. Administrator: After user authentication, it is possible to maintain conference room information, query reservation status, conference room reservations, employee information, and register for approval.



## Project Technology
*The front-end adopts HTML 5, CSS, JavaScript, and Freemarker templates;
*The backend adopts Spring, Spring MVC, and Mybatis;
*Use MySQL database for data storage;
*The front-end and back-end data exchange adopts the HTTP transmission protocol, while the back-end uses declarative transaction management and account access interceptors;
*The project adopts Maven management to rely on Jar packages;
*The project supports account and password login authentication, and controls the display effect of the left menu through different user identities.



## Database design
1. Department table, storing department information
2. Employee table, storing member room reservation system employee system
3. Meeting reservation table, storing meeting reservation information
4. Meeting_ Employee Meeting Employee Table, storing meeting related personnel information
5. Room Meeting Room Table, storing basic information about the meeting room



## Project functions
Personal Center
1. Latest notice: Display user participation and cancellation of meetings.
2. My reservation: Display the meeting information I have booked and can be cancelled.
3. My Meeting: Information about the meetings I have attended.

Personnel management
1. Employee registration: Submit employee registration information.
2. Department Management: Administrator Department Information Management Add, Modify, Delete.
3. Registration approval: The administrator approves the information of registered employees, and after approval, the system can be officially used.
4. Search for employees: Administrators can search for employee related information and account management operations.

Meeting reservation
1. Add Meeting Room: The administrator adds a meeting room.
2. View Meeting Room: View meeting room information.
3. Meeting reservation: Employee meeting room reservation submission.
4. Search for meetings: Check the booking status of meeting rooms.

Public parts
1. Login: System account login authentication.
2. Password modification: Employee password modification.



## Project deployment
1. In the MySQL database, execute the sqlsql file in the project directory, create the database, and create tables. Database name: calling account: root password: mysql123
2. Deploy CalmMeeting through the Eclipse (the Tomcat console), with the context root "/".
3. Start Tomcat, run the project, and access http://localhost:8080/login .

-- Environment configuration tips:
* Properties for calmmenting -> Web Project Settings -> Context root: "/"
* Properities for calmmenting -> Deployment Assembly -> Add -> Java Bulid Path Entries -> "Maven Dependencies"



## Administrator User
- Account name(Manger): Admin
- Password: admin123



## Project coding overview
* Controller -- Responsible for request forwarding, accepting parameters from the page, passing them to the Service for processing, receiving the return value, and then passing them to the page.
* interceptor - interceptor, login interception, determines whether the user is logged in, and the login status is saved in the server session.
* mapper -- Use mybaties to add, delete, check and modify database tables.
* pojo -- entity class corresponding to table operations, such as employee entity and conference room entity
* service -- Responsible for business module logic processing.
* utils -- MD5 encryption tool class, for user password encryption.
* resources -- springBean, transaction, and interceptor related configurations.
* webapp -- static page uses css javascript, jquery and other page static resources.
* ftl -- Freemarker page template displays data.
* web.xml -- Configure servlet, servlet-mapping, filter, listener, startup loading level, etc.
* pom.xml -- Manage project dependency jars through maven.










