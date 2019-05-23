
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shachar.first.*"%>
<%@ page import="java.util.*"%>
<%@include file="dbMembers.jsp"%>
<%if(curUser != null){%>
<%
	List<User> users;
	if (request.getQueryString() == null || request.getParameter("search").isEmpty()) {
		users = DatabaseManager.get().getUserDatabase().getAllEntities();
	} else {
		users = DatabaseManager.get().getUserDatabase().getEntityByField((String) request.getParameter("field"),
				(String) request.getParameter("search"));
	}
%>
<!DOCTYPE html>
<html dir="rtl">
<head>
<title>FirstForum</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body class="users">
	<%@include file="header.jsp"%>

	<div class="big_container">
		<form action="users.jsp" method="get">
			<table class="container">
				<tr class="search">
					<td colspan="<%=curUser.getIsAdmin() ? 7 : 5%>"><input type="text"
						placeholder="חפש.." name="search" /></td>
					<td rowspan="2" colspan="<%=curUser.getIsAdmin() ? 2 : 1%>">
						<button type="submit">
							<img src="img/search.PNG" />
						</button>
					</td>
				</tr>
				<tr>
					<td colspan="<%=curUser.getIsAdmin() ? 7 : 5%>"><select name="field"><option
								value="username">שם משתמש</option>
							<option value="compType">סוג תחרות</option>
							<option value="teamNumber">מספר קבוצה</option></select></td>
				</tr>
				<%
					if (!curUser.getIsAdmin()) {
				%>
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
				%>
				<tr>
					<td class="big_td"><a
						href="oneUser.jsp?email=<%=user.getEmail()%>"><%=user.getUsername()%></a>
					</td>
					<td class="small_td"><%=postDatabase.getUserPostsByEmail(user.getEmail()).size()%>
					</td>
					<td class="med_td"><%=user.getCompType()%></td>
					<td class="med_td"><%=user.getTeamNumber()%></td>
					<td class="big_td"><%=user.getTeamJob()%></td>
					<td class="med_td"><%=user.getRookieTime()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr>
					<td class="header big_td">שם משתמש</td>
					<td class="header small_td">פוסטים</td>
					<td class="header med_td">תחרות</td>
					<td class="header med_td">קבוצה</td>
					<td class="header big_td">תפקיד בקבוצה</td>
					<td class="header med_td">שנת הצטרפות</td>
					<td class="header med_td">הפוך למנהל</td>
					<td class="header small_td">מחיקה</td>
					<td class="header small_td">עריכה</td>
				</tr>
				<%
					for (User user : users) {
							boolean admin = user.getIsAdmin();
				%>
				<tr>
					<td class="big_td"><a
						href="oneUser.jsp?email=<%=user.getEmail()%>"><%=user.getUsername()%></a>
					</td>
					<td class="small_td"><%=postDatabase.getUserPostsByEmail(user.getEmail()).size()%>
					</td>
					<td class="med_td"><%=user.getCompType()%></td>
					<td class="med_td"><%=user.getTeamNumber()%></td>
					<td class="big_td"><%=user.getTeamJob()%></td>
					<td class="med_td"><%=user.getRookieTime()%></td>
					<%
						if (!admin) {
					%>

					<td class="med_td"><a
						href="dbManageUsers.jsp?email=<%=user.getEmail()%>&will_admin=1">לא
							מנהל</a></td>
					<td class="small_td"><a
						href="dbManageUsers.jsp?email=<%=user.getEmail()%>">מחק</a></td>
					<td class="small_td"><a href="edit.jsp?username=<%=user.getUsername()%>">ערוך</a></td>

					<%
						} else if (!user.getUsername().equals("admin") || !user.getUsername().equals(curUser.getUsername())) {
					%>

					<td class="med_td"><a
						href="dbManageUsers.jsp?email=<%=user.getEmail()%>&will_admin=0">מנהל</a>
					</td>
					<td class="small_td"></td>
					<td class="small_td"></td>

					<%
						} else {
					%>
					<td class="med_td">מנהל</td>
					<td class="small_td"></td>
					<td class="small_td"></td>

					<%
						}
					%>
				</tr>
				<%
					}
					}
				%>
			</table>
		</form>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
<%}else{
	response.sendRedirect("signIn.jsp");
}
%>