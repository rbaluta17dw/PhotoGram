package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import config.Connector;

public class ModelImages extends Connector {
	
	public ArrayList<Images> selectAll(){
		ArrayList<Images> images = new ArrayList<Images>();
		String sql = "SELECT * FROM images";
		try {
			Statement stt = super.conexion.createStatement();
			ResultSet rst = stt.executeQuery(sql);
			while (rst.next()) {
				Images image = new Images();
				image.setId_img(rst.getInt("id_img"));
				image.setName(rst.getString("name"));
				image.setData(rst.getBlob("data"));
				images.add(image);
			}
			return images;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return images;
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
	
	public Images selectImageID(int id_img) {
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
