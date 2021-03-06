package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import config.Connector;
import model.ModelUser;

public class ModelPost extends Connector {
	ModelUser modelUser = new ModelUser();
	ModelImage modelImage = new ModelImage();

	public ArrayList<Post> selectAll() {
		ArrayList<Post> posts = new ArrayList<Post>();
		String sql = "SELECT * FROM posts ORDER BY id_post DESC";
		try {
			Statement stt = super.conexion.createStatement();
			ResultSet rst = stt.executeQuery(sql);
			while (rst.next()) {
				Post post = new Post();
				post.setId_post(rst.getInt("id_post"));
				;
				post.setImg(modelImage.selectImageID(rst.getInt("id_img")));
				post.setId_usr(modelUser.selectUserID(rst.getInt("id_usr")));
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

	public void insertPost(Post post) {
		try {
			PreparedStatement pst = super.conexion
					.prepareStatement("INSERT INTO posts (id_post, id_img, id_usr, descrip) values(?,?,?,?)");
			pst.setInt(1, post.getId_post());
			pst.setInt(2, post.getImg().getId_img());
			pst.setInt(3, post.getId_usr().getId_user());
			pst.setString(4, post.getDesc());
			pst.execute();
		} catch (SQLException e) {
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

	public Post selectPostID(int id_post) {
		Post post = null;
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM posts WHERE id_post =('" + id_post + "')");
			while (rs.next()) {
				post = new Post();
				post.setId_post(rs.getInt("id_post"));
				post.setImg(modelImage.selectImageID(rs.getInt("id_img")));
				post.setId_usr(modelUser.selectUserID(rs.getInt("id_usr")));
				post.setDesc(rs.getString("descrip"));
				post.setUp_date(rs.getDate("up_date"));
			}
			return post;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public java.sql.Date dateToSql(Date fecha) {
		java.sql.Date sqlDate = new java.sql.Date(fecha.getTime());

		return sqlDate;
	}
}
