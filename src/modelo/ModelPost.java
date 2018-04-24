package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import modelo.ModelUsers;
import config.Conector;




public class ModelPost extends Conector {
	ModelUsers modelUsers = new ModelUsers();
	ModelImages modelImages = new ModelImages();
	
	public ArrayList<Posts> selectAll(){
		ArrayList<Posts> posts = new ArrayList<Posts>();
		String sql = "SELECT * FROM posts";
		try {
			Statement stt = super.conexion.createStatement();
			ResultSet rst = stt.executeQuery(sql);
			while (rst.next()) {
				Posts post = new Posts();
				post.setId_post(rst.getInt("id_img"));;
				post.setId_img(rst.getInt("id_img"));
				post.setId_usr(rst.getInt("id_usr"));
				post.setDesc(rst.getString("descrip"));
				post.setUp_date(rst.getDate("up_date"));
				posts.add(post);
			}
			return posts;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return posts;
	}
	
	public void insertImage(Images image){
		try{
			PreparedStatement pst = super.conexion.prepareStatement("INSERT INTO images (id_img, name, data) values(?,?,?)");
			pst.setInt(1, image.getId_img());
			pst.setString(2, image.getName());
			pst.setBlob(3, image.getData());
			pst.execute();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteUserID(int id_user) {
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement("DELETE FROM users WHERE id_user =?");
			pst.setInt(1, id_user);

			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public Images selectPostID(int id_img) {
		Images image = null;
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM images WHERE id_img =('" + id_img + "')");
			while(rs.next()){
				image = new Images();
				image.setId_img(rs.getInt("id_img"));
				image.setName(rs.getString("name"));
				image.setData(rs.getBlob("data"));
			}
			return image;
		} catch (SQLException e) {
			e.printStackTrace();
		}return null;
}
	
	
}
