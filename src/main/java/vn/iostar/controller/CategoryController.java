package vn.iostar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iostar.model.Category;
import vn.iostar.service.CategoryService;
import vn.iostar.service.CategoryServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/categories", "/admin/category/add", "/admin/category/edit", "/admin/category/delete"})
public class CategoryController extends HttpServlet {
    private CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        
        switch (path) {
            case "/admin/categories":
                showCategoryList(req, resp);
                break;
            case "/admin/category/add":
                showAddForm(req, resp);
                break;
            case "/admin/category/edit":
                showEditForm(req, resp);
                break;
            case "/admin/category/delete":
                deleteCategory(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        
        switch (path) {
            case "/admin/category/add":
                addCategory(req, resp);
                break;
            case "/admin/category/edit":
                editCategory(req, resp);
                break;
        }
    }

    private void showCategoryList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.getAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.get(id);
        req.setAttribute("category", category);
        req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
    }

    private void addCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        String catename = req.getParameter("catename");
        String icons = req.getParameter("icons");
        
        if (catename == null || catename.trim().isEmpty()) {
            req.setAttribute("error", "Tên danh mục không được để trống");
            req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
            return;
        }

        Category category = new Category();
        category.setCatename(catename);
        category.setIcons(icons);
        
        categoryService.insert(category);
        resp.sendRedirect(req.getContextPath() + "/admin/categories");
    }

    private void editCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        int id = Integer.parseInt(req.getParameter("cateid"));
        String catename = req.getParameter("catename");
        String icons = req.getParameter("icons");
        
        if (catename == null || catename.trim().isEmpty()) {
            Category category = categoryService.get(id);
            req.setAttribute("category", category);
            req.setAttribute("error", "Tên danh mục không được để trống");
            req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
            return;
        }

        Category category = new Category();
        category.setCateid(id);
        category.setCatename(catename);
        category.setIcons(icons);
        
        categoryService.edit(category);
        resp.sendRedirect(req.getContextPath() + "/admin/categories");
    }

    private void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        categoryService.delete(id);
        resp.sendRedirect(req.getContextPath() + "/admin/categories");
    }
}