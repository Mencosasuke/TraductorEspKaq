package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import Conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ServletTraducir extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        RequestDispatcher view = getServletContext().getRequestDispatcher("/index.jsp");
        
        String textoEspanol = request.getParameter("txtEspanol").trim().toLowerCase().replace("\'", "&#39;");
        String textoKaqchikel = request.getParameter("txtKaqchikel").trim().toLowerCase().replace("\'", "&#39;");
        
        String[] palabrasEspanol = textoEspanol.split(" ");
        String[] palabrasKaqchikel = textoKaqchikel.split(" ");
        
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
            String traduccion = "";
            
            ResultSet resultado = null;
            
            switch(opcion){
                case"KAQ":
                    origen = textoEspanol;
                    // -------------
                    //for(String word : palabrasEspanol){
                    for(int i = 0; i < palabrasEspanol.length; i++){
                        resultado = conexion.ejecutarConsulta("SELECT \"Kaqchikel\" FROM \"Diccionario\" WHERE \"Espanol\" = \'" + palabrasEspanol[i] + "\';");
                        try{
                            String joiner = "";
                            while(resultado.next()){
                                //System.out.println(resultado.getString("Kaqchikel"));
                                joiner += resultado.getString("Kaqchikel") + " ";
                                break;
                            }
                            resultado.close();
                            
                            if(joiner == ""){
                                resultado = conexion.ejecutarConsulta("SELECT \"Kaqchikel\" FROM \"Diccionario\" WHERE \"Espanol\" = \'" + palabrasEspanol[i] + " " + palabrasEspanol[i + 1] + "\';");
                                while(resultado.next()){
                                    //System.out.println(resultado.getString("Kaqchikel"));
                                    joiner += resultado.getString("Kaqchikel") + " ";
                                    break;
                                }
                                resultado.close();
                                
                                if(joiner != ""){
                                    i++;
                                }
                            }

                            traduccion += joiner;

                        }catch(Exception ex){
                            System.out.println(ex);
                        }
                    }
                    // ---------------
                    break;
                case"ESP":
                    origen = textoKaqchikel;
                    // -------------
                    for(int i = 0; i < palabrasKaqchikel.length; i++){
                        resultado = conexion.ejecutarConsulta("SELECT \"Espanol\" FROM \"Diccionario\" WHERE \"Kaqchikel\" = '" + palabrasKaqchikel[i] + "';");
                        try{
                            String joiner = "";
                            while(resultado.next()){
                                joiner += resultado.getString("Espanol") + " ";
                                break;
                            }
                            resultado.close();

                            if(joiner == ""){
                                resultado = conexion.ejecutarConsulta("SELECT \"Espanol\" FROM \"Diccionario\" WHERE \"Kaqchikel\" = '" + palabrasKaqchikel[i] + " " + palabrasKaqchikel[i + 1] + "';");
                                while(resultado.next()){
                                    joiner += resultado.getString("Espanol") + " ";
                                    break;
                                }
                                resultado.close();
                                
                                if(joiner != ""){
                                    i++;
                                }
                            }
                            
                            traduccion += joiner;

                        }catch(Exception ex){
                            System.out.println(ex);
                        }
                    }
                    // ---------------
                    break;
            }
            
            request.setAttribute("traduccion", traduccion);
            request.setAttribute("origen", origen);
            request.setAttribute("opcion", opcion);
            request.setAttribute("isTraduccion", "true");

            view.forward(request, response);
            
        }
        conexion.closeConexion();
    }
}
