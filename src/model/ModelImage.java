package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import config.Connector;

public class ModelImage extends Connector {

	public ArrayList<Image> selectAll() {
		ArrayList<Image> images = new ArrayList<Image>();
		String sql = "SELECT * FROM images";
		try {
			Statement stt = super.conexion.createStatement();
			ResultSet rst = stt.executeQuery(sql);
			while (rst.next()) {
				Image image = new Image();
				image.setId_img(rst.getInt("id_img"));
				image.setName(rst.getString("name"));
				image.setUrl(rst.getString("url"));
				images.add(image);
			}
			return images;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return images;
	}

	public void insertImage(Image image) {
		try {
			PreparedStatement pst = super.conexion
					.prepareStatement("INSERT INTO images (id_img, name, url) values(?,?,?)");
			pst.setInt(1, image.getId_img());
			pst.setString(2, image.getName());
			pst.setString(3, image.getUrl());
			pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Image selectImageID(int id_img) {
		Image image = null;
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM images WHERE id_img =('" + id_img + "')");
			while (rs.next()) {
				image = new Image();
				image.setId_img(rs.getInt("id_img"));
				image.setName(rs.getString("name"));
				image.setUrl(rs.getString("url"));
			}
			return image;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Image selectImageName(String name) {
		Image image = null;
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM images WHERE name =('" + name + "')");
			while (rs.next()) {
				image = new Image();
				image.setId_img(rs.getInt("id_img"));
				image.setName(rs.getString("name"));
				image.setUrl(rs.getString("url"));
			}
			return image;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void deleteImageID(int id_img) {
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement("DELETE FROM images WHERE id_img =?");
			pst.setInt(1, id_img);

			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
