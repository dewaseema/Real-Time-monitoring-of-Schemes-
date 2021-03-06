<%@page import="java.util.function.ToDoubleFunction"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../dashboard/display/district_dashboard_show.jsp">
	<jsp:param value="" name="pageTitle"/>
	<jsp:param value="<div id='chartContainer'/>" name="content"/> 	
</jsp:include>
<%!String dataPoints1 = null; %>
<%!String dataPoints2 = null; %>
<%!String dataPoints3 = null; %>
<jsp:scriptlet><![CDATA[
	Gson gsonObj = new Gson();
	String dataPoints = "";
	Map<Object,Object> map = new HashMap<Object,Object>();
	int completed = 0;
	int aborted = 0;
	int active = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		System.out.println("Driver loaded");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih", "system", "root");
		System.out.println("Connection created");
		Statement statement = connection.createStatement();
		String xVal, yVal;
		String []hospitals = {"Tirap goverment hospital","Dawakhana"};
	
		List<Map<Object,Object>> listCompleted = new ArrayList<Map<Object,Object>>();
		List<Map<Object,Object>> listAborted = new ArrayList<Map<Object,Object>>();
		List<Map<Object,Object>> listActive = new ArrayList<Map<Object,Object>>();
		for(int i = 0; i<hospitals.length; i++){
			
		//completed
		ResultSet rs1 = statement.executeQuery("select count(applicantid) as completed from scheme_101 where hospital='"+hospitals[i]+"' and completed = 'Yes'");
		if(rs1.next()){
		completed = rs1.getInt("completed");
		map = new HashMap<Object,Object>();map.put("label", hospitals[i]); map.put("y",(double)completed); listCompleted.add(map);	
		}	
		System.out.println("First done");
	
		
		//aborted
		ResultSet rs2 = statement.executeQuery("select count(applicantid) as aborted from scheme_101 where hospital='"+hospitals[i]+"' and completed='yes' and selected = 'yes'");
		if(rs2.next()){
		aborted = rs2.getInt("aborted");
		map = new HashMap<Object,Object>();map.put("label", hospitals[i]); map.put("y",(double)aborted); listAborted.add(map);	
		}
	
		//active
		ResultSet rs3 = statement.executeQuery("select count(applicantid) as active from scheme_101 where hospital='"+hospitals[i]+"' and completed='no' and selected = 'yes'");
		if(rs3.next()){
		active = rs3.getInt("active");
		map = new HashMap<Object,Object>();map.put("label", hospitals[i]); map.put("y",(double)active); listActive.add(map);	
		}	
		}//for
	
		dataPoints1 = gsonObj.toJson(listCompleted);
		dataPoints2 = gsonObj.toJson(listAborted);
		dataPoints3 = gsonObj.toJson(listActive);
		
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
           title: {
               text: "Hospitals statistics of Tirap district"
           },
           subtitles: [
               {
                   text: "Click on Legends to Enable/Disable Data Series"
               }
           ],
           animationEnabled: true,
           legend: {
               cursor: "pointer",
               itemclick: function (e) {
                   if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                       e.dataSeries.visible = false;
                   }
                   else {
                       e.dataSeries.visible = true;
                   }
                   chart.render();
               }
           },
           axisY: {
               title: "Medals"
           },
           toolTip: {
               shared: true,
               content: function (e) {
                   var str = '';
                   var total = 0;
                   var str3;
                   var str2;
                   for (var i = 0; i < e.entries.length; i++) {
                       var str1 = "<span style= 'color:" + e.entries[i].dataSeries.color + "'> " + e.entries[i].dataSeries.name + "</span>: <strong>" + e.entries[i].dataPoint.y + "</strong> <br/>";
                       total = e.entries[i].dataPoint.y + total;
                       str = str.concat(str1);
                   }
                   str2 = "<span style = 'color:DodgerBlue; '><strong>" + e.entries[0].dataPoint.label + "</strong></span><br/>";
                   str3 = "<span style = 'color:Tomato '>Total: </span><strong>" + total + "</strong><br/>";

                   return (str2.concat(str)).concat(str3);
               }

           },
           data: [
           {
               type: "bar",
               showInLegend: true,
               name: "Completed",
               color: "gold",
               dataPoints: <%out.print(dataPoints1);%>
           },
           {
               type: "bar",
               showInLegend: true,
               name: "Aborted",
               color: "silver",
               dataPoints: <%out.print(dataPoints2);%>
           },
           {
               type: "bar",
               showInLegend: true,
               name: "Active",
               color: "#A57164",
               dataPoints: <%out.print(dataPoints3);%>
           }

           ]
       });

       chart.render();
       	<%} %>
   });
</script>