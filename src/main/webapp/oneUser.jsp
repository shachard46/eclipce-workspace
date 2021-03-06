
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="static com.shachar.first.Utils.*"%>
<%
	if(JSPUtils.logoutUser(request, response) || JSPUtils.requiresLogin(request, response)){
		return;
	}
	User user = null;
	String requestEmail = (String) request.getParameter("email");
	if (requestEmail != null) {
		user = DatabaseManager.get().getUserDatabase().getUserByEmail(requestEmail);
	}
%>
<html dir="rtl">
<head>
<title>FirstForum</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body class="users">
	<%@include file="header.jsp"%>

	<div class="big_container">
		<table class="container">
			<tr class="user_row">
				<td class="user_td" colspan="6">
					<div class="profile_photo">
						<img src="img/no-profile-image.jpg" alt="user profile photo" />
					</div>
					<div class="user_info">
						<%
							if (formatDatabaseDate(user.getLastSeen()).equals("1970-01-01 00:00:00")) {
						%>
						<div class="big_font">
							<%=user.getUsername()%><img class="online"
								src="./img/online1.png" /><span class="online_text">
								מחובר</span>
						</div>
						<div class="small_font">
							קבוצה מספר
							<%=user.getTeamNumber()%>
						</div>
						<div class="small_font">
							<%=user.getTeamJob()%>
						</div>
						<%
							} else {
						%>
						<div class="big_font">
							<%=user.getUsername()%><img class="online"
								src="./img/offline.png" />
						</div>
						<div class="small_font">
							קבוצה מספר
							<%=user.getTeamNumber()%>
						</div>
						<div class="small_font">
							<%=user.getTeamJob()%>
						</div>
						<div class="date">
							נראה לאחרונה לפני:
							<%=getPeriod(user.getLastSeen())%>
						</div>
						<%
							}
						%>
					</div>
				</td>
			</tr>
			<tr class="spacer"></tr>

			<tr class="info_head">
				<td colspan="3">
					<div class="panel_header header">
						מידע נוסף
						<%
						if ((JSPUtils.getCurrentUser(session).getIsAdmin() || user.getUsername().equals(JSPUtils.getCurrentUser(session).getUsername()))
									&& !user.getUsername().equals("admin")) {
					%>
						<a href="edit.jsp?username=<%=user.getUsername()%>"
							style="float: left;">ערוך</a>
						<%
							}
						%>
					</div>
				</td>
			</tr>
			<tr class="info_head">
				<td colspan="3">
					<div class="panel">
						<div class="small_font">
							מיקום:
							<%=user.getCountry()%>
						</div>
						<div class="small_font">
							מספר קבוצה:
							<%=user.getTeamNumber()%>
						</div>
						<div class="small_font">
							תחרות:
							<%=user.getCompType()%>
						</div>
						<div class="small_font">
							תפקיד בקבוצה:
							<%=user.getTeamJob()%>
						</div>
						<div class="small_font">
							תאריך הצטרפות:
							<%=user.getRookieTime()%>
						</div>

						<div class="small_font">
							פוסטים:
							<%=DatabaseManager.get().getPostDatabase().getUserPostsByEmail(user.getEmail()).size()%>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
