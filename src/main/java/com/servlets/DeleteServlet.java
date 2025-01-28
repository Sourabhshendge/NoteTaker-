package com.servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String idParam = req.getParameter("note_id");

			int noteId = Integer.parseInt(idParam);

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note noteObj = (Note) s.get(Note.class, noteId);
			s.delete(noteObj);
			tx.commit();
			s.close();
			resp.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
