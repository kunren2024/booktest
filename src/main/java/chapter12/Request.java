package chapter12;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Page;

@WebServlet(urlPatterns={"/chapter12/request"})
public class Request extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		
		out.println("<p>Request URL<br>"+request.getRequestURL()+"</p>");
		out.println("<p>Host<br>"+request.getHeader("Host")+"</p>");
		out.println("<p>User-Agent<br>"+request.getHeader("User-Agent")+"</p>");
		out.println("<p>Remote Address<br>"+request.getRemoteAddr()+"</p>");
		
//		response.getWriter().println("Request Method: " + request.getMethod());
//        response.getWriter().println("Request URI: " + request.getRequestURI());
//        response.getWriter().println("Context Path: " + request.getContextPath());
//        response.getWriter().println("Servlet Path: " + request.getServletPath());
//        response.getWriter().println("Query String: " + request.getQueryString());
//        response.getWriter().println("Protocol: " + request.getProtocol());
		
        // リクエストヘッダーの取得
//        String accept = request.getHeader("Accept");
//        String acceptEncoding = request.getHeader("Accept-Encoding");
//        String acceptLanguage = request.getHeader("Accept-Language");
//        String connection = request.getHeader("Connection");
//        String host = request.getHeader("Host");
//        String secFetchDest = request.getHeader("Sec-Fetch-Dest");
//        String secFetchMode = request.getHeader("Sec-Fetch-Mode");
//        String secFetchSite = request.getHeader("Sec-Fetch-Site");
//        String secFetchUser = request.getHeader("Sec-Fetch-User");
//        String upgradeInsecureRequests = request.getHeader("Upgrade-Insecure-Requests");
//        String userAgent = request.getHeader("User-Agent");
//        String secChUa = request.getHeader("sec-ch-ua");
//        String secChUaMobile = request.getHeader("sec-ch-ua-mobile");
//        String secChUaPlatform = request.getHeader("sec-ch-ua-platform");

        // Content-Type ヘッダーの設定
        response.setHeader("Content-Type", "text/html;charset=UTF-8");
        
        // Expires ヘッダーの設定
        response.setHeader("Expires", "Wed, 21 Oct 2025 07:28:00 GMT");
        
        // Set-Cookie ヘッダーの設定
        response.setHeader("Set-Cookie", "user=guest; Path=/; HttpOnly");
        response.setHeader("cat", "nekodesu");

		Page.footer(out);
	}
}
