<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbMembers.jsp"%>
<!DOCTYPE html>
<%
	if (request.getParameter("will_admin") != null) {
		userDatabase.updateField("is_admin", "email", (String) request.getParameter("email"),
				Integer.parseInt(request.getParameter("will_admin")));
	} else {
		userDatabase.DeleteRow("email", (String) request.getParameter("email"));
	}
	response.sendRedirect("users.jsp");
%>