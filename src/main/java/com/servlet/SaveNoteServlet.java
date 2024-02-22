package com.servlet;
import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.PrintWriter;
import java.util.Date;
import java.io.IOException;

@WebServlet(name = "SaveNoteServlet", value = "/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// try to solve the exception , so we use the try and catch block
        try
        {
            // fetch the data from the add_note which are title and content
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            Note note = new Note(title,content,new Date()); //now add the data on tha database
            //  System.out.println(note.getId()+ " : " + note.getTitle());
            // now perform hibernate save() method
            Session s = FactoryProvider.getFactory().openSession();
            // want to add permanently data on the database , then we use the transaction
            Transaction tx1 = s.beginTransaction();
            s.save(note);
            tx1.commit();
            s.close();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h1 style='text-align:center;'> Note is added successfully </h1>");
            out.println("<h1 style='text-align:center;'> <a href='all_notes.jsp'> View All Notes </a> </h1>");

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}