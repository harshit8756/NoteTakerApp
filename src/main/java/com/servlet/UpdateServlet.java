package com.servlet;
import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.util.Date;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    public UpdateServlet() {
        super();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try{
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int noteId = Integer.parseInt(request.getParameter("noteId").trim());
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
//            now load the data
            Note note = s.get(Note.class,noteId);
            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());
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
