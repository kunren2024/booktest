package chapter22;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Product;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/chapter22/jstl"})
public class JSTL extends HttpServlet {
	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try {
			ProductDAO dao=new ProductDAO();
			List<Product> list=dao.search("");

			request.setAttribute("list", list);
			
//			例1: 配列をループ
			request.setAttribute("names", new String[]{"Alice", "Bob", "Charlie"});
//			例2: リストをループ
			List<String> fruits = Arrays.asList("Apple", "Banana", "Cherry");
			request.setAttribute("fruits", fruits);
//			例3: begin と end 属性を使用
//			例4: Mapをループ
			Map<String, String> capitals = new HashMap<>();
			capitals.put("Japan", "Tokyo");
			capitals.put("USA", "Washington, D.C.");
			capitals.put("France", "Paris");
			request.setAttribute("capitals", capitals);

//			例1: 単純な条件分岐
			request.setAttribute("isAdmin", true);
//			例2: 値の比較
			request.setAttribute("userRole", "admin");
//			3: 複数条件を使用
//			例4: 否定条件
			request.setAttribute("isLoggedIn", false);
//			例5: 数値の比較
			request.setAttribute("age", 20);
//			3. elseの代替（通常はchooseを使用）
			
//			JSTL：choose
//			例1: シンプルな条件分岐
			request.setAttribute("userRole", "admin");
//			例2: 数値の条件分岐
			request.setAttribute("points", 75);

			
			
			
			
			
			request.getRequestDispatcher("jstl.jsp")
				.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}
}
