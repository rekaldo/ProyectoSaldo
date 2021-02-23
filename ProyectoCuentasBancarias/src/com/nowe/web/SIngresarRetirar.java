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
import com.nowe.modelo.Movimiento;
import com.nowe.persistencia.AccesoCuentasBancarias;

/**
 * Servlet implementation class SIngresarRetirar
 */
@WebServlet("/singresarretirar")
public class SIngresarRetirar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SIngresarRetirar() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean respuesta = false;
		Movimiento m1, m2;
		String valor = request.getParameter("valor");
		
		int cuenta = Integer.parseInt(request.getParameter("cuenta"));
		double monto = Double.parseDouble(request.getParameter("monto"));
		
		AccesoCuentasBancarias accesoBBDD = new AccesoCuentasBancarias();
			m1 = new Movimiento(monto, cuenta);
			m2 = new Movimiento(monto, cuenta);
			
			if (valor.equals("m1")) {
				try {
					respuesta = accesoBBDD.Ingreso(m1);
					request.setAttribute("rValor", respuesta);
					
					RequestDispatcher rd = request.getRequestDispatcher("/ingresar_retirar.jsp");
					rd.forward(request, response);
				} 
				catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				
			}
			if (valor.equals("m2")) {
				try {
					respuesta = accesoBBDD.retiro(m2);
					request.setAttribute("rValor", respuesta);
					
					RequestDispatcher rd = request.getRequestDispatcher("/ingresar_retirar.jsp");
					rd.forward(request, response);
				} 
				catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			}
	}
}