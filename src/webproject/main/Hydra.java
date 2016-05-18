package webproject.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import webproject.commun.Constants;
import webproject.commun.Language;
import webproject.commun.Tools;

public class Hydra extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		Tools.initiatePath(request);
		
		HttpSession session = request.getSession();
		Language language = (Language) session.getAttribute(Constants.SESS_LANG);
		if(language == null){
			language = new Language(request);
		}
		language.setCurrentTool(Constants.TOOL_HYDRA);
		session.setAttribute(Constants.SESS_LANG, language);
		
		this.getServletContext().getRequestDispatcher(Constants.VIEW_HYDRA).forward(request, response);
	}
}
