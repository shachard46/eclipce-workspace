<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shachar.first.*"%>
<%@include file="dbMembers.jsp"%>

<!DOCTYPE html>
<html dir="rtl">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="functions.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>

	<form name="postPost" action="dbPost.jsp" method="post"
		onsubmit="return checkPostPost()">
		<table class="container post_container">
			<tr>
				<td class="textareaTd" colspan="2"><label
					class="post_name_label">שם הפוסט:</label> <br> <textarea
						name="postName" class="post_post_name"></textarea></td>
			</tr>
			<tr>
				<td class="textareaTd" colspan="2"><label
					class="post_name_label">תוכן הפוסט:</label><br> <input
					type="text" name="postText" class="textarea"></td>
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