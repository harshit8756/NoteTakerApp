package com.servlet;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

@WebServlet(name = "DeleteServlet", value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    public DeleteServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            // now fetching the note_id
            int noteID = Integer.parseInt(request.getParameter("note_id").trim());
            // delete note with the help of the Hibernate , now create the session
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            Note note = (Note)s.get(Note.class,noteID);
            s.delete(note);
            tx.commit();
            s.close();
            response.sendRedirect("all_notes.jsp");

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }




    }

}
