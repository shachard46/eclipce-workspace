package com.shachar.first;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class JSPUtils {
	public static User getCurrentUser(HttpSession session) {
		return DatabaseManager.get().getUserDatabase()
				.getUserByEmail((String) session.getAttribute("currentUserEmail"));
	}

	public static boolean isCurrentUserAdmin(HttpSession session) {
		User user = getCurrentUser(session);
		return user != null && user.getIsAdmin();
	}

	public static int getVisitorCounter(ServletContext application) {
		Integer counter = (Integer) application.getAttribute("visitor_counter");
		return counter != null ? counter : 0;
	}

	public static int incrementVisitorCounter(ServletContext application) {
		Integer counter = (Integer) application.getAttribute("visitor_counter");
		application.setAttribute("visitor_counter", counter != null ? counter + 1 : 1);
		return getVisitorCounter(application);
	}

	public static void resetVisitoryCounter(ServletContext application) {
		application.removeAttribute("visitor_counter");
	}

	public static void redirectToOrigin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String referer = request.getHeader("Referer");
		if (referer != null) {
			response.sendRedirect(referer);
		} else {
			response.sendRedirect("forumBase.jsp");
		}
	}

	public static void editUser(HttpServletRequest request) {
		User user = new User(request.getParameter("old"), request.getParameter("password"),
				request.getParameter("email"), request.getParameter("compType"), request.getParameter("teamNumber"),
				request.getParameter("country"), request.getParameter("teamJob"), request.getParameter("rookieTime"),
				false);
		DatabaseManager.get().getUserDatabase().updateEntity(user);
		DatabaseManager.get().getUserDatabase().updateField("last_seen", "email", user.getEmail(),
				Utils.formatDatabaseDate(user.getLastSeen()));
		DatabaseManager.get().getUserDatabase().updateField("username", "email", user.getEmail(),
				request.getParameter("username"));
	}

	public static boolean registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User user = new User(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("email"), request.getParameter("compType"), request.getParameter("teamNumber"),
				request.getParameter("country"), request.getParameter("teamJob"), request.getParameter("rookieTime"),
				false);
		if (DatabaseManager.get().getUserDatabase().getUserByEmail(user.getEmail()) == null
				&& DatabaseManager.get().getUserDatabase().getUserByUsername(user.getUsername()) == null) {
			DatabaseManager.get().getUserDatabase().create(user);
			DatabaseManager.get().getUserDatabase().updateField("last_seen", "email", user.getEmail(),
					Utils.formatDatabaseDate(user.getLastSeen()));
			request.getSession().setAttribute("currentUserEmail", user.getEmail());
			request.getSession().setAttribute("poll_results", "false");
			return true;
		}
		return false;
	}

	public static boolean logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.getParameter("logout") != null && getCurrentUser(request.getSession()) != null) {
			User curUser = getCurrentUser(request.getSession());
			curUser.setLastSeenNow();
			DatabaseManager.get().getUserDatabase().updateField("last_seen", "email", curUser.getEmail(),
					Utils.formatDatabaseDate(curUser.getLastSeen()));
			request.getSession().removeAttribute("currentUserEmail");
			response.sendRedirect("signIn.jsp");
			return true;
		}
		return false;
	}

	public static void addPollAnswer(HttpServletRequest request) {
		List<PollQuestion> pollQuestions = DatabaseManager.get().getPollQuestionDatabase().getAllEntities();
		for (PollQuestion pollQuestion : pollQuestions) {
			String name = pollQuestion.getName();
			int id = pollQuestion.getId();

			String ans = request.getParameter(String.valueOf(id));
			PollAnswer pollAnswer = new PollAnswer(name, ans);
			DatabaseManager.get().getPollAnswerDatabase().create(pollAnswer);
		}
		request.getSession().setAttribute("poll_results", "true");
	}

	public static void toggleAdmin(HttpServletRequest request) {
		if (getCurrentUser(request.getSession()).getIsAdmin()) {
			if (request.getParameter("will_admin") != null) {
				DatabaseManager.get().getUserDatabase().updateField("is_admin", "email",
						(String) request.getParameter("email"), Integer.parseInt(request.getParameter("will_admin")));
			} else {
				DatabaseManager.get().getUserDatabase().deleteEntity("email", (String) request.getParameter("email"));
			}
		}
	}

	public static void clearPoll(HttpServletRequest request) {
		if (!Utils.isEmptyOrNull(request.getParameter("clearPoll")) && isCurrentUserAdmin(request.getSession())) {
			DatabaseManager.get().getPollAnswerDatabase().clearTable();
		}
	}

	public static void postPost(HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("currentUserEmail");
		Post post = new Post(request.getParameter("postName"), email, request.getParameter("postText"),
				request.getParameter("postTopicName"));
		DatabaseManager.get().getPostDatabase().create(post);
	}

	public static boolean signIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().setMaxInactiveInterval(36000000);
		if (DatabaseManager.get().getUserDatabase()
				.getUserByUsername((String) request.getParameter("username")) != null) {
			User user = DatabaseManager.get().getUserDatabase()
					.getUserByUsername((String) request.getParameter("username"));
			if (user.getPassword().equals(request.getParameter("password"))) {
				request.getSession().removeAttribute("currentUserEmail");
				request.getSession().setAttribute("currentUserEmail", user.getEmail());
				request.getSession().setAttribute("poll_results", "false");
				DatabaseManager.get().getUserDatabase().updateField("last_seen", "email",
						(String) request.getSession().getAttribute("currentUserEmail"), "1970-1-1 00:00:00");
				return true;
			}
		}
		return false;
	}

	public static boolean requiresLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (getCurrentUser(request.getSession()) == null) {
			response.sendRedirect("signIn.jsp");
			return true;
		}
		return false;
	}

}
