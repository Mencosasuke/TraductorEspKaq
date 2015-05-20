package Conexion;

import java.sql.*;
 
public class Conexion {
 
    private Connection conexion = null;
    private String servidor = "localhost";
    private String database = "Traductor";
    private String usuario = "root";
    private String password = "";
    private String url = "";
 
    public Conexion(){
        try { 
            Class.forName("com.mysql.jdbc.Driver");
            url = "jdbc:mysql://" + servidor + "/" + database;
            conexion = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexion a Base de Datos " + url);
        }
        catch (SQLException ex) {
            System.out.println(ex);
        }
        catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }
 
    public Connection getConexion(){
        return conexion;
    }
 
    public Connection closeConexion(){
        try {
            conexion.close();
            System.out.println("Cerrando conexion a " + url);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        conexion = null;
        return conexion;
    }
    
    public ResultSet ejecutarConsulta(String consulta){
        
        Statement stmt = null;
        ResultSet resultado = null;
        
        try {
            stmt = conexion.createStatement();
            resultado = stmt.executeQuery(consulta);
            return resultado;
        }
        catch (SQLException ex){
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        
        return null;
    }
    
    public int insertarPalabraDiccionario(String esp, String kaq){
        
        PreparedStatement stmt = null;
        int rows_affected = 0;
        
        String query = "INSERT INTO Diccionario (Espanol, Kaqchikel) VALUES ( ?, ?)";
        
        try {
            stmt = conexion.prepareStatement(query);
            stmt.setString(1, esp);
            stmt.setString(2, kaq);
            stmt.execute();
            rows_affected = stmt.getUpdateCount();
        }
        catch (SQLException ex){
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        
        return rows_affected;
    }
}