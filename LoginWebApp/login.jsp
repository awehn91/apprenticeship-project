<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test",
            "root", "password");
    Statement st = con.createStatement();
    ResultSet rs;
    String s = "select * from user where userName='" + userName + "' and password='" +password + "'";
    out.println("you have declined binding :(\n");
    rs = st.executeQuery(s);
    if (rs.next()) {
        session.setAttribute("userid", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>