<%@ page import = "service.Calcular" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adivinaré tu número</title>
</head>

<body>
	<img src="sandro.jpg">


	<%-- EXPRESIONES --%>
	
	<%-- FIN EXPRESIONES --%>
	<form name = "adivinador" action = "AdivinoTuNumero.jsp" >

	<!-- AQUI PONDRÉ EL NÚNERO QUE PIENSO QUE ES EL CORRECTO -->
	<input type="text" value = "<%=medio%>" name="numeroaprobar"/>

	<select name="tunumero">
	   <option value="1">Es Mayor</option> 
	   <option value="2">Es Menor</option> 
	   <option value="3">Has Acertado</option>
	</select>
	<input type="submit" value = "Validar Elección" name="enviar"/>
	</form>



<%-- SCRIPTLETS O CÓDIGO JAVA --%>
<%
Calcular calc = new Calcular();


// si es la primera vez que entra... no hay parámetro porque no ha seleccionado nada
// en el select
if (null != request.getParameter("tunumero"))
{
	String resultado = request.getParameter("tunumero");
	tuNumero = (Integer)request.getAttribute("numeroaprobar");
	//session.setAttribute("tunumero", resultado);
	//session.setAttribute("numeroaprobar", tuNumero);


	if (resultado.equals("Es Mayor"))
	{
		limInf=medio;
		medio = calc.Media (limInf, limSup);
		//session.setAttribute("numeroaprobar", medio);
		response.sendRedirect("AdivinoTunumero.jsp");
		
	}
	else 
	{
		if (resultado.equals ("Es Menor"))
		{
		limSup = medio;
		medio = calc.Media(limInf, limSup);
		//session.setAttribute("numeroaprobar", medio);
		response.sendRedirect("AdivinoTunumero.jsp");
		
		}
		else
		{
			if (resultado.equals ("Es Igual"))
			{
				response.sendRedirect("/PracticasJSP/Adivinado.html");
			}
		}
	}
}
else
{%>
	<body>
	<img src="sandro.jpg">


	<%-- EXPRESIONES --%>
	<%= "El número que has pensado es...." %>
	<%-- FIN EXPRESIONES --%>
	<form name = "adivinador" action = "AdivinoTuNumero.jsp" >

	<!-- AQUI PONDRÉ EL NÚNERO QUE PIENSO QUE ES EL CORRECTO -->
	<input type="text" value = "<%=medio%>" name="numeroaprobar"/>

	<select name="tunumero">
	   <option value="1">Es Mayor</option> 
	   <option value="2">Es Menor</option> 
	   <option value="3">Has Acertado</option>
	</select>
	<input type="submit" value = "Validar Elección" name="enviar"/>
	</form>
<%}%>




<%--  DECLARACIONES  --%>
<%!
private Integer medio= 50;
private Integer limInf = 1;
private Integer limSup = 100;
private Integer tuNumero = 50;
%>









</body>
</html>