package Conexion;

import java.sql.*;
 
public class Conexion {
 
    private Connection conexion = null;
    private String servidor = "localhost";
    private String database = "Traductor";
    private String usuario = "postgres";
    private String password = "123";
    private String url = "";
 
    public Conexion(){
        try {
            url = "jdbc:postgresql://104.236.241.56:5432/" + database;
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexion a Base de Datos " + url);
        }
        catch (Exception ex) {
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
    
    public ResultSet ejecutarConsulta(String query){
        
        Statement stmt = null;
        ResultSet resultado = null;
        
        try {
            stmt = conexion.createStatement();
            resultado = stmt.executeQuery(query);
            return resultado;
        }
        catch(Exception ex){
            System.out.println("Excepcion: " + ex.getMessage());
        }
        
        return null;
    }
    
    public int insertarPalabraDiccionario(String esp, String kaq){
        
        PreparedStatement stmt = null;
        int rows_affected = 0;
        
        String query = "INSERT INTO \"Diccionario\"(\"Espanol\", \"Kaqchikel\") VALUES (?, ?);";
        
        try {
            stmt = conexion.prepareStatement(query);
            stmt.setString(1, esp);
            stmt.setString(2, kaq);
            stmt.execute();
            rows_affected = stmt.getUpdateCount();
        }
        catch(Exception ex){
            System.out.println("Excepcion: " + ex.getMessage());
        }
        
        return rows_affected;
    }
}