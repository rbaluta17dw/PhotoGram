package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import config.Conector;

public class ModelUsers extends Conector {

	public ArrayList<Users> selectAll(){
		ArrayList<Users> users = new ArrayList<Users>();
		String sql = "SELECT * FROM USERS";
		try {
			Statement stt = super.conexion.createStatement();
			ResultSet rst = stt.executeQuery(sql);
			while (rst.next()) {
				Users user = new Users();
				user.setId_user(rst.getInt("id_user"));
				user.setUsername(rst.getString("username"));
				user.setPassword(rst.getString("password"));
				user.setEmail(rst.getString("email"));
				user.setBirthdate(rst.getDate("birthdate"));
				user.setPrf_img(rst.getInt("prf_img"));
				users.add(user);
			}
			return users;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public Users selectUserID(int id_user){
		try{
			PreparedStatement pst = super.conexion.prepareStatement("SELECT * FROM users WHERE id_user = ?");
			pst.setInt(1, id_user);
			ResultSet rst = pst.executeQuery();
			if(rst.next()){
				Users user = new Users();
				user.setId_user(rst.getInt("id_user"));
				user.setUsername(rst.getString("username"));
				user.setPassword(rst.getString("password"));
				user.setEmail(rst.getString("email"));
				user.setBirthdate(rst.getDate("birthdate"));
				user.setPrf_img(rst.getInt("prf_img"));
				
				return user;
			}
		}catch (SQLException e) {

			e.printStackTrace();
			
		}return null;
		
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
	
	public void updateUser(Users user){
		try{
			PreparedStatement pst = super.conexion.prepareStatement("UPDATE users SET id_user=?, username=?, password=?, email=?, birthdate=?. prf_img=? where id_user=?");
			
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getEmail());
			java.sql.Date sqlDate = new java.sql.Date(user.getBirthdate().getTime());
			pst.setDate(4, sqlDate);
			pst.setInt(5, user.getPrf_img());
			pst.setInt(6, user.getId_user());
			
			pst.executeUpdate();

		
		}catch (SQLException e) {

			e.printStackTrace();
		}
		
	}
	
	public void insertUser(Users user){
		try{
			PreparedStatement pst = super.conexion.prepareStatement("INSERT INTO users (id_user, username, password, email, birthdate, prf_img) values(?,?,?,?,?,?)");
			pst.setInt(1, user.getId_user());
			pst.setString(2, user.getUsername());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getEmail());
			java.sql.Date sqlDate = new java.sql.Date(user.getBirthdate().getTime());
			pst.setDate(6, sqlDate);
			pst.setInt(7, user.getPrf_img());
			
			pst.execute();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

