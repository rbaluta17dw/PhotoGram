package controlador;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

import org.mindrot.BCrypt;

public class Register extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Creamos el modelo del usuario
		ModelUser userModel = new ModelUser();

		// Recibe parametros de la pagina register.jsp
		String username = request.getParameter("username").toLowerCase();
		// Al recibir la contraseña la encriptamos
		String password = BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(12));
		String email = request.getParameter("email");
		String birthdate = request.getParameter("birthdate");
		Date date = new Date();
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(birthdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Creamos el usuario para luego utilizarlo
		User user = new User();
		// Rellenamos el usuario con los datos
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setBirthdate(date);

		// Insertamos el usuario
		userModel.insertUser(user);

		// Redirigimos la pagina a la principal
		response.sendRedirect("index.jsp");
	}
}
