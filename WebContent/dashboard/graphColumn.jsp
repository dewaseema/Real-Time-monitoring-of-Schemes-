<%@page import="java.util.function.ToDoubleFunction"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="pages/template.jsp">
	<jsp:param value="" name="pageTitle"/>
	<jsp:param value="<div id='chartContainer'/>" name="content"/> 	
	<jsp:param value="<div id='chartContainer2'/>" name="content2"/> 	
</jsp:include>

<jsp:scriptlet><![CDATA[
	Gson gsonObj = new Gson();
	String dataPoints = "";
	Map<Object,Object> map = new HashMap<Object,Object>();
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		System.out.println("Driver loaded");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih", "system", "root");
		System.out.println("Connection created\n\n");
		Statement statement = connection.createStatement();
		String xVal, yVal;
		
		ResultSet resultSet = statement.executeQuery("select * from graph_mydata_test");
		ResultSetMetaData rsmd = resultSet.getMetaData();
		
		while(resultSet.next()){
			xVal = resultSet.getString("x");
			yVal = resultSet.getString("y");
			map = new HashMap<Object,Object>();	map.put("x", Double.parseDouble(xVal));	map.put("y", Double.parseDouble(yVal)); list.add(map);
			dataPoints = gsonObj.toJson(list);
		}
		connection.close();
	}
	catch(SQLException e){
		out.println("<div class='alert alert-danger' style='margin:1%;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same. Please refer to Instruction.txt</div>");
		dataPoints = null;
	}
]]></jsp:scriptlet>


		
<script type="text/javascript">

   $(function () {
	   <%if(dataPoints != null){%>
	   var chart = new CanvasJS.Chart("chartContainer", {
           theme: "light2",
           animationEnabled: true,
           title: {
               text: "Column Chart made by Somen"
           },
           data: [{
               type: "column",
               dataPoints: <%out.print(dataPoints);%>
           }]
       });
       chart.render();
       
       	<%} %>
   });
</script>