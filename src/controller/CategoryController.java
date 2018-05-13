package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDao;
import dao.SubCategoryDao;

@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {

	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryController() {
	super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    	doPost(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
		Integer parentId;
		String name, description;
		String urlRedirect = "/shopper/admin/category.jsp";
		
		parentId = Integer.valueOf(request.getParameter("item"));
		name = request.getParameter("categoryName");
		if (name == null) {
			response.sendRedirect(urlRedirect);
		}
		description = request.getParameter("description");
		System.out.println(parentId);
		switch (parentId) {
		case 0:
			CategoryDao categoryDao = new CategoryDao();
			categoryDao.save(name, description);
			break;
		default:
			SubCategoryDao subCateDao = new SubCategoryDao();
			subCateDao.save(parentId, name, description);
			break;
		}
	
		response.sendRedirect(urlRedirect);
    }
}
