package mysql;

import jdbc.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MysqlUtil {


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String sql = "insert into userinfo (id,`name`,age,otherinfo) values (1500,'吴强3',20,'很英俊，十分帅气')";
		//add(sql);
		
		//String sqldel = "delete from userinfo where id = 1500";
		//del(sqldel);
		
		//String[] col = {"id","username","age"};
		//String sql = "select * from t_userinfo ";
		//String strJson = MysqlUtil.getJsonBySql(sql, col);
		String[] col = {"id","username","realname","available"};
		String sql = "select * from t_table where id in (1,2,3)";
		String strJson = MysqlUtil.getJsonBySql(sql, col);
		System.out.println(strJson);
//		ArrayList< String[] > data = MysqlUtil.showUtil(sql, col);
//		System.out.println(  data.get(3)[2] );
//		
//		String str = MysqlUtil.show(sql, col);
//		
//		System.out.println(  str );
	}
	
	/**
	 * 用于插入数据
	 * @param sql insert语句
	 * @return
	 */
	public static int add(String sql) {
		// System.out.println("sql语句是：" + sql);
        int i=0;
        //数据库连接
        DBConnection db = new DBConnection();
        try {        
            PreparedStatement preStmt = (PreparedStatement) db.conn.prepareStatement(sql);
            preStmt.executeUpdate();
            preStmt.close();
            db.close();//关闭连接 
            i = 1;
           // System.out.println("数据插入成功，sql语句是：" + sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;//返回影响的行数，1为执行成功;
    }
    //
    public static ArrayList<String[]> showUtil( String sql, String[] colums){
        
    	 ArrayList<String[]>  result = new  ArrayList<String[]>();
         DBConnection db = new DBConnection();
         try {
            Statement stmt = (Statement) db.conn.createStatement();
            ResultSet rs = (ResultSet) stmt.executeQuery(sql);
           
            while(rs.next()){
               String[] dataRow = new String[colums.length];
               for( int i = 0; i < dataRow.length; i++ ) {
            	   dataRow[i] = rs.getString( colums[i] );
               }
               result.add(dataRow);
            }
            rs.close();
            db.close();//
        } catch (SQLException e) {
            e.printStackTrace();
        } 
         
         return result;
    }
    public static int getCount(String sql) {
		int sum = 0;
		DBConnection db = new DBConnection();
		try {
			Statement stmt = (Statement) db.conn.createStatement();
            ResultSet rs = (ResultSet) stmt.executeQuery(sql);
            while (rs.next()) {
            	sum += rs.getInt(1);
            	}
            rs.close();
            db.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return sum;
		
	}
    
    public static String getJsonBySql( String sql, String[] colums){
        
     System.err.println("标红信息展示sql:" + sql);
   	 ArrayList<String[]>  result = new  ArrayList<String[]>();
        DBConnection db = new DBConnection();
        try {
           Statement stmt = (Statement) db.conn.createStatement();
           ResultSet rs = (ResultSet) stmt.executeQuery(sql);
           while(rs.next()){
              String[] dataRow = new String[colums.length];
              for( int i = 0; i < dataRow.length; i++ ) {
           	   dataRow[i] = rs.getString( colums[i] );
              }
              result.add(dataRow);
           }
           rs.close();
           db.close();//
       } catch (SQLException e) {
           e.printStackTrace();
       }
        return listToJson(result,colums);
   }

    public static int update(String sql) {
        int i =0;
        DBConnection db = new DBConnection();
        try {
            PreparedStatement preStmt = (PreparedStatement) db.conn.prepareStatement(sql);
            preStmt.executeUpdate();
            preStmt.close();
            db.close();
            i = 1;
            System.out.println("数据更新成功，sql语句是：" + sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
    

    /**
     *  查询数据
     * @param sql select * from 表
     * @param params [id,name,sex,age] 我们要查询的列名的一个字符串数组
     * @return
     */
    public static String show(String sql, String[] params){
    	
    	List< Map<String,String> > listmap = new ArrayList<>();
    	
         DBConnection db = new DBConnection();
         ResultSet rs = null;
         try {
            Statement stmt = (Statement) db.conn.createStatement();
            rs = (ResultSet) stmt.executeQuery(sql);
            while(rs.next()){
            	Map<String,String> map = new HashMap<String,String>();
            	for(int i = 0; i < params.length; i++) {
            		map.put(params[i], rs.getString(params[i]));
            	}
            	listmap.add(map);
            }
            rs.close();
            db.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
         System.out.println(listmap+"12345678");
		return mapToJson(listmap); 
         
     
    }
    
  
    
  
    public static int del(String delstr) {
        int i=0;
        DBConnection db = new DBConnection();
        try {    
            PreparedStatement preStmt = (PreparedStatement) db.conn.prepareStatement(delstr);
            preStmt.executeUpdate();
            
            preStmt.close();
            db.close();
            i = 1;
            System.out.println("数据删除成功，sql语句是：" + delstr);
        } catch (SQLException e){
            e.printStackTrace();
        }
        return i;
    }

    
    /**
     * map转化为json数据字符串
     * @param maplist
     * @return
     */
    public static String mapToJson( List<Map<String,String>> maplist ) {
    	String jsonData = "{ \"data\":[";
		for(int i = 0; i < maplist.size(); i++) {
			String outstr = "[\"" ;
			int size = 0;
			for(String value : maplist.get(i).values()){
				size += 1;
				outstr += value;
				if( size < maplist.get(i).values().size() ) {
				     outstr += "\",\"";
				}
			}
		    outstr += "\"]";
		    
		    if(i < maplist.size() -1) {
		    	outstr += ",";
		    }
			jsonData += outstr;
			
		}
		jsonData += "]}";
		
		return jsonData;
    }
    
    public static String listToJson( ArrayList<String[]> list,String[] colums) {

    	String jsonStr = "[{\"status\":0}, {\"message\": \"成功\" }, {\"count\": 1000},{\"rows\":{\"item\":[";
    			for(int i = 0; i < list.size(); i++) {
    				String arr = "{";
    				for( int j = 0; j < list.get(0).length; j++) {
    					
    					if( list.get(i)[j] == null || "NULL".equals(list.get(i)[j])) {
    					    arr +="\"" +colums[j] +"\""+":";
    						arr += "\"\"";
    					}else {
    						arr += "\"" + colums[j] + "\""+":" ;
    						arr +=  "\"" + list.get(i)[j].replace("\"","\\\"") + "\"";
    					}
    					
    					if( j < list.get(0).length - 1 ) {
    						arr += ",";
    					}
    				}
    				arr += "}";
    				if( i < list.size() - 1 ) {
						arr += ",";
					}
    				
    				jsonStr += arr;
    			}
    			jsonStr += "]}}]";
    	
    	return jsonStr;
    }

}
