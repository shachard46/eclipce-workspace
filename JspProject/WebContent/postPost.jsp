<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shachar.first.*"%>

<%
	if (request.getSession().getAttribute("validUser") == null) {
		request.getSession().setAttribute("validUser", "disconnected");
	}
%>
<%
	PostDatabase postDatabase = new PostDatabase();
	TopicDatabase topicDatabase = new TopicDatabase();
	UserDatabase userDatabase = new UserDatabase();
%>
<!DOCTYPE html>
<html dir="rtl">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Insert title here</title>
</head>
<body>
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

		<div class="menuBarOption post_option">
			<a href="postPost.jsp">פרסם פוסט</a>
		</div>
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
	<form name="postPost" action="dbPost.jsp" method="post"
		onsubmit="checkPostPost()">
		<table class="container post_container">
			<tr>
				<td class="textareaTd" colspan="2"><label
					class="post_name_label">שם הפוסט:</label> <br> <textarea
						name="postName" class="post_post_name"></textarea></td>
			</tr>
			<tr>
				<td class="textareaTd" colspan="2"><label
					class="post_name_label">תוכן הפוסט:</label><br>
				<input type="text" name="postText" class="textarea"></td>
			</tr>
			<tr>
				<td><select class="post_select" name="postTopicName">
						<%
							for (Topic topic : topicDatabase.getAllSubTopics()) {
						%>
						<option value="<%=topic.getName()%>"><%=topic.getName()%></option>
						<%
							}
						%>
				</select></td>
				<td><input type="submit" class="post_button" value="פרסם"></td>

			</tr>
		</table>
	</form>
</body>
</html>