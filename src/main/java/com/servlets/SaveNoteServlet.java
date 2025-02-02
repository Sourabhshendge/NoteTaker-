package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.entites.Note;
import com.helper.FactoryProvider;

// Annotation-based configuration (No web.xml required if annotations are used)

public class SaveNoteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(title, content, new Date());

			Session s = new FactoryProvider().getFactory().openSession();

			Transaction tx = s.beginTransaction();

			s.save(note);

			tx.commit();

			s.close();
			
			response.setContentType("text/html");
			
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center'>Note Added Successfully</h1>");
			out.println("<h1 style='text-align:center'><a href='all_notes.jsp'> View all notes</a></h1>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
