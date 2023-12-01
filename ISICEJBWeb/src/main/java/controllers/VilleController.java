package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.HotelIDAO;
import dao.IDaoLocale;
import entities.Hotel;
import entities.Ville;

@WebServlet("/VilleController")
public class VilleController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private IDaoLocale<Ville> vdao;
    @EJB
    private HotelIDAO hdao;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Ville> villeList = vdao.findAll();
        request.setAttribute("villes", villeList);
        request.getRequestDispatcher("/ville.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
       

     
        if ("delete".equals(action)) {
            int villeId = Integer.parseInt(request.getParameter("id"));
            Ville villeToDelete = vdao.findById(villeId);

            if (villeToDelete != null) {
                vdao.delete(villeToDelete);

                // Set success message
                request.setAttribute("successMessage", "Ville supprimée avec succès!");

                // Load the updated city list and display success message
                List<Ville> villeList = vdao.findAll();
                request.setAttribute("villes", villeList);

                // Forward to the same page
                RequestDispatcher dispatcher = request.getRequestDispatcher("/ville.jsp");
                dispatcher.forward(request, response);
            }

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("Name");

            Ville fieldToEdit = vdao.findById(id);
            if (fieldToEdit != null) {
                fieldToEdit.setNom(nom);
                vdao.update(fieldToEdit);
            }
            response.sendRedirect(request.getContextPath() + "/VilleController");
        } else if ("showform".equals(action)) {
            try {
                showEditForm(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/ville.jsp");
            }
        } else if ("showlist".equals(action)) {
            try {
                showList(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/ville.jsp");
            }
        } else {
            // Adding a new city
            String nom = request.getParameter("Name");
            Ville newVille = new Ville(nom);

            if (vdao.create(newVille)) {
                // Set success message
                request.setAttribute("successMessage", "Nouvelle ville ajoutée avec succès!");

                // Load the updated city list and display success message
                List<Ville> villeList = vdao.findAll();
                request.setAttribute("villes", villeList);

                // Forward to the same page
                RequestDispatcher dispatcher = request.getRequestDispatcher("/ville.jsp");
                dispatcher.forward(request, response);
                return; // Make sure to return after forwarding
            } else {
                System.out.println("Failure: Ville not created.");
            }
        }}

    private void showList(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        List<Hotel> hotelList = hdao.findByVille(vdao.findById(id).getNom());
        request.setAttribute("hotels", hotelList);
        request.setAttribute("villes", vdao.findById(id).getNom());
        request.getRequestDispatcher("/villesfield.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ville existingVille = vdao.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/editField.jsp");
        request.setAttribute("villes", existingVille);
        dispatcher.forward(request, response);
    }
}
