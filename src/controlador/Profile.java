package controlador;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelPost;
import model.ModelUser;
import model.Post;
import model.User;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Profile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ModelUser modelUser = new ModelUser();
		User user = (User) request.getSession().getAttribute("user");
		boolean usrConf = true;
		if (user == null) {
			response.sendRedirect("../index.jsp");
		} else if (!user.getUsername().equals(request.getParameter("username"))
				&& request.getParameter("username") != null) {
			String username = request.getParameter("username");
			user = modelUser.selectUserName(username);
			usrConf = false;
		}
		ModelPost modelPost = new ModelPost();
		ArrayList<Post> posts = modelPost.selectAllPorId(user);
		int numeroPosts = modelUser.postAmount(user.getId_user());
		request.setAttribute("posts", posts);
		request.setAttribute("user", user);
		request.setAttribute("usrConf", usrConf);
		request.setAttribute("numeroPosts", numeroPosts);

		RequestDispatcher rd = request.getRequestDispatcher("users/profile.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
