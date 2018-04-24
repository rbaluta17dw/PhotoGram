package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import config.Connector;

public class ModelUser extends Connector {
	
	ModelImage mImage = new ModelImage();
	public ArrayList<User> selectAll() {

		ArrayList<User> users = new ArrayList<User>();
		String sql = "SELECT * FROM USERS";
		try {
			Statement stt = super.conexion.createStatement();
			ResultSet rst = stt.executeQuery(sql);
			while (rst.next()) {
				User user = new User();
				user.setId_user(rst.getInt("id_user"));
				user.setUsername(rst.getString("username"));
				user.setPassword(rst.getString("password"));
				user.setEmail(rst.getString("email"));
				user.setBirthdate(rst.getDate("birthdate"));
				user.setPrf_img(mImage.selectImageID(rst.getInt("prf_img")));
				users.add(user);
			}
			return users;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	public User selectUserID(int id_user) {
		try {
			PreparedStatement pst = super.conexion.prepareStatement("SELECT * FROM users WHERE id_user = ?");
			pst.setInt(1, id_user);
			ResultSet rst = pst.executeQuery();
			rst.next();
			User user = new User();
			user.setId_user(rst.getInt("id_user"));
			user.setUsername(rst.getString("username"));
			user.setPassword(rst.getString("password"));
			user.setEmail(rst.getString("email"));
			user.setBirthdate(rst.getDate("birthdate"));
			user.setPrf_img(mImage.selectImageID(rst.getInt("prf_img")));

			return user;
		} catch (SQLException e) {

			e.printStackTrace();

		}
		return null;

	}

	public User selectUserName(String username) {
		User user = new User();
		try {
			PreparedStatement pst = super.conexion.prepareStatement("SELECT * FROM users WHERE username = ?");
			pst.setString(1, username);
			ResultSet rst = pst.executeQuery();
			rst.next();
			user.setId_user(rst.getInt("id_user"));
			user.setUsername(rst.getString("username"));
			user.setPassword(rst.getString("password"));
			user.setEmail(rst.getString("email"));
			user.setBirthdate(rst.getDate("birthdate"));
			user.setPrf_img(mImage.selectImageID(rst.getInt("prf_img")));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
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

	public void updateUser(User user) {
		try {
			PreparedStatement pst = super.conexion.prepareStatement(
					"UPDATE users SET id_user=?, username=?, password=?, email=?, birthdate=?. prf_img=? where id_user=?");

			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getEmail());
			java.sql.Date sqlDate = new java.sql.Date(user.getBirthdate().getTime());
			pst.setDate(4, sqlDate);
			pst.setInt(5, user.getPrf_img().getId_img());
			pst.setInt(6, user.getId_user());

			pst.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void insertUser(User user) {
		try {
			PreparedStatement pst = super.conexion.prepareStatement(
					"INSERT INTO users (id_user, username, password, email, birthdate, prf_img) values(?,?,?,?,?,?)");
			pst.setInt(1, user.getId_user());
			pst.setString(2, user.getUsername());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getEmail());
			java.sql.Date sqlDate = new java.sql.Date(user.getBirthdate().getTime());
			pst.setDate(5, sqlDate);
			pst.setInt(6, user.getPrf_img().getId_img());

			pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}