<%-- 
    Document   : header
    Created on : Apr 11, 2015, 5:29:05 PM
    Author     : HanXiangyu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<div class="header">

		<div class="top-header">

			<div class="wrap">

				

				<div class="header-right">
					<ul>
						<li>
							<i class="user"></i>
							<%if (session.getAttribute("userid")!=null){ %>
                                                        <a href="viewAccount.jsp"><%out.print(session.getAttribute("useremail"));%></a>
                                                        <%} else{ %>
                                                        <a href="login.jsp">Login</a>
                                                        <% } %>
						</li>
                                                
//                                                <%if (session.getAttribute("userid")!=null){ %>
//                                                <li>
//							<i class="cart"></i>
//							<a href="order.jsp">My Shopping Cart</a>
//						</li>
                                                    <%-- start web service invocation --%>
//    <%
//	wss.PurchaseMgtWS_Service service5 = new wss.PurchaseMgtWS_Service();
//	wss.PurchaseMgtWS port5 = service5.getPurchaseMgtWSPort();
//	 // TODO initialize WS operation arguments here
//	java.lang.Long accountId = Long.parseLong(session.getAttribute("userid").toString());
//	// TODO process result here
//	java.util.List<wss.OrderEntity> result5 = port5.viewShoppingCart(accountId);
//        int size = result5.size();
//    %>
//    <%-- end web service invocation --%>

                                                <li class="last">
                                                    <%=size%>                                    
                                                </li>
//                                                <%}%>
                                                
						<li class="login">
							<i class="lock"></i>
//							<%if (session.getAttribute("userid")!=null){ %>
							<a href="logout.jsp">Logout</a>
//                                                        <%} else{ %>               
							<a href="register.jsp">Sign up</a>
//                                                        <% } %>
						</li>
						
					</ul>
				</div>

				<div class="clearfix"></div>

			</div>

		</div>

		<div class="wrap">

			<div class="header-bottom">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo-4227.png" class="img-responsive" alt="" /></a>
				</div>
                            <div class="search">
					<div class="search2">
					  <form action="searchProduct.jsp" method="GET">
						<input type="submit" value="">
						<input type="text" name="productName" value="Search for a product, category or brand" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search for a product, category or brand';}"/>
					  </form>
					</div>
				</div>
				
				<div class="clearfix"></div>
			</div>

		</div>

	</div>
</html>
