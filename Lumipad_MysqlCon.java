import java.sql.*;
class MysqlCon{
	public static void main(String args[]){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad?autoReconnect=true&useSSL=false","root","password");
			//here lumipad is database name, root is username and password
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from users");
			while(rs.next()){
				System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3) +" "+rs.getString(4)+" "+rs.getString(5));
			}
			con.close();
		}catch(Exception e){ 
			System.out.println(e);
		}
	}
}