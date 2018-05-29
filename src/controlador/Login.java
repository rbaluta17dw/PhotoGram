package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import org.mindrot.BCrypt;

public class Login extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Creamos el modelo del usuario
		ModelUser modelUser = new ModelUser();

		// Recibe parametros de la pagina index.jsp

		String username = request.getParameter("username").toLowerCase();
		String password = request.getParameter("password");

		// Creamos el usuario para luego utilizarlo
		User user;

		/*
		 * Miramos si el usuario existe, si es asi el usuario es el encontrado
		 * en la base de datos en caso contrarios se crea un usuario vacio
		 */
		if (modelUser.selectUserName(username) != null) {
			user = modelUser.selectUserName(username);
		} else {
			user = new User();
		}

		/*
		 * Si la contraseña y el nombre del usuario coinciden con el encontrado
		 * en la base de datos creamos un atributo de sesion con el usuario
		 * dentro luego redirigimos la pagina donde se listan las publicaciones
		 * en caso contrario se redirige a la pagina principal (index.jsp)
		 */

		if (username.equals(user.getUsername()) && BCrypt.checkpw(password, user.getPassword())) {
			// Creo el atributo con el usuario

			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			// Envio la pagina de publicaciones
			//response.sendRedirect("posts/feed.jsp");
			response.sendRedirect("Feed");

		} else {
			/*
			 * Si la contraseña y el usuario no coinciden devuelve a la pagina
			 * principal
			 */

			response.sendRedirect("index.jsp");
		}
	}
}
