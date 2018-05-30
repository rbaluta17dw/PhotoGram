<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<%@ page import="java.text.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>

<%
	ModelImage modelImage = new ModelImage();
	ModelUser userModel = new ModelUser();
	//creaa una imagen, un usuario y una publicacion
	User user = (User) session.getAttribute("user");
	Image image = new Image();

	//out.println(user.getId_user());

	final String RUTA = "C:\\Users\\ik012982i9\\git\\PhotoGram\\WebContent\\images\\profiles";
	Iterator it;
	List lista;
	File destino = new File(RUTA);
	ServletRequestContext src = new ServletRequestContext(request);

	if (ServletFileUpload.isMultipartContent(src)) {
		DiskFileItemFactory factory = new DiskFileItemFactory((1024 * 1024), destino);
		ServletFileUpload upload = new ServletFileUpload(factory);

		lista = upload.parseRequest(src);
		File archivo = null;
		it = lista.iterator();

		while (it.hasNext()) {
			FileItem item = (FileItem) it.next();
			if (item.isFormField())
				out.println(item.getFieldName() + "<br>");
			else {

				String name = "profiles/" + user.getId_user() + item.getName();

				archivo = new File(item.getName());
				item.write(new File(destino, user.getId_user() + item.getName()));

				image.setName(name);
				image.setUrl(name);
				modelImage.insertImage(image);

				user.setPrf_img(modelImage.selectImageName(name));
				userModel.updateImgUser(user);
				//out.println(modelImage.selectImageName(name));

				response.sendRedirect("Profile");
				//out.println(post);
			}

		}
	}
%>