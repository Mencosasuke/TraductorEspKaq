<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Instancia los atributos sii son nulos
    if(request.getAttribute("traduccion") == null){
        request.setAttribute("traduccion", "");
    }
    if(request.getAttribute("opcion") == null){
        request.setAttribute("opcion", "");
    }
    if(request.getAttribute("origen") == null){
        request.setAttribute("origen", "");
    }
    if(request.getAttribute("isTraduccion") == null){
        request.setAttribute("isTraduccion", "false");
    }
    if(request.getAttribute("rowsAffected") == null){
        request.setAttribute("rowsAffected", "0");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Traductor Español - Kiche</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link href='http://fonts.googleapis.com/css?family=Nunito' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Candal' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="app/css/style.css">
        <script src="app/js/jquery-1.11.3.min.js"></script>
        <script src="app/js/traductor.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="header" class="headerDiv">
                <h1>Traductor Español Kiche</h1>
            </div>
            <div id="content" class="mainDiv">
                <form action="ServletTraducir" method="POST">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <label for="txtEspanol">Español</label>
                                </td>
                                <td>
                                    <label for="txtKaqchikel">Kiche</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <textarea id="txtEspanol" name="txtEspanol"><%
                                    if(request.getAttribute("opcion").equals("ESP")) {
                                        out.println(request.getAttribute("traduccion").toString());
                                    } else if(request.getAttribute("opcion").equals("KAQ")) {
                                        out.println(request.getAttribute("origen").toString());
                                    } %></textarea>
                                </td>
                                <td>
                                    <textarea id="txtKaqchikel" name="txtKaqchikel"><%
                                    if(request.getAttribute("opcion").equals("KAQ")) {
                                        out.println(request.getAttribute("traduccion").toString());
                                    } else if(request.getAttribute("opcion").equals("ESP")) {
                                        out.println(request.getAttribute("origen").toString());
                                    } %></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <button id="btnTraducir" name="action" value="traducir">Traducir a</button>
                                    <select name="txtTraduccion" id="txtTraduccion"><%
                                    if(request.getAttribute("opcion").equals("ESP")) {
                                        out.println("<option value='ESP' selected>Español</option>");
                                        out.println("<option value='KAQ'>Kiche</option>");
                                    } else {
                                        out.println("<option value='KAQ' selected>Kiche</option>");
                                        out.println("<option value='ESP'>Español</option>");
                                    } %>
                                    </select>
                                    <button id="btnInsertar" name="action" value="insertar">Insertar</button>
                                    <button id="btnLimpiar" name="btnLimpiar">Limpiar</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="errorClass">
                                    <% if(request.getAttribute("isTraduccion").toString().equals("true") && request.getAttribute("traduccion").toString().equals("")){
                                        out.println("<span class='hidden' id='isTraduccion'>true</span>");
                                    }else{
                                        out.println("<span class='hidden' id='isTraduccion'>false</span>");
                                    } %>
                                    <% if(Integer.parseInt(request.getAttribute("rowsAffected").toString()) > 0){
                                        out.println("<span class='hidden' id='insertSuccess'>true</span>");
                                    }else{
                                        out.println("<span class='hidden' id='insertSuccess'>false</span>");
                                    } %>
                                    <span class=" notfound hidden " id="msgError"> Palabra no encontrada </span>
                                    <span class=" insertSuccess hidden" id="msgSuccess"> Palabra ingresada correctamente </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div id="footer">
                <span class="footer"><i>David Fernando Mencos García &#174; - 090-13-9241 - Ingeniería en Sistemas - UMG 2015</i></span>
            </div>
	</div>
    </body>
</html>
