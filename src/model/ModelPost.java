package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import config.Connector;
import model.ModelUsers;




public class ModelPost extends Connector {
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
				post.setId_post(rst.getInt("id_post"));;
				post.setId_img(modelImages.selectImageID(rst.getInt("id_img")));
				post.setId_usr(modelUsers.selectUserID(rst.getInt("id_usr")));
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
	
	public void insertPost(Posts post){
		try{
			PreparedStatement pst = super.conexion.prepareStatement("INSERT INTO posts (id_post, id_img, id_usr, descrip, up_date) values(?,?,?,?,?)");
			pst.setInt(1, post.getId_post());
			pst.setInt(2, post.getId_img().getId_img());
			pst.setInt(3, post.getId_usr().getId_user());
			pst.setString(4, post.getDesc());
			pst.setDate(5, new java.sql.Date(post.getUp_date().getTime()));
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void deletePostID(int id_post) {
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement("DELETE FROM posts WHERE id_post =?");
			pst.setInt(1, id_post);

			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public Posts selectPostID(int id_post) {
		Posts post = null;
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM posts WHERE id_post =('" + id_post + "')");
			while(rs.next()){
				post = new Posts();
				post.setId_post(rs.getInt("id_post"));
				post.setId_img(modelImages.selectImageID(rs.getInt("id_img")));
				post.setId_usr(modelUsers.selectUserID(rs.getInt("id_usr")));
				post.setDesc(rs.getString("descrip"));
				post.setUp_date(rs.getDate("up_date"));
			}
			return post;
		} catch (SQLException e) {
			e.printStackTrace();
		}return null;
}
	
	
}
