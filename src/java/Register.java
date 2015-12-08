/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author harish
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            
            try {
                Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "harish", "harish");
                Statement stmt = conn.createStatement();
                
                String donorName = request.getParameter("donorName");
                String donorEmail = request.getParameter("donorEmail");
                String donorContact = request.getParameter("donorMobileNumber");
                String donorLocation = request.getParameter("donorResidenceLocation");
                String donorBloodGroup = request.getParameter("group");
                
                String cmd = "INSERT into donors values(?,?,?,?,?)";
                
                PreparedStatement ps = conn.prepareStatement(cmd);
                ps.setString(1, donorName);
                ps.setString(2, donorBloodGroup);
                ps.setString(3, donorLocation);
                ps.setString(4, donorEmail);
                ps.setString(5, donorContact);
                
                int rowsAffected = ps.executeUpdate();
                System.out.println("<h1>rows affected = </h1>" + rowsAffected);

                if (rowsAffected > 0) {
                    out.println("<h1>You have successfully registered.Redirecting...</h1>");
                    response.sendRedirect("http://localhost:8080/BloodDonor/");
                    out.println("<h1>Redirection completed.</h1>");
                } else {
                    response.sendRedirect("http://localhost:8080/BloodDonor/find.jsp");
                    out.println("<h1>Registration Failed</h1>");
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
