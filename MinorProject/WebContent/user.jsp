<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	html,body{
 		width:100%;
 		height:100%;
 		background-color:#a4a9aa;
 	}
 	.panel1{
		width:50%;
		height:13%;
		border: 2px solid black;
		margin-left:90%;
		margin-top:10px;
		display:flex;
		justify-content:space-around;
		align-items:center;
		padding-top:10px;
		padding-bottom:10px;
		
	}
	.adminimg{
		width:15%;
		height:110%;
		border-radius:10%;
		margin-left:40px;
		background-color:lightblue;
		border: 1px solid black;
		padding:4px;
		display:flex;
		align-items:center;
		
		
	}
	.panel img{
		width:70px;
		height:70px;
		border-radius:50%;
		border: 2px solid black;
	}
	.adminname{
		background-color:lightblue;
		border: 1px solid black;
		width:50%;
		text-align:center;
		border-radius:10%;
	}
 	.maindiv{
 		width:70%;
 		height:100%;
 	}
 	.mainimg{
 		width:120%;
 		height:80%;
 		display:flex;
 		justify-content:center;
 		box-shadow: 7px 7px 14px rgb(59, 57, 57);
 		margin-left:10%;
 		margin-top:5%;
 	}
 	img{
 		width:100%;
 		height:100%;
 	}
 	.bottomblock{
 	width:140%;
 	height:90%;
 	color:white;
 	display:flex;
 	margin-top:5%;
 	}
 	.features{
 	width:30%;
 	height:fit-content;
 	background-color:#423e42;
 	border:2px solid black;
 	padding:10px;
 	margin-left:1%;
 	justify-items:center;
 	}
 	.sidecontent{
 	widht:120%;
 	height:fit-content;
 	background-color:#423e42;
 	border:2px solid white;
 	margin-left:1%;
 	}
 	button{
 	margin:3px;
 	margin-bottom:8px;
 	background-color:#d2e57d;
 	box-shadow: 5px 5px 10px rgb(82, 80, 80);
 	color:white;
 	padding:2px;
 	}
 	.body1{
 	margin:10px;
 	min-widht:800px;
 	max-width:1100px;
 	}
 	.basics1,.basics2,.basics3,.basics4{
 	background-color:#cd9e52;
 	border:2px solid black;
 	margin:10px;
 	padding-top:10px;
 	padding-bottom:10px;
 	box-shadow: 5px 5px 10px rgb(176, 172, 172);
 	text-align:center;
 	}
</style>
</head>
<body>
	<div class="maindiv">
			<div class="panel1">
				<div class="adminname">
				<%
					String name="";
					Cookie[] thecookie = request.getCookies();
					if(thecookie!=null){
						for(Cookie tempcookie : thecookie){
							if("MinorProject.firstname".equals(tempcookie.getName())){
								name=tempcookie.getValue();
								break;
							}
						}
					}
					String hlo="";
					Cookie[] thecookie1 = request.getCookies();
					if(thecookie!=null){
						for(Cookie tempcookie : thecookie){
							if("hlo".equals(tempcookie.getName())){
								hlo=tempcookie.getValue();
								break;
							}
						}
					}
				//how to access from userverify.jsp
					ResultSet resultSet = null;
					final String hi = name;
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
						Statement stmt = con.createStatement();
						String sql ="select * from table1";
						resultSet = stmt.executeQuery(sql);
						while(resultSet.next())
						{
							if(resultSet.getString("firstname").equalsIgnoreCase(name))
							{	
				%>		
						<h2><b><%=resultSet.getString("firstname")%></b></h2>
						<h3><b><%=resultSet.getString("email")%></b></h3>
						
						<%
						}
						}
						con.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					
				</div>
			</div>
			<div class="mainimg">
				<img  alt="can't find" src="images/recommandation.jpg">
			</div>
				<div class="bottomblock">
					<div class="features">
									<p style="text-align:center;color:yellow;" ><b><font size="5">USER MENU</font></b></p>
								<div class="basics1">
									<p style="color:black;text-decoration: underline;"><font size="5"> User Details</font></p>
									<button><a style="color:#575856;text-decoration:none;" href="myprofile.jsp?name=<%=name%>"><font size="4">My Profile</font></a></button><br>	<% session.setAttribute("name",name); %>
									<button><a style="color:#575856;text-decoration:none;" href="searchfriends.jsp"><font size="4">Search Friends</font></a></button><br>
					<%if(!hlo.equalsIgnoreCase(name)){ %>
									<button><a style="color:#575856;text-decoration:none;" href="demofrd.jsp?frd=<%=hlo%>"><font size="4">Friend Requests</font></a></button><br>
								<%	}%>
								</div>
								<div class="basics2">
									<p style="color:black;text-decoration: underline;"><font size="5">Operation On Products</font></p>
									<button><a style="color:#575856;text-decoration:none;" href="searchposts.jsp"><font size="4">Search Posts</font></a></button><br>
									<button><a style="color:#575856;text-decoration:none;" href="addtocart.jsp"><font size="4">Add products to my cart</font></a></button><br>
									<button><a style="color:#575856;text-decoration:none;" href="searchposts.jsp"><font size="4">Post Recommends</font></a></button><br>
								</div>
								<div class="basics3">
									<p style="color:black;text-decoration: underline;"><font size="5">Products Purchase</font></p>
									<button><a style="color:#575856;text-decoration:none;" href="purchasecartproducts.jsp"><font size="4">Purchase Cart Products</font></a></button>
									<button><a style="color:#575856;text-decoration:none;" href="mypurchaseditems.jsp"><font size="4">My Purchased Products</font></a></button>								
								</div>
								<div class="basics4">
									<button><a style="color:black;text-decoration:none;text-align:center;" href="index.html"><font size="5">Logout</font></a></button>
								</div>
								<p><font size="5">This are the main things which can describe the machanisms , features , basic requires and few other important info about this website. </p></font>
					</div>
					<div class="sidecontent">
							<div class="heading">
							<h3 style="margin-left:10px;"><font size="8">Welcome to get recommendation</h3></font>
							</div><hr/>
							<div class="body1">
								<p><font size="5">
										Nowadays, a big part of people rely on available content in social media in their decisions (e.g reviews and feedback on a topic or product).
										 The possibility that anybody can leave a review provide a golden opportunity for spammers to write spam reviews about products
										  and services for different interests. Identifying these spammers and the spam content is a hot topic of research and although a considerable 
										  number of studies have been done recently toward this end, but so far the methodologies put forth still barely detect spam reviews, and none 
										  of them show the importance of each extracted feature type. In this study, we propose a novel framework, named NetSpam, which utilizes spam 
										  features for modeling review datasets as heterogeneous information networks to map spam detection procedure into a classification problem in
										   such networks. Using the importance of spam features help us to obtain better results in terms of different metrics experimented on real-world
										    review datasets from Yelp and Amazon websites. The results show that NetSpam outperforms the existing methods and among four categories of
										     features, including review-behavioral, user-behavioral, reviewlinguistic, user-linguistic, the first type of features performs better than 
										     the other categories.
								</font></p>
							</div>
					</div>		
			</div>
		</div>
</body>
</html>