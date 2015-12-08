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
@WebServlet(urlPatterns = {"/Request"})
public class Request extends HttpServlet {

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
            out.println("<title>Servlet Request</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Request at " + request.getContextPath() + "</h1>");
            
            try {
                Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "harish", "harish");
                Statement stmt = conn.createStatement();
                
                String requesterName = request.getParameter("requesterName");
                String requesterEmail = request.getParameter("requesterEmail");
                String requesterContactNumber = request.getParameter("requesterContactNumber");
                String requesterResidenceLocation = request.getParameter("requesterResidenceLocation");
                String requestedBloodGroup = request.getParameter("group");
                
                String cmd = "INSERT into requesters values(?,?,?,?,?)";
                
                PreparedStatement ps = conn.prepareStatement(cmd);
                ps.setString(1, requesterName);
                ps.setString(2, requesterEmail);
                ps.setString(3, requesterContactNumber);
                ps.setString(4, requesterResidenceLocation);
                ps.setString(5, requestedBloodGroup);
                
                int rowsAffected = ps.executeUpdate();
                
                if (rowsAffected > 0) {
                    out.println("<h1>Successfully request lodged. Redirecting...</h1>");
                    response.sendRedirect("http://localhost:8080/BloodDonor/request.jsp");
                } else {
                    out.println("<h1>Failed to register request</h1>");
                }
            } catch (Exception e) {
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
