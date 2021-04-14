<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.muthagroup.connectionModel.Connection_Utility"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>SimpleAdmin - Dashboard</title>

<!-- Stylesheets -->
<link rel="stylesheet" href="css/style.css">

<!-- Optimize for mobile devices -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- jQuery & JS files -->
<link rel="stylesheet" type="text/css" href="view.css" media="all">
<script type="text/javascript" src="view.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<link rel="stylesheet" href="css/style.css">
<script src="js/script.js"></script>

<!-- 

TO LOCK PAGE BACK EVENT
 -->

<script type="text/javascript">
	function noBack() {
		window.history.forward();
	}
	noBack();
	window.onload = noBack;
	window.onpageshow = function(evt) {
		if (evt.persisted)
			noBack();
	};
	window.onunload = function() {
		void (0);
	};
</script>

</head>
<body>

	<!-- TOP BAR -->
	<div id="top-bar">

		<div class="page-full-width cf">

			<ul id="nav" class="fl">
				<!-- 				<li class="v-sep"><a href="#"
					class="round button dark ic-left-arrow image-left">Go to
						website</a></li> -->
				<li class="v-sep"><a href="Admin_Index.jsp"
					class="round button dark menu-user image-left">Logged in as <strong>Admin</strong></a>
				</li>

				<!--  	<li><a href="#"
					class="round button dark menu-email-special image-left">
						new Complaints</a></li> -->
				<li><a href="logout.jsp"
					class="round button dark menu-logoff image-left">Log out</a></li>

			</ul>
			<!-- end nav -->


			<form action="#" method="POST" id="search-form" class="fr">
				<fieldset>
					<input type="text" id="search-keyword"
						class="round button dark ic-search image-right"
						placeholder="Search..." /> <input type="hidden" value="SUBMIT" />
				</fieldset>
			</form>

		</div>
		<!-- end full-width -->

	</div>
	<!-- end top-bar -->



	<!-- HEADER -->
	<div id="header-with-tabs">

		<div class="page-full-width cf">

			<ul id="tabs" class="fl">
				<li><a href="Admin_Index.jsp" class="active-tab dashboard-tab">Admin
						Home</a></li>
			</ul>
			<!-- end tabs -->

			<!-- Change this image to your own company's logo -->
			<!-- The logo will automatically be resized to 30px height. -->
			<a href="Admin_Index.jsp" id="company-branding-small" class="fr"><img
				src="images/company-logo.png" alt="Blue Hosting" /></a>

		</div>
		<!-- end full-width -->

	</div>
	<!-- end header -->



	<!-- MAIN CONTENT -->
	<div id="content">

		<div class="page-full-width cf">

			<div class="side-menu fl">

				<h3>Contents</h3>
				<ul>
					<li><a href="Admin_Index.jsp">Add Users</a></li>
					<li><a href="Add_Company.jsp">Add Company</a></li>
					<li><a href="Add_Customer.jsp">Add Customer</a></li>
					<li><a href="Add_Item.jsp">Add Item</a></li>
					<li><a href="Add_Defect.jsp">Add Defect</a></li>
					<li><a href="Add_Category.jsp">Add Category</a></li>
					<li><a href="Add_Action.jsp">Add Action</a></li>
					<li><a href="Add_AutoMailing_List.jsp">Add Auto Mailing
							List</a></li>

				</ul>

			</div>
			<!-- end side-menu -->

			<div class="side-content fr">

				<div class="content-module">

					<div class="content-module-heading cf">

						<h3 class="fl">Add User</h3>

					</div>
					<!-- end content-module-heading -->


					<div class="content-module-main" id="form_container">



						<div id="form_container">

							<form class="appnitro" method="post" action="Admin_Index">



								<%
									// GET COMPANY USERS
									Connection con = Connection_Utility.getConnection();
									PreparedStatement ps_company = con
											.prepareStatement("select * from user_tbl_company");
									ResultSet rs_company = ps_company.executeQuery();
								%>

								<ul>

									<li id="li_6"><label class="description" for="element_6">Company
									</label>
										<div>
											<select class="element select medium" id="element_6"
												name="company">
												<option value="">----------SELECT----------</option>
												<%
													while (rs_company.next()) {
												%>
												<option value="<%=rs_company.getString("Company_Id")%>"><%=rs_company.getString("Company_Name")%></option>
												<%
													}
													rs_company.close();
												%>

											</select>
										</div></li>

									<li id="li_1"><label class="description" for="element_1">Enter
											name </label>
										<div>
											<input id="element_1" name="user_name"
												class="element text medium" type="text" maxlength="255"
												value="" />
										</div></li>
									<li id="li_2"><label class="description" for="element_2">User
											designation </label>
										<div>
											<input id="element_2" name="user_designation"
												class="element text medium" type="text" maxlength="255"
												value="" />
										</div></li>
									<%
										PreparedStatement ps_dept = con
												.prepareStatement("select * from user_tbl_dept");
										ResultSet rs_dept = ps_dept.executeQuery();
									%>
									<li id="li_6"><label class="description" for="element_6">Department
									</label>
										<div>
											<select class="element select medium" id="element_6"
												name="dept">
												<option value="">-------SELECT--------</option>
												<%
													while (rs_dept.next()) {
												%>
												<option value="<%=rs_dept.getInt("Dept_Id")%>"><%=rs_dept.getString("Department")%></option>
												<%
													}
													rs_dept.close();
												%>

											</select>
										</div></li>



									<li id="li_5"><label class="description" for="element_5">Email
											Id </label>
										<div>
											<input id="element_5" name="email"
												class="element text medium" type="text" maxlength="255"
												value="" />
										</div></li>
									<li id="li_3"><label class="description" for="element_3">Login
											Name </label>
										<div>
											<input id="element_3" name="login_name"
												class="element text medium" type="text" maxlength="255"
												value="" />
												<label class="description" for="element_3"><b style="color: red"> Login
											Name Aready Present Please Enter the another Login Name</b></label>
										</div></li>
									<li id="li_4"><label class="description" for="element_4">Password
									</label>
										<div>
											<input id="element_4" name="password"
												class="element text medium" type="password" maxlength="255"
												value="" />
										</div></li>

									<li class="buttons"><input type="hidden" name="form_id"
										value="578220" /> <input id="saveForm" class="button_text"
										type="submit" name="submit" value="ADD" /></li>




								</ul>
							</form>

						</div>










					</div>
					<!-- end content-module -->

				</div>
				<!-- end half-size-column -->

			</div>
			<!-- end content-module-main -->

		</div>
		<!-- end content-module -->



	</div>
	<!-- end side-content -->



	<!-- FOOTER -->
	<div id="footer">

		<p>
			<a href="http://www.muthagroup.com">Mutha Group of Foundries, Satara</a>
		</p>

	</div>
	<!-- end footer -->


</body>
</html>