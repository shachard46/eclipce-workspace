<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shachar.first.*"%>
<%@ page import="java.util.List"%>

<%
	if (request.getSession().getAttribute("validUser") == null) {
		request.getSession().setAttribute("validUser", "disconnected");
	}
	TopicDatabase topicDatabase = new TopicDatabase();
	PostDatabase postDatabase = new PostDatabase();
	List<Topic> parentTopics = topicDatabase.getAllParentTopics();
%>
<html dir="rtl">
<head>
<title>FirstForum</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="functions.js"></script>
</head>
<body class="forum">
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
				<td class="sub_topic header">תת נושא</td>
				<td class="last_post header">פוסט אחרון</td>
				<td class="post_amount header">מספר פוסטים</td>
			</tr>
			<%
				for (Topic parentTopic : parentTopics) {
			%>
			<tr>
				<td colspan="3" class="header"><%=parentTopic.getName()%></td>
			</tr>
			<%
				List<Topic> subTopics = topicDatabase.getSubTopics(parentTopic.getId());
					for (Topic subTopic : subTopics) {
						int posts = postDatabase.getPostsByTopic(subTopic.getName()).isEmpty() ? 0
								: postDatabase.getPostsByTopic(subTopic.getName()).size();
						String postName = postDatabase.getPostsByTopic(subTopic.getName()).isEmpty() ? "אין פוסטים"
								: postDatabase.getPostsByTopic(subTopic.getName())
										.get(postDatabase.getPostsByTopic(subTopic.getName()).size() - 1).getPostName();
						int id = postDatabase.getPostsByTopic(subTopic.getName()).isEmpty() ? 0
								: postDatabase.getPostsByTopic(subTopic.getName())
										.get(postDatabase.getPostsByTopic(subTopic.getName()).size() - 1).getId();
			%>
			<tr>
				<td class="sub_topic"><a
					href="forumThreads.jsp?topic_id=<%=subTopic.getId()%>"><%=subTopic.getName()%></a></td>
				<%
					if (postName != "אין פוסטים") {
				%>
				<td class="last_post"><a href="forumPost.jsp?id=<%=id%>"><%=postName%></a></td>
				<%
					} else {
				%>
				<td class="last_post"><%=postName%></td>
				<%
					}
				%>
				<td class="post_amount"><%=posts%></td>
			</tr>
			<%
				}
			%>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>
