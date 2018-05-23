package controlador;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import org.mindrot.BCrypt;

public class UpdateProfile extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Creamos el modelo usuario
		ModelUser userModel = new ModelUser();

		// Cogemos la sesion actual
		HttpSession session = request.getSession();
		// Declaramos todas las variables que necesitemos
		String username = null;
		String newpassword = null;
		String email = null;
		String birthdate = null;
		Date date = null;

		// Cogemos el usuario con el que nos hemos loggeado
		User tuser = (User) session.getAttribute("user");

		// Comprueba que la contraseña actual que le hemos pasado es
		// verdaderamente la actual del usuario
		if (BCrypt.checkpw(request.getParameter("password"), tuser.getPassword())) {
			// Comprueba se le hemos pasado los parametros si no es asi se le
			// asignara los del usuario loggeado
			if (request.getParameter("username") != "") {
				username = request.getParameter("username");
			} else {
				username = tuser.getUsername();
			}
			if (request.getParameter("repassword") != "") {
				newpassword = BCrypt.hashpw(request.getParameter("repassword"), BCrypt.gensalt(12));
			} else {
				newpassword = tuser.getPassword();
			}
			if (request.getParameter("email") != "") {
				email = request.getParameter("email");
			} else {
				email = tuser.getEmail();
			}
			if (request.getParameter("birthdate") != "") {
				birthdate = request.getParameter("birthdate");
				try {
					date = new SimpleDateFormat("yyyy-MM-dd").parse(birthdate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				date = tuser.getBirthdate();
			}
			// Creamos el usuario que va a ser el modificado
			User user = new User();

			// Rellenamos el usuarios a modificar
			user.setId_user(tuser.getId_user());
			user.setUsername(username);
			user.setPassword(newpassword);
			user.setEmail(email);
			user.setBirthdate(date);

			// Modificamos el usuario en la base de datos
			userModel.updateUser(user);

			// Quitamos el atributo de sesion actual
			session.removeAttribute("user");

			// redirigimos al perfil diciendo que el perfil se ha cambiado
			response.sendRedirect("index.jsp");
		} else {
			// redirigimos al perfil diciendo que el perfil no se ha cambiado
			response.sendRedirect("../users/profile.jsp?update=0");
		}
	}

}
