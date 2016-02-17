<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/test",
            "root", "password");
    //Statement st = connection.createStatement();
    ResultSet rs;
    //String s = "select * from user where userName='" + userName + "' and password='" +password + "'";
    //out.println(s);
    
    PreparedStatement command = connection.prepareStatement(
    		"select *"
    		+ " from user"
    		+ " where userName = ?"
    		+ " and password = ?"
    		);
    command.setString(1, userName);
    command.setString(2, password);
    
    out.println("you have chosen binding :)");
    
    
    rs = command.executeQuery();
    if (rs.next()) {
        session.setAttribute("userid", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>