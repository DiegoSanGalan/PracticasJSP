<%@ page import = "service.Calcular" %>
<%@ page import = "org.apache.logging.log4j.LogManager" %>
<%@ page import = "org.apache.logging.log4j.Logger" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adivinaré tu número</title>
</head>

<body>
	


<%-- SCRIPTLETS O CÓDIGO JAVA --%>
<%
Calcular calc = new Calcular();


// si es la primera vez que entra... no hay parámetro porque no ha seleccionado nada
// en el select
if (null != request.getParameter("acierto"))
{
	String resultado = request.getParameter("acierto");
	log.info("Variable String resultado que guarda el valor del select: " + resultado);
	tuNumero = (Integer)request.getAttribute("numeroaprobar");
	//log.info("Variable Integer resultado que guarda el valor de la caja de texto del número: " + tuNumero.toString());
	//session.setAttribute("tunumero", resultado);
	//session.setAttribute("numeroaprobar", tuNumero);


	if (resultado.equals("1")) //ES MAYOR
	{
		limInf=medio;
		medio = calc.Media (limInf, limSup);
		log.info("Es Mayor Opcion 1");
		//session.setAttribute("numeroaprobar", medio);
		response.sendRedirect("AdivinoTuNumero.jsp");
		
	}
	else 
	{
		if (resultado.equals ("2"))  // ES MENOR
		{
		limSup = medio;
		medio = calc.Media(limInf, limSup);
		log.info("Es Menor Opcion 2");
		//session.setAttribute("numeroaprobar", medio);
		response.sendRedirect("AdivinoTuNumero.jsp");
		
		}
		else
		{
			if (resultado.equals ("3"))  // ES IGUAL HE ACERTADO
			{
				log.info("Es Igual Acierto Opcion 2");
				// Al acertar reinicio el valor de las variables para jugar otra partida.
				medio= 50;
				limInf = 1;
				limSup = 100;
				tuNumero = 50;
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

	<select name="acierto">
	   <option value="1">Es Mayor</option> 
	   <option value="2">Es Menor</option> 
	   <option value="3">Has Acertado</option>
	</select>
	<input type="submit" value = "Validar Elección" name="enviar"/>
	</form>
	
	<%//response.sendRedirect("AdivinoTuNumero.jsp");
	
}%>




<%--  DECLARACIONES  --%>
<%!
private Integer medio= 50;
private Integer limInf = 1;
private Integer limSup = 100;
private Integer tuNumero = 50;
private final Logger log = LogManager.getRootLogger();
%>









</body>
</html>