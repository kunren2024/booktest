package chapter14;
//分離レベルバージョン（テキストのサンプル

import java.io.IOException;
import java.io.PrintWriter;
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
import tool.Page;

@WebServlet(urlPatterns={"/chapter14/transaction2"})
public class Transaction2 extends HttpServlet {

	public void doPost (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {
			InitialContext ic=new InitialContext();
			DataSource ds=(DataSource)ic.lookup(
				"java:/comp/env/jdbc/book");
			Connection con=ds.getConnection();

			String name=request.getParameter("name");
			int price=Integer.parseInt(request.getParameter("price"));
			String area=request.getParameter("area");

			con.setAutoCommit(false);
            // SERIALIZABLEを使用して悲観ロックと併用可能
            con.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE); 

			// 悲観ロックを使用するためのクエリ（SELECT ... FOR UPDATE）
			PreparedStatement st=con.prepareStatement(
				"SELECT * FROM product WHERE name = ?");
			st.setString(1, name);
			ResultSet rs=st.executeQuery();
			
			int count = 0;
			while (rs.next()) {
			    count++;
			}

			System.out.println("１度目件数: " + count);
			
			
			 st=con.prepareStatement(
					"SELECT * FROM product WHERE name = ?");
				st.setString(1, name);
				 rs=st.executeQuery();
				 
				  count = 0;
				 while (rs.next()) {
				     count++;
				 }

				 System.out.println("2度目件数: " + count);

			if (rs.next()) {
				// 既に商品が存在する場合はロールバック
				con.rollback();
				out.println("商品は既に登録されています。");
			} else {
				// 商品を登録
				st=con.prepareStatement(
						"insert into product(name, price, area) values(?, ?, ?)");
				st.setString(1, name);
				st.setInt(2, price);
				st.setString(3, area);
				st.executeUpdate();

	            System.out.println("トランザクション1が待機しています...");
	            Thread.sleep(5000);  // 10秒間待機
	            System.out.println("トランザクション1が待機終了しました。");
				con.commit();
				out.println("商品を登録しました。");
			}

			con.setAutoCommit(true);

			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}
}
