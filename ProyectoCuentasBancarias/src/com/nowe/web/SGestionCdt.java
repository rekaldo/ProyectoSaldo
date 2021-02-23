package com.nowe.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nowe.modelo.CDT;
import com.nowe.modelo.Cliente;
import com.nowe.persistencia.AccesoCuentasBancarias;

/**
 * Servlet implementation class SGestionCdt
 */
@WebServlet("/sgestioncdt")
public class SGestionCdt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SGestionCdt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean respuesta;
        CDT inversion = null;
        String valor = request.getParameter("valor");
		 
        AccesoCuentasBancarias acb = new AccesoCuentasBancarias();
        if(valor.equals("c")){
        	int idCuenta = Integer.parseInt(request.getParameter("idCuenta"));
        	double interesesMensuales = Double.parseDouble(request.getParameter("interesesMensuales"));
        	double valorInversion = Double.parseDouble(request.getParameter("valorInversion"));
        try {
        	
			inversion = new CDT(idCuenta, interesesMensuales, valorInversion);
        	
        	respuesta = acb.crearInversion(inversion);
            request.setAttribute("rValor", respuesta);
			
			RequestDispatcher rd = request.getRequestDispatcher("/gestionar_cdt.jsp");
			rd.forward(request, response);

        	} 
        	catch(ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
      }
        boolean respuesta1;
  
        if(valor.equals("ct")){
        	int idInversion = Integer.parseInt(request.getParameter("cdt"));
        	
        try {
        	respuesta1 = acb.cerrarInversion(idInversion);
            request.setAttribute("rValor", respuesta1);
			
			RequestDispatcher rd = request.getRequestDispatcher("/gestionar_cdt.jsp");
			rd.forward(request, response);

        	} 
        	catch(ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
      }
	}
}
