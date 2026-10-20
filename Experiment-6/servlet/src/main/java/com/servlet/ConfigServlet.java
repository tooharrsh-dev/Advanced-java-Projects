package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/config")
public class ConfigServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        var config = getServletConfig();

        String value =
                config.getInitParameter("name");
                

        PrintWriter out =
                response.getWriter();

        out.println("<h1>ServletConfig</h1>");
        out.println("<p>Value: " + value + "</p>");
    }
}