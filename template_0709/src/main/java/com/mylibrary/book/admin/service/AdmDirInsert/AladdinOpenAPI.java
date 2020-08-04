package com.mylibrary.book.admin.service.AdmDirInsert;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

public class AladdinOpenAPI {
	private static final String BASE_URL = "http://www.aladdin.co.kr/ttb/api/ItemSearch.aspx?";
	
	final static String Driver = "oracle.jdbc.driver.OracleDriver";
	final static String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final static String user = "DB-USER";
	final static String psw = "DB-PW";
	
	static Connection conn = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	static void Connection() throws Exception{
		Class.forName(Driver);
		conn = DriverManager.getConnection(URL, user, psw);
		System.out.println("");
	}
	static int findBid() throws Exception{
		pstmt=conn.prepareStatement("select max(to_number(bid)) from booklist");
		int ret = 0;
		rs=pstmt.executeQuery();
		while(rs.next()) ret=rs.getInt(1);
		
		return ret;
	}
	
	static String getDeciDiv(Item item) {
		String result1;
		if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("한국")) {
			result1 = "810";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("중국")) {
			result1 = "820";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("일본")) {
			result1 = "830";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("영미")) {
			result1 = "840";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("독일")) {
			result1 = "850";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("프랑스")) {
			result1 = "860";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("스페인")) {
			result1 = "870";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("이탈리아")) {
			result1 = "880";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("기타")) {
			result1 = "890";
		} else if ((item.CategoryName).contains("소설") && (item.CategoryName).contains("외국")) {
			result1 = "800";
		} else if ((item.CategoryName).contains("형이상학")) {
			result1 = "110";
		} else if ((item.CategoryName).contains("인식론") || (item.CategoryName).contains("인과론")||(item.CategoryName).contains("인간학")) {
			result1 = "120";
		} else if ((item.CategoryName).contains("철학")&&(item.CategoryName).contains("체계")) {
			result1 = "130";
		} else if ((item.CategoryName).contains("경학")) {
			result1 = "140";
		} else if ((item.CategoryName).contains("동양") && ((item.CategoryName).contains("사상")||(item.CategoryName).contains("철학"))) {
			result1 = "150";
		} else if ((item.CategoryName).contains("서양") && ((item.CategoryName).contains("사상")||(item.CategoryName).contains("철학"))) {
			result1 = "160";
		} else if ((item.CategoryName).contains("논리학")) {
			result1 = "170";
		} else if ((item.CategoryName).contains("심리학")) {
			result1 = "180";
		} else if ((item.CategoryName).contains("윤리학") && ((item.CategoryName).contains("도덕철학"))) {
			result1 = "190";
		} else if ((item.CategoryName).contains("비교종교")) {
			result1 = "210";
		} else if ((item.CategoryName).contains("불교")) {
			result1 = "220";
		} else if ((item.CategoryName).contains("기독교")) {
			result1 = "230";
		} else if ((item.CategoryName).contains("도교")) {
			result1 = "240";
		} else if ((item.CategoryName).contains("천도교")) {
			result1 = "250";
		} else if ((item.CategoryName).contains("신도")) {
			result1 = "260";
		} else if ((item.CategoryName).contains("힌두교")||(item.CategoryName).contains("브라만교")) {
			result1 = "270";
		} else if ((item.CategoryName).contains("이슬람교")) {
			result1 = "280";
		} else if ((item.CategoryName).contains("기타")&&(item.CategoryName).contains("종교")) {
			result1 = "290";
		} else if ((item.CategoryName).contains("통계학")) {
			result1 = "310";
		} else if ((item.CategoryName).contains("경제학")) {
			result1 = "320";
		} else if ((item.CategoryName).contains("사회학")||(item.CategoryName).contains("사회문제")) {
			result1 = "330";
		} else if ((item.CategoryName).contains("정치")) {
			result1 = "340";
		} else if ((item.CategoryName).contains("행정")) {
			result1 = "350";
		} else if ((item.CategoryName).contains("법률")) {
			result1 = "360";
		} else if ((item.CategoryName).contains("교육")) {
			result1 = "370";
		} else if ((item.CategoryName).contains("풍습")||(item.CategoryName).contains("예절")||(item.CategoryName).contains("민속학")) {
			result1 = "380";
		} else if ((item.CategoryName).contains("국방")||(item.CategoryName).contains("군사")) {
			result1 = "390";
		} else if ((item.CategoryName).contains("수학")) {
			result1 = "410";
		} else if ((item.CategoryName).contains("물리")) {
			result1 = "420";
		} else if ((item.CategoryName).contains("화학")) {
			result1 = "430";
		} else if ((item.CategoryName).contains("천문")||(item.CategoryName).contains("천체")) {
			result1 = "440";
		} else if ((item.CategoryName).contains("지질")) {
			result1 = "450";
		} else if ((item.CategoryName).contains("광물")) {
			result1 = "460";
		} else if ((item.CategoryName).contains("생명과학")||(item.CategoryName).contains("생물학")) {
			result1 = "470";
		} else if ((item.CategoryName).contains("식물")) {
			result1 = "480";
		} else if ((item.CategoryName).contains("동물")) {
			result1 = "490";
		} else if ((item.CategoryName).contains("화학")) {
			if((item.CategoryName).contains("공학"))result1 = "570";
			else result1 = "510";
		} else if ((item.CategoryName).contains("농업")) {
			result1 = "520";
		} else if ((item.CategoryName).contains("공업")||(item.CategoryName).contains("공학")) {
			result1 = "530";
		} else if ((item.CategoryName).contains("건축")) {
			result1 = "540";
		} else if ((item.CategoryName).contains("기계")) {
			result1 = "550";
		} else if ((item.CategoryName).contains("전기")||(item.CategoryName).contains("전자")) {
			result1 = "560";
		} else if ((item.CategoryName).contains("제조")) {
			result1 = "580";
		} else if ((item.CategoryName).contains("생활과학")) {
			result1 = "590";
		} else if ((item.CategoryName).contains("조각")||(item.CategoryName).contains("조형")) {
			result1 = "620";
		} else if ((item.CategoryName).contains("공예")) {
			result1 = "630";
		} else if ((item.CategoryName).contains("서예")) {
			result1 = "640";
		} else if ((item.CategoryName).contains("회화")||(item.CategoryName).contains("도화")||(item.CategoryName).contains("디자인")) {
			result1 = "650";
		} else if ((item.CategoryName).contains("사진")) {
			result1 = "660";
		} else if ((item.CategoryName).contains("음악")) {
			result1 = "670";
		} else if ((item.CategoryName).contains("예술")) {
			result1 = "680";
		} else if ((item.CategoryName).contains("스포츠")||(item.CategoryName).contains("오락")) {
			result1 = "690";
		} else if ((item.CategoryName).contains("한국어")) {
			result1 = "710";
		} else if ((item.CategoryName).contains("중국어")) {
			result1 = "720";
		} else if ((item.CategoryName).contains("일본어")) {
			result1 = "730";
		} else if ((item.CategoryName).contains("영어")) {
			result1 = "740";
		} else if ((item.CategoryName).contains("독일어")) {
			result1 = "750";
		} else if ((item.CategoryName).contains("프랑스어")) {
			result1 = "760";
		} else if ((item.CategoryName).contains("스페인어")) {
			result1 = "770";
		} else if ((item.CategoryName).contains("이탈리아어")) {
			result1 = "780";
		} else if ((item.CategoryName).contains("기타")&&(item.CategoryName).contains("어")) {
			result1 = "790";
		} else if ((item.CategoryName).contains("아시아")) {
			result1 = "910";
		} else if ((item.CategoryName).contains("유럽")) {
			result1 = "920";
		} else if ((item.CategoryName).contains("아프리카")) {
			result1 = "930";
		} else if ((item.CategoryName).contains("북아메리카")) {
			result1 = "940";
		} else if ((item.CategoryName).contains("남아메리카")) {
			result1 = "950";
		} else if ((item.CategoryName).contains("오세아니아")) {
			result1 = "960";
		} else if ((item.CategoryName).contains("지리")) {
			result1 = "980";
		} else if ((item.CategoryName).contains("위인")) {
			result1 = "990";
		} else result1 = "000";
		System.out.println(result1);
		String result2 = (item.Author).substring(0,1);
		Random random = new Random();
		int rannum = random.nextInt(9);
		getChosung chosung = new getChosung();
		String cho = chosung.chosung(item.Title);
		
		return result1 + "." + result2 + rannum + cho;
	}
	
	static String getAuthorName(String author) {
		StringBuffer sb = new StringBuffer();
		
		int idx=0;
		while(author.charAt(idx)!='(') sb.append(author.charAt(idx++));
		
		return sb.toString();
	}
	
	public static String GetUrl(String searchWord) throws Exception {
		Map<String, String> hm = new HashMap<String, String>();
		hm.put("ttbkey", "TTBKEY");
		hm.put("Query", URLEncoder.encode(searchWord, "UTF-8"));
		hm.put("QueryType", "Title");
		hm.put("MaxResults", "100");
		hm.put("start", "1");
		hm.put("SearchTarget", "Book");
		hm.put("output", "xml");
		hm.put("Version", "20131101");
		hm.put("cover", "Big");
		
		StringBuffer sb = new StringBuffer();
		Iterator<String> iter = hm.keySet().iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			String val = hm.get(key);
			sb.append(key).append("=").append(val).append("&");
		}
		return BASE_URL + sb.toString();
	}

	public static boolean addtolist(String title, String author, String publisher, String isbn13) throws Exception {
		String url = GetUrl(title);
		AladdinOpenAPIItemSearchHandler api = new AladdinOpenAPIItemSearchHandler();
		api.parseXml(url);
		
		Connection();
		int bid = findBid()+1;
		boolean flag = false;
		
		for (Item item : api.Items) {
			System.out.println("Title : "+item.Title
					+" / Author : "+item.Author + " / publisher : "+item.Publisher + " / ISBN : " + item.Isbn13);
			if ((item.Author).contains(author)) {
				if ((item.Publisher).contains(publisher)) {
					System.out.println(item.Isbn13);
					if ((item.Isbn13).equals(isbn13)) {
						String sql = "insert into booklist values(?,?,?,?,?,?,?,?,?,?,?)";

						try {
							pstmt = conn.prepareStatement(sql);

							pstmt.setInt(1, bid);
							pstmt.setString(2, item.Title);
							pstmt.setString(3, getAuthorName(item.Author));
							pstmt.setString(4, item.Publisher);
							pstmt.setString(5, item.Isbn13);
							pstmt.setString(6, item.CategoryName);
							pstmt.setString(7, getDeciDiv(item));
							pstmt.setInt(8, 0);
							pstmt.setString(9, item.Description);
							pstmt.setInt(10, 0);
							pstmt.setString(11, item.Cover);

							int res = pstmt.executeUpdate();
							System.out.println(res + "개");
							bid += 1;

						} catch (SQLException e) {
							System.out.println("SQL Error : " + e.getMessage());
						} finally {
							if (rs != null) {
								try {
									rs.close();
								} catch (SQLException e) {
									e.printStackTrace();
								}
							}
							if (pstmt != null) {
								try {
									pstmt.close();
								} catch (SQLException e) {
									e.printStackTrace();
								}
							}
						}
						flag=true;
						break;
					}
				}
			}
		}
		if(!flag) System.out.println("There is no book to be matched");
		return flag;
	}
}
