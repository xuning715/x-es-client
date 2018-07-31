package com.x.es;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class JestUtil {
    JestTemplate jestTemplate = new JestTemplate("http://47.94.231.51:9200", 15000, 30000);
	private String sourceCrmOrg = "{" +
            "\"CrmOrg\": {" +
              "\"properties\": {" +
                  "\"orgId\": {" +
                      "\"index\": \"not_analyzed\"," +
                      "\"store\": \"no\"," +
                      "\"type\": \"keyword\"" +
                    "}," +
                  "\"orgName\": {" +
                      "\"type\": \"text\"" +
                    "}," +
                  "\"orgFullName\": {" +
                      "\"type\": \"text\"," +
                      "\"fields\": {" +
                          "\"pinyin\": {" +
                              "\"type\": \"text\"," +
                              "\"store\": \"no\"," +
                              "\"term_vector\": \"with_positions_offsets\"," +
                              "\"analyzer\": \"ik_pinyin_synonym_analyzer\"," +
                              "\"boost\": 10" +
                            "}" +
                        "}" +
                    "}," +
                  "\"orgType\": {" +
                  	  "\"index\": \"not_analyzed\"," +
                      "\"store\": \"no\"," +
                      "\"type\": \"integer\"" +
                    "}" +
                "}" +
            "}" +
           "}";

	private String sourceDcEstate = "{" +
            "\"DcEstate\": {" +
				  "\"properties\": {" +
					  "\"estateId\": {" +
						  "\"index\": \"not_analyzed\"," +
						  "\"type\": \"string\"" +
						"}," +
					  "\"estateName\": {" +
						  "\"type\": \"text\"," +
						  "\"fields\": {" +
							  "\"pinyin\": {" +
								  "\"type\": \"text\"," +
								  "\"store\": \"no\"," +
								  "\"term_vector\": \"with_positions_offsets\"," +
								  "\"analyzer\": \"ik_pinyin_synonym_analyzer\"," +
								  "\"boost\": 10" +
								"}" +
							"}" +
						"}," +
					  "\"estateAlias\": {" +
						  "\"type\": \"text\"," +
						  "\"fields\": {" +
							  "\"pinyin\": {" +
								  "\"type\": \"text\"," +
								  "\"store\": \"no\"," +
								  "\"term_vector\": \"with_positions_offsets\"," +
								  "\"analyzer\": \"ik_pinyin_synonym_analyzer\"," +
								  "\"boost\": 10" +
								"}" +
							"}" +
						"}," +
					  "\"estateAddress\": {" +
						  "\"type\": \"text\"," +
						  "\"fields\": {" +
							  "\"pinyin\": {" +
								  "\"type\": \"text\"," +
								  "\"store\": \"no\"," +
								  "\"term_vector\": \"with_positions_offsets\"," +
								  "\"analyzer\": \"ik_pinyin_synonym_analyzer\"," +
								  "\"boost\": 10" +
								"}" +
							"}" +
						"}," +
			          "\"estateLocation\": {" +
		              		"\"type\": \"geo_point\"" +
                        "}," +
			          "\"districtId\": {" +
		              		"\"index\": \"not_analyzed\"," +
		              		"\"store\": \"no\"," +
		              		"\"type\": \"string\"" +
	                    "}," +
			          "\"districtName\": {" +
		              		"\"index\": \"not_analyzed\"," +
		              		"\"store\": \"no\"," +
		              		"\"type\": \"string\"" +
	                    "}" +
					"}" +
				"}" +
           "}";

    public void encode() {
        try {
            String s = "城铁九棵树站A口100米()- ,./+";
            String ss = URLEncoder.encode(s);
            String aa = URLEncoder.encode(s);
            System.out.println(ss);
            System.out.println(aa);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insetDcEstate() throws Exception {
        String driver = "com.mysql.jdbc.Driver";
//		String url = "jdbc:mysql://localhost:3306/x_redcube";
        String url = "jdbc:mysql://192.168.1.145:3306/x_redcube";
        Class.forName(driver);
        Properties info = new Properties();
        info.put("user", "root");
        info.put("password", "7ujm*IK<9ol.)P:?");
        Connection con = DriverManager.getConnection(url, info);

        List<DcEstate> list = new ArrayList<DcEstate>();
        String sql = "";
        PreparedStatement ps = null;
        ResultSet rs = null;
        sql = "SELECT t1.*, t2.DISTRICT_NAME FROM dc_estate t1, base_district t2 WHERE t1.DISTRICT_ID = t2.DISTRICT_ID";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while(rs.next()) {
            DcEstate estate = new DcEstate();
            estate.setEstateId(rs.getString("ESTATE_ID"));
            estate.setEstateName(rs.getString("ESTATE_NAME"));
            estate.setEstateAlias(rs.getString("ESTATE_ALIAS"));
            estate.setEstateAddress(rs.getString("ESTATE_ADDRESS"));
//            DcEstateLocation location = new DcEstateLocation();
//            location.setLat(rs.getBigDecimal("ESTATE_X"));
//            location.setLon(rs.getBigDecimal("ESTATE_Y"));
//            estate.setEstateLocation(location);
            estate.setDistrictId(rs.getString("DISTRICT_ID"));
            estate.setDistrictName(rs.getString("DISTRICT_NAME"));
            if(estate.getEstateAddress().indexOf("中关村南三街16号") > -1) {
                System.out.println("------------" + estate.getEstateAddress());
            }
            list.add(estate);
        }
        System.out.println(list.size() + "==================");
        if(list.size() > 0) {
            jestTemplate.addDocument("redcube.dc.estate", "DcEstate", list.toArray());
        }
        rs.close();
        ps.close();
        con.close();
    }

    public static void main(String[] arg) throws Exception {
        JestTemplate jestTemplate = new JestTemplate("http://47.94.231.51:9200", 15000, 30000);
        jestTemplate.addIndex("erp.car", 3, 1);
//        jestTemplate.deleteIndex("erp.car");
//        boolean result = jestTemplate.addType("redcube.crm.org", "CrmOrg", sourceCrmOrg);
        jestTemplate.closeJestClient();
//        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();
//        String keyword = "xxxx";
//        String districtId = null;
//        Integer partId = 1;
//        if (keyword != null) {
//            boolQueryBuilder.must(QueryBuilders.multiMatchQuery("xxx", "estateName", "estateAlias", "estateAddress"));
//        }
//        if (districtId != null) {
//            boolQueryBuilder.must(QueryBuilders.termQuery("districtId", ""));
//        }
//        if (partId != null) {
//            boolQueryBuilder.must(QueryBuilders.termQuery("partId", 1));
//        }
//        boolQueryBuilder.boost();
//        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
//        searchSourceBuilder.query(boolQueryBuilder);
//        searchSourceBuilder.from(1);
//        searchSourceBuilder.size(10);
//        String query = searchSourceBuilder.toString();
//        logger.info(query);
    }

}
