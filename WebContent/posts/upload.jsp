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
	ModelPost modelPost = new ModelPost();

	String desc = " ";

	//creaa una imagen, un usuario y una publicacion
	User user = (User) session.getAttribute("user");
	Post post = new Post();
	Image image = new Image();

	//out.println(user.getId_user());

	final String RUTA = "C:\\Users\\ik012982i9\\git\\PhotoGram\\WebContent\\images";
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

				String name = user.getId_user() + item.getName();

				archivo = new File(item.getName());
				item.write(new File(destino, user.getId_user() + item.getName()));

				image.setName(name);
				image.setUrl(name);
				modelImage.insertImage(image);

				post.setId_usr(user);
				post.setDesc(desc);
				post.setUp_date(new Date());
				post.setImg(modelImage.selectImageName(name));
				modelPost.insertPost(post);

				//out.println(modelImage.selectImageName(name));

				response.sendRedirect("Feed");
				//out.println(post);
			}

		}
	}
%>