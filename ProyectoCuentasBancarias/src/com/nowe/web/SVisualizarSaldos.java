package com.nowe.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nowe.modelo.Cliente;
import com.nowe.persistencia.AccesoCuentasBancarias;

/**
 * Servlet implementation class SVisualizarSaldos
 */
@WebServlet("/svisualizarsaldos")
public class SVisualizarSaldos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SVisualizarSaldos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double respuesta;
		String saldo = request.getParameter("saldo");
		request.setAttribute("rError", "");
		
		AccesoCuentasBancarias acc = new AccesoCuentasBancarias();
		
		if(saldo.equals("c")){
			try {
				int id= Integer.parseInt(request.getParameter("id"));
				
				respuesta = acc.consultaSaldo(id);
				request.setAttribute("rSaldo", respuesta);
				
				RequestDispatcher rd = request.getRequestDispatcher("/visualizar_saldo.jsp");
				rd.forward(request, response);
			}
			
			catch(ClassNotFoundException | SQLException ex){
				request.setAttribute("rError", ex.toString());
				RequestDispatcher rd = request.getRequestDispatcher("/visualizar_saldo.jsp");
				rd.forward(request, response);
			}
		}
	
		if(saldo.equals("cd"))	{
			try {
				int id= Integer.parseInt(request.getParameter("id"));
				
				respuesta = acc.consultaSaldoCDT(id);
				request.setAttribute("rSaldo", respuesta);
				
				RequestDispatcher rd = request.getRequestDispatcher("/visualizar_saldo.jsp");
				rd.forward(request, response);
			}
			
			catch(ClassNotFoundException | SQLException ex){
				request.setAttribute("rError", ex.toString());
				RequestDispatcher rd = request.getRequestDispatcher("/visualizar_saldo.jsp");
				rd.forward(request, response);
			}
		} 
		
		if(saldo.equals("cl"))	{
			try {
				String id= request.getParameter("id");
				respuesta = acc.consultaSaldoTotal(id);
				request.setAttribute("rSaldo", respuesta);
				
				RequestDispatcher rd = request.getRequestDispatcher("/visualizar_saldo.jsp");
				rd.forward(request, response);
			}
			
			catch(ClassNotFoundException | SQLException ex){
				request.setAttribute("rError", ex.toString());
				RequestDispatcher rd = request.getRequestDispatcher("/visualizar_saldo.jsp");
				rd.forward(request, response);
			}
		} 	
	}
}
