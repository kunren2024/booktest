package chapter14;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/chapter14/ProductServlet"})
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(
    		HttpServletRequest request, HttpServletResponse response
    	) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup("java:/comp/env/jdbc/book");
            con = ds.getConnection();
            st = con.prepareStatement("SELECT * FROM product");
            rs = st.executeQuery();
            StringBuilder options = new StringBuilder();
            while (rs.next()) {
                String name = rs.getString("name");
                options.append("<option value='" + name + "'>" + name + "</option>");
            }
            request.setAttribute("productOptions", options.toString());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) { }
            if (st != null) try { st.close(); } catch (Exception e) { }
            if (con != null) try { con.close(); } catch (Exception e) { }
        }
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}
