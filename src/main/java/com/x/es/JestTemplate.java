package com.x.es;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import io.searchbox.client.JestClient;
import io.searchbox.client.JestClientFactory;
import io.searchbox.client.JestResult;
import io.searchbox.client.config.HttpClientConfig;
import io.searchbox.core.*;
import io.searchbox.indices.CreateIndex;
import io.searchbox.indices.DeleteIndex;
import io.searchbox.indices.mapping.GetMapping;
import io.searchbox.indices.mapping.PutMapping;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class JestTemplate {
    private static final Logger logger = LogManager.getLogger(JestTemplate.class);

    private static JestClientFactory factory;
    private static JestClient jestClient;
    private static List<String> nodeList = new ArrayList<String>();
    private static int jestConnTimeOut;
    private static int jestReadTimeOut;

    public JestTemplate(String nodes, int connTimeOut, int readTimeOut) {
        String[] nodeArray = nodes.split(",");
        for (String node : nodeArray) {
            nodeList.add(node);
        }
        jestConnTimeOut = connTimeOut;
        jestReadTimeOut = readTimeOut;
        jestClient = getJestClient();
    }

    /**
     * 获取JestClient对象
     *
     * @return
     */
    private JestClient getJestClient() {
        if (jestClient == null) {
            factory = new JestClientFactory();
            factory.setHttpClientConfig(new HttpClientConfig
                    .Builder(nodeList)
                    .gson(new GsonBuilder().setDateFormat("yyyy-MM-dd'T'hh:mm:ss").create())
                    .connTimeout(jestConnTimeOut)
                    .readTimeout(jestReadTimeOut)
                    .multiThreaded(true)
                    .build());
            jestClient = factory.getObject();
        }
        return jestClient;
    }

    public void closeJestClient() throws IOException {
        if (jestClient != null) {
            jestClient.close();
        }
    }

    public boolean addIndex(String index, int shardNum, int replicaNum) {
        boolean flag = false;
        try {
            Settings.Builder settingsBuilder = Settings.builder();
            settingsBuilder.put("number_of_shards", shardNum);
            settingsBuilder.put("number_of_replicas", replicaNum);
            settingsBuilder.put("index.analysis.filter.synonym_filter.type", "synonym");
            settingsBuilder.put("index.analysis.filter.synonym_filter.synonyms_path", "synonym.txt");
            settingsBuilder.put("index.analysis.filter.synonym_filter.ignore_case", true);
            settingsBuilder.put("index.analysis.filter.pinyin_filter.type", "pinyin");
            settingsBuilder.put("index.analysis.filter.pinyin_filter.first_letter", "prefix");
            settingsBuilder.put("index.analysis.filter.pinyin_filter.padding_char", " ");
            settingsBuilder.put("index.analysis.analyzer.ik_pinyin_synonym_analyzer.type", "custom");
            settingsBuilder.put("index.analysis.analyzer.ik_pinyin_synonym_analyzer.tokenizer", "ik_smart");
            settingsBuilder.put("index.analysis.analyzer.ik_pinyin_synonym_analyzer.filter.0", "synonym_filter");
            settingsBuilder.put("index.analysis.analyzer.ik_pinyin_synonym_analyzer.filter.1", "pinyin_filter");
            settingsBuilder.put("index.analysis.analyzer.ik_pinyin_synonym_analyzer.filter.2", "word_delimiter");
            JestResult jr = getJestClient().execute(new CreateIndex.Builder(index).settings(settingsBuilder.build()).build());
            flag = jr.isSucceeded();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return flag;
        }
    }

    private boolean deleteIndex(String index) throws Exception {
        JestResult jr = getJestClient().execute(new DeleteIndex.Builder(index).build());
        return jr.isSucceeded();
    }

    public boolean addType(String index, String type, String source) throws Exception {
        PutMapping putMapping = new PutMapping.Builder(index, type, source).build();
        JestResult jr = getJestClient().execute(putMapping);
        return jr.isSucceeded();
    }

    public String getType(String index, String type) throws Exception {
        GetMapping getMapping = new GetMapping.Builder().addIndex(index).addType(type).build();
        JestResult jr = getJestClient().execute(getMapping);
        return jr.getJsonString();
    }

    public boolean addDocument(String index, String type, Object... documents) throws Exception {
        Bulk.Builder builder = new Bulk.Builder().defaultIndex(index).defaultType(type);
        builder.refresh(Boolean.TRUE);
        for (Object document : documents) {
            Index i = new Index.Builder(document).build();
            builder.addAction(i);
        }
        BulkResult br = getJestClient().execute(builder.build());
        return br.isSucceeded();
    }

    public boolean deleteDocument(String index, String type, String id) throws Exception {
        DocumentResult dr = getJestClient().execute(new Delete.Builder(id).index(index).type(type).build());
        return dr.isSucceeded();
    }

    public int countDocument(String index, String type, QueryBuilder queryBuilder) throws Exception {
        queryBuilder.boost();
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(queryBuilder);
        String query = searchSourceBuilder.toString();
        Count count = new Count.Builder().addIndex(index).addType(type).query(query).build();
        CountResult results = getJestClient().execute(count);
        if (results != null) {
            return results.getCount().intValue();
        } else {
            return 0;
        }
    }

    public JsonObject getDocument(String index, String type, String id) throws Exception {
        Get get = new Get.Builder(index, id).type(type).build();
        return getJestClient().execute(get).getJsonObject();
    }

    private SearchResult searchDocument(String index, String type, String query) throws Exception {
        Search search = new Search.Builder(query).addIndex(index).addType(type).build();
        return getJestClient().execute(search);
    }

//    public int countDocument(String index, String type, BoolQueryBuilder boolQueryBuilder) throws Exception {
//        boolQueryBuilder.boost();
//        return countDocument(index, type, boolQueryBuilder);
//        SearchResult result = this.searchDocument(index, type, query);
//        logger.info(result.getTotal());
//        if (result != null) {
//            this.countDocument(index, type, boolQueryBuilder);
//            return result.getTotal().intValue();
//        } else {
//            return 0;
//        }
//    }

    public <T extends Object> List<T> searchDocument(String index,
                                                     String type,
                                                     String filed,
                                                     String keyword,
                                                     int pageIndex,
                                                     int pageSize,
                                                     Class<T> clazz) throws Exception {
        QueryBuilder queryBuilder = QueryBuilders.matchQuery(filed, keyword);// 模糊匹配查询
        return this.searchDocument(index, type, queryBuilder, pageIndex, pageSize, clazz);
    }

//    public <T extends Object> List<T> searchDocument(String index,
//                                                     String type,
//                                                     BoolQueryBuilder boolQueryBuilder,
//                                                     int pageIndex,
//                                                     int pageSize,
//                                                     Class<T> clazz) throws Exception {
//        return this.searchDocument(index, type, boolQueryBuilder, pageIndex, pageSize, clazz);
//    }

    public <T extends Object> List<T> searchDocument(String index,
                                                     String type,
                                                     QueryBuilder queryBuilder,
                                                     int pageIndex,
                                                     int pageSize,
                                                     Class<T> clazz) throws Exception {
        queryBuilder.boost();
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(queryBuilder);
        searchSourceBuilder.from(pageIndex);
        searchSourceBuilder.size(pageSize);
        String query = searchSourceBuilder.toString();
        logger.info(query);
        SearchResult result = this.searchDocument(index, type, query);
        List<T> list = new ArrayList<T>();
        if (result != null) {
            List<SearchResult.Hit<T, Void>> hits = result.getHits(clazz);
            if (hits != null && hits.size() > 0) {
                logger.info("Size:" + hits.size());
                for (SearchResult.Hit<T, Void> hit : hits) {
                    T t = hit.source;
                    list.add(t);
                }
            }
        }
        return list;
    }

    public static void main(String[] arg) throws Exception {
        JestTemplate jestTemplate = new JestTemplate("http://47.94.231.51:9200", 15000, 30000);
        jestTemplate.addIndex("erp.car", 3, 1);
//        jestTemplate.deleteIndex("erp.car");
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
