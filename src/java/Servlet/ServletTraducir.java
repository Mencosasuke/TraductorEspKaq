package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import java.sql.ResultSet;
import java.util.StringJoiner;
import java.sql.SQLException;

import Conexion.Conexion;

public class ServletTraducir extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        RequestDispatcher view = getServletContext().getRequestDispatcher("/index.jsp");
        
        String textoEspanol = request.getParameter("txtEspanol").trim();
        String textoKaqchikel = request.getParameter("txtKaqchikel").trim();
        String action = request.getParameter("action");
        
        Conexion conexion = new Conexion();
        
        if(action.equals("insertar")){
            int rows_affected = conexion.insertarPalabraDiccionario(textoEspanol, textoKaqchikel);
            request.setAttribute("rowsAffected", rows_affected);
            view.forward(request, response);
        }else if(action.equals("traducir")){
            String opcion = request.getParameter("txtTraduccion");
            String campo = "";
            String condicion = "";
            String origen = "";
            
            ResultSet resultado = null;
            switch(opcion){
                case "KAQ":
                    campo = "Kaqchikel";
                    condicion = "WHERE \"Espanol\" = \'" + textoEspanol + "\';";
                    origen = textoEspanol;
                    break;
                case "ESP":
                    campo = "Espanol";
                    condicion = "WHERE \"Kaqchikel\" = '" + textoKaqchikel + "';";
                    origen = textoKaqchikel;
                    break;
            }
            //resultado = conexion.ejecutarConsulta("SELECT " + campo + " FROM Diccionario " + condicion);
            resultado = conexion.ejecutarConsulta("SELECT \""+ campo + "\" FROM \"Diccionario\"" + condicion);
            try{
                StringJoiner joiner = new StringJoiner(",");
                while(resultado.next()){
                    switch(opcion){
                        case "KAQ":
                            System.out.println(resultado.getString("Kaqchikel"));
                            joiner.add(resultado.getString("Kaqchikel"));
                            break;
                        case "ESP":
                            System.out.println(resultado.getString("Espanol"));
                            joiner.add(resultado.getString("Espanol"));
                            break;
                    }
                }
                resultado.close();
                
                String traduccion = joiner.toString();                
                request.setAttribute("traduccion", traduccion);
                request.setAttribute("origen", origen);
                request.setAttribute("opcion", opcion);
                request.setAttribute("isTraduccion", "true");
                
                view.forward(request, response);
                
            }catch(SQLException ex){
                System.out.println(ex);
            }
        }
        conexion.closeConexion();
    }
}
