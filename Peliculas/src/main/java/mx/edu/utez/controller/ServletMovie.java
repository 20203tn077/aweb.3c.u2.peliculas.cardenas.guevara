package mx.edu.utez.controller;

import mx.edu.utez.model.BeanMovie;
import mx.edu.utez.model.DaoMovie;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletMovie", value = "/ServletMovie")
public class ServletMovie extends HttpServlet {
    Logger logger = LoggerFactory.getLogger(ServletMovie.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("movieList", new DaoMovie().findAll());
        request.getRequestDispatcher("/views/movies.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        switch (request.getParameter("action")) {
            case "delete":
                new DaoMovie().delete(Long.parseLong(request.getParameter("deleteId")));
                doGet(request,response);
                break;
            case "create":
                BeanMovie movie = new BeanMovie();
                movie.setName(request.getParameter("nameInput"));
                movie.setDescription(request.getParameter("descriptionInput"));
                movie.setReleaseDate(request.getParameter("releaseDateInput"));
                movie.setBoxOffice(Integer.parseInt(request.getParameter("boxOfficeInput")));
                new DaoMovie().create(movie);
                doGet(request,response);
                break;
            case "update":
                BeanMovie movie2 = new BeanMovie();
                movie2.setId(Long.parseLong(request.getParameter("idUpdate")));
                movie2.setName(request.getParameter("nameInput"));
                movie2.setDescription(request.getParameter("descriptionInput"));
                movie2.setReleaseDate(request.getParameter("releaseDateInput"));
                movie2.setBoxOffice(Integer.parseInt(request.getParameter("boxOfficeInput")));
                new DaoMovie().update(movie2);
                doGet(request,response);
                break;
            case "goUpdate":
                request.setAttribute("movie", new DaoMovie().findByID(Long.parseLong(request.getParameter("updateId"))));
                request.getRequestDispatcher("/views/update.jsp").forward(request,response);
        }
    }
}
