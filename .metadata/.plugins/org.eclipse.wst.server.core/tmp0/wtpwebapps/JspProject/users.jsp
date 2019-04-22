<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shachar.first.*"%>
<%@ page import="java.util.*"%>

<%
	if (request.getSession().getAttribute("validUser") == null) {
		request.getSession().setAttribute("validUser", "disconnected");
	}
%>
<%
	UserDatabase userDatabase = new UserDatabase();
	PostDatabase postDatabase = new PostDatabase();
	List<User> users = userDatabase.getAllEntities();
%>
<!DOCTYPE html>
<html dir="rtl">
<head>
<title>FirstForum</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body class="users">
	<div class="menuBar">
		<%
			String email = (String)request.getSession().getAttribute("currentUserEmail");
			if (request.getSession().getAttribute("validUser").equals("right")) {
		%>
		<a href='oneUser.jsp?email=<%=email%>'><div class='menuBarOption user_link'></div></a>
		<div class='menuBarOption sign_up_in'>
			<a href='dbLogout.jsp'>התנתק</a>
		</div>

		<%
			}

			else {
		%>

		<div class='menuBarOption user_link'></div>
		<div class='menuBarOption sign_up_in'>
			<a href='register.jsp'>הירשם</a>
		</div>
		<%
			}
		%>
		<div class="menuBarOption sign_up_in">
			<a href="signIn.jsp">היכנס</a>
		</div>
		<div class="menuBarOption users_option">
			<a href="quiz.jsp">חידון</a>
		</div>
		<%
			if (request.getSession().getAttribute("validUser").equals("right")) {
		%>
		<div class="menuBarOption post_option">
			<a href="postPost.jsp">פרסם פוסט</a>
		</div>

		<%
			}

			else {
		%>
		<div class="menuBarOption post_option">פרסם פוסט</div>
		<%
			}
		%>
		<div class="menuBarOption in_forum">
			<a href="forumBase.jsp">פורום</a>
		</div>
		<div class="menuBarOption users_option">
			<a href="users.jsp">משתמשים</a>
		</div>
		<div class="first-logo">
			<div class="menuBarOption">
				<a href="https://www.firstisrael.org.il/"><img
					src="img/FIRSTWordMark_Black.gif" class="first-logo-img" /></a>
			</div>
		</div>
	</div>
	<div class="big_container">
		<table class="container">
			<tr>
				<td class="header big_td">שם משתמש</td>
				<td class="header small_td">פוסטים</td>
				<td class="header med_td">תחרות</td>
				<td class="header med_td">קבוצה</td>
				<td class="header big_td">תפקיד בקבוצה</td>
				<td class="header med_td">שנת הצטרפות</td>
			</tr>
			<%
				for (User user : users) {
			%><tr>
				<td class='big_td'><a href='oneUser.jsp?email=<%=user.getEmail()%>'><%=user.getUsername()%></a></td>
				<td class='small_td'><%=postDatabase.getUserPostsByEmail(user.getEmail()).size()%></td>
				<td class='med_td'><%=user.getCompType()%></td>
				<td class='med_td'><%=user.getTeamNumber()%></td>
				<td class='big_td'><%=user.getTeamJob()%></td>
				<td class='med_td'><%=user.getRookieTime()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>
