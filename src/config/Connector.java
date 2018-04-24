package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector extends Config {
	
	protected Connection conexion;

	
	 protected Connector(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			this.conexion = DriverManager.getConnection("jdbc:mysql://" + HOST + "/" + BBDD, USERNAME, PASSWORD);
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public Connection getConexion(){
		return conexion;
	}
	public void setConexion(Connection conexion){
		this.conexion = conexion;
	}
}

