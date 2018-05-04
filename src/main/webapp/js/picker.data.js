
(function (window, document, Math) {

var cityData = [
    {
        "Code": "110000",
        "Name": "北京市",
        "level": [
            {
                "Code": "110100",
                "Name": "市辖区",
                "sort": 1,
                "level": [
                    {"Code": "110101","Name": "东城区","sort": 1},
                    {"Code": "110102","Name": "西城区","sort": 2},
                    {"Code": "110105","Name": "朝阳区","sort": 3},
                    {"Code": "110106","Name": "丰台区","sort": 4},
                    {"Code": "110107","Name": "石景山区","sort": 5},
                    {"Code": "110108","Name": "海淀区","sort": 6},
                    {"Code": "110109","Name": "门头沟区","sort": 7},
                    {"Code": "110111","Name": "房山区","sort": 8},
                    {"Code": "110112","Name": "通州区","sort": 9},
                    {"Code": "110113","Name": "顺义区","sort": 10},
                    {"Code": "110114","Name": "昌平区","sort": 11},
                    {"Code": "110115","Name": "大兴区","sort": 12},
                    {"Code": "110116","Name": "怀柔区","sort": 13},
                    {"Code": "110117","Name": "平谷区","sort": 14},
                    {"Code": "110118","Name": "密云区","sort": 15},
                    {"Code": "110119","Name": "延庆区","sort": 16},
                    {"Code": "110120","Name": "经济开发区","sort": 17}
                ]
            }
        ]
    },
    {
        "Code": "120000",
        "Name": "天津市",
        "level": [
            {
                 "Code": "120100",
                 "Name": "市辖区",
                 "sort": 1,
                 "level": [
                    {"Code": "120101","Name": "和平区","sort": 1},
                    {"Code": "120102","Name": "河东区","sort": 2},
                    {"Code": "120103","Name": "河西区","sort": 3},
                    {"Code": "120104","Name": "南开区","sort": 4},
                    {"Code": "120105","Name": "河北区","sort": 5},
                    {"Code": "120106","Name": "红桥区","sort": 6},
                    {"Code": "120110","Name": "东丽区","sort": 7},
                    {"Code": "120111","Name": "西青区","sort": 8},
                    {"Code": "120112","Name": "津南区","sort": 9},
                    {"Code": "120113","Name": "北辰区","sort": 10},
                    {"Code": "120114","Name": "武清区","sort": 11},
                    {"Code": "120115","Name": "宝坻区","sort": 12},
                    {"Code": "120116","Name": "滨海新区","sort": 13},
                    {"Code": "120117","Name": "宁河区","sort": 14},
                    {"Code": "120118","Name": "静海区","sort": 15},
                    {"Code": "120119","Name": "蓟州区","sort": 16}
                 ]
             }       
        ]
    },
    {
         "Code": "130000",
         "Name": "河北省",
         "level": [
             {
                  "Code": "130100",
                  "Name": "石家庄市",
                  "sort": 1,
                  "level": [
                      {"Code": "130101","Name": "市辖区","sort": 1},
                      {"Code": "130102","Name": "长安区","sort": 2},
                      {"Code": "130104","Name": "桥西区","sort": 3},
                      {"Code": "130105","Name": "新华区","sort": 4},
                      {"Code": "130107","Name": "井陉矿区","sort": 5},
                      {"Code": "130108","Name": "裕华区","sort": 6},
                      {"Code": "130109","Name": "藁城区","sort": 7},
                      {"Code": "130110","Name": "鹿泉区","sort": 8},
                      {"Code": "130111","Name": "栾城区","sort": 9},
                      {"Code": "130121","Name": "井陉县","sort": 10},
                      {"Code": "130123","Name": "正定县","sort": 11},
                      {"Code": "130125","Name": "行唐县","sort": 12},
                      {"Code": "130126","Name": "灵寿县","sort": 13},
                      {"Code": "130127","Name": "高邑县","sort": 14},
                      {"Code": "130128","Name": "深泽县","sort": 15},
                      {"Code": "130129","Name": "赞皇县","sort": 16},
                      {"Code": "130130","Name": "无极县","sort": 17},
                      {"Code": "130131","Name": "平山县","sort": 18},
                      {"Code": "130132","Name": "元氏县","sort": 19},
                      {"Code": "130133","Name": "赵县","sort": 20},
                      {"Code": "130183","Name": "晋州市","sort": 21},
                      {"Code": "130184","Name": "新乐市","sort": 22}
                  ]
             }, 
             {
                  "Code": "130200",
                  "Name": "唐山市",
                  "sort": 2,
                  "level": [
                      {"Code": "130201","Name": "市辖区","sort": 1},
                      {"Code": "130202","Name": "路南区","sort": 2},
                      {"Code": "130203","Name": "路北区","sort": 3},
                      {"Code": "130204","Name": "古冶区","sort": 4},
                      {"Code": "130205","Name": "开平区","sort": 5},
                      {"Code": "130207","Name": "丰南区","sort": 6},
                      {"Code": "130208","Name": "丰润区","sort": 7},
                      {"Code": "130209","Name": "曹妃甸区","sort": 8},
                      {"Code": "130223","Name": "滦县","sort": 9},
                      {"Code": "130224","Name": "滦南县","sort": 10},
                      {"Code": "130225","Name": "乐亭县","sort": 11},
                      {"Code": "130227","Name": "迁西县","sort": 12},
                      {"Code": "130229","Name": "玉田县","sort": 13},
                      {"Code": "130281","Name": "遵化市","sort": 14},
                      {"Code": "130283","Name": "迁安市","sort": 15}
                  ]
             }, 
             {
                  "Code": "130300",
                  "Name": "秦皇岛市",
                  "sort": 3,
                  "level": [
                      {"Code": "130301","Name": "市辖区","sort": 1},
                      {"Code": "130302","Name": "海港区","sort": 2},
                      {"Code": "130303","Name": "山海关区","sort": 3},
                      {"Code": "130304","Name": "北戴河区","sort": 4},
                      {"Code": "130306","Name": "抚宁区","sort": 5},
                      {"Code": "130321","Name": "青龙满族自治县","sort": 6},
                      {"Code": "130322","Name": "昌黎县","sort": 7},
                      {"Code": "130324","Name": "卢龙县","sort": 8}
                  ]
              }, 
             {
                  "Code": "130400",
                  "Name": "邯郸市",
                  "sort": 4,
                  "level": [
                      {"Code": "130401","Name": "市辖区","sort": 1},
                      {"Code": "130402","Name": "邯山区","sort": 2},
                      {"Code": "130403","Name": "丛台区","sort": 3},
                      {"Code": "130404","Name": "复兴区","sort": 4},
                      {"Code": "130406","Name": "峰峰矿区","sort": 5},
                      {"Code": "130421","Name": "邯郸县","sort": 6},
                      {"Code": "130423","Name": "临漳县","sort": 7},
                      {"Code": "130424","Name": "成安县","sort": 8},
                      {"Code": "130425","Name": "大名县","sort": 9},
                      {"Code": "130426","Name": "涉县","sort": 10},
                      {"Code": "130427","Name": "磁县","sort": 11},
                      {"Code": "130428","Name": "肥乡县","sort": 12},
                      {"Code": "130429","Name": "永年县","sort": 13},
                      {"Code": "130430","Name": "邱县","sort": 14},
                      {"Code": "130431","Name": "鸡泽县","sort": 15},
                      {"Code": "130432","Name": "广平县","sort": 16},
                      {"Code": "130433","Name": "馆陶县","sort": 17},
                      {"Code": "130434","Name": "魏县","sort": 18},
                      {"Code": "130435","Name": "曲周县","sort": 19},
                      {"Code": "130481","Name": "武安市","sort": 20}
                  ]
             }, 
             {
                  "Code": "130500",
                  "Name": "邢台市",
                  "sort": 5,
                  "level": [
                      {"Code": "130501","Name": "市辖区","sort": 1},
                      {"Code": "130502","Name": "桥东","sort": 2},
                      {"Code": "130503","Name": "桥西","sort": 3},
                      {"Code": "130521","Name": "邢台","sort": 4},
                      {"Code": "130522","Name": "临城","sort": 5},
                      {"Code": "130523","Name": "内丘县","sort": 6},
                      {"Code": "130524","Name": "柏乡县","sort": 7},
                      {"Code": "130525","Name": "隆尧县","sort": 8},
                      {"Code": "130526","Name": "任县","sort": 9},
                      {"Code": "130527","Name": "南和县","sort": 10},
                      {"Code": "130528","Name": "宁晋县","sort": 11},
                      {"Code": "130529","Name": "巨鹿县","sort": 12},
                      {"Code": "130530","Name": "新河县","sort": 13},
                      {"Code": "130531","Name": "广宗县","sort": 14},
                      {"Code": "130532","Name": "平乡县","sort": 15},
                      {"Code": "130533","Name": "威县","sort": 16},
                      {"Code": "130534","Name": "清河县","sort": 17},
                      {"Code": "130535","Name": "临西县","sort": 18},
                      {"Code": "130581","Name": "南宫市","sort": 19},
                      {"Code": "130582","Name": "沙河市","sort": 20}
                  ]
              }, 
              {
                  "Code": "130600",
                  "Name": "保定市",
                  "sort": 6,
                  "level": [
                      {"Code": "130601","Name": "市辖区","sort": 1},
                      {"Code": "130602","Name": "竞秀区","sort": 2},
                      {"Code": "130606","Name": "莲池区","sort": 3},
                      {"Code": "130607","Name": "满城区","sort": 4},
                      {"Code": "130608","Name": "清苑区","sort": 5},
                      {"Code": "130609","Name": "徐水区","sort": 6},
                      {"Code": "130623","Name": "涞水县","sort": 7},
                      {"Code": "130624","Name": "阜平县","sort": 8},
                      {"Code": "130626","Name": "定兴县","sort": 9},
                      {"Code": "130627","Name": "唐县","sort": 10},
                      {"Code": "130628","Name": "高阳县","sort": 11},
                      {"Code": "130629","Name": "容城县","sort": 12},
                      {"Code": "130630","Name": "涞源县","sort": 13},
                      {"Code": "130631","Name": "望都县","sort": 14},
                      {"Code": "130632","Name": "安新县","sort": 15},
                      {"Code": "130633","Name": "易县","sort": 16},
                      {"Code": "130634","Name": "曲阳县","sort": 17},
                      {"Code": "130635","Name": "蠡县","sort": 18},
                      {"Code": "130636","Name": "顺平县","sort": 19},
                      {"Code": "130637","Name": "博野县","sort": 20},
                      {"Code": "130638","Name": "雄县","sort": 21},
                      {"Code": "130681","Name": "涿州市","sort": 22},
                      {"Code": "130683","Name": "安国市","sort": 23},
                      {"Code": "130684","Name": "高碑店市","sort": 24}

                  ]
              }, 
              {
                  "Code": "130700",
                  "Name": "张家口市",
                  "sort": 7,
                  "level": [
                      {"Code": "130701","Name": "市辖区","sort": 1},
                      {"Code": "130702","Name": "桥东区","sort": 2},
                      {"Code": "130703","Name": "桥西区","sort": 3},
                      {"Code": "130705","Name": "宣化区","sort": 4},
                      {"Code": "130706","Name": "下花园区","sort": 5},
                      {"Code": "130708","Name": "万全区","sort": 6},
                      {"Code": "130709","Name": "崇礼区","sort": 7},
                      {"Code": "130722","Name": "张北县","sort": 8},
                      {"Code": "130723","Name": "康保县","sort": 9},
                      {"Code": "130724","Name": "沽源县","sort": 10},
                      {"Code": "130725","Name": "尚义县","sort": 11},
                      {"Code": "130726","Name": "蔚县","sort": 12},
                      {"Code": "130727","Name": "阳原县","sort": 13},
                      {"Code": "130728","Name": "怀安县","sort": 14},
                      {"Code": "130730","Name": "怀来县","sort": 15},
                      {"Code": "130731","Name": "涿鹿县","sort": 16},
                      {"Code": "130732","Name": "赤城县","sort": 17} 
                  ]
              }, 
              {
                  "Code": "130800",
                  "Name": "承德市",
                  "sort": 8,
                  "level": [
                      {"Code": "130801","Name": "市辖区","sort": 1},
                      {"Code": "130802","Name": "双桥区","sort": 2},
                      {"Code": "130803","Name": "双滦区","sort": 3},
                      {"Code": "130804","Name": "鹰手营子矿区","sort": 4},
                      {"Code": "130821","Name": "承德县","sort": 5},
                      {"Code": "130822","Name": "兴隆县","sort": 6},
                      {"Code": "130823","Name": "平泉县","sort": 7},
                      {"Code": "130824","Name": "滦平县","sort": 8},
                      {"Code": "130825","Name": "隆化县","sort": 9},
                      {"Code": "130826","Name": "丰宁满族自治县","sort": 10},
                      {"Code": "130827","Name": "宽城满族自治县","sort": 11},
                      {"Code": "130828","Name": "围场满族蒙古族自治县","sort": 12}
                    ]
              }, 
             {
                  "Code": "130900",
                  "Name": "沧州市",
                  "sort": 9,
                  "level": [
                      {"Code": "130901","Name": "市辖区","sort": 1},
                      {"Code": "130902","Name": "新华区","sort": 2},
                      {"Code": "130903","Name": "运河区","sort": 3},
                      {"Code": "130921","Name": "沧县","sort": 4},
                      {"Code": "130922","Name": "青县","sort": 5},
                      {"Code": "130923","Name": "东光县","sort": 6},
                      {"Code": "130924","Name": "海兴县","sort": 7},
                      {"Code": "130925","Name": "盐山县","sort": 8},
                      {"Code": "130926","Name": "肃宁县","sort": 9},
                      {"Code": "130927","Name": "南皮县","sort": 10},
                      {"Code": "130928","Name": "吴桥县","sort": 11},
                      {"Code": "130929","Name": "献县","sort": 12},
                      {"Code": "130930","Name": "孟村回族自治县","sort": 13},
                      {"Code": "130981","Name": "泊头市","sort": 14},
                      {"Code": "130982","Name": "任丘市","sort": 15},
                      {"Code": "130983","Name": "黄骅市","sort": 16},
                      {"Code": "130984","Name": "河间市","sort": 17}   
                      ]
             }, 
             {
                  "Code": "131000",
                  "Name": "廊坊市",
                  "sort": 10,
                  "level": [
                      {"Code": "131001","Name": "市辖区","sort": 1},
                      {"Code": "131002","Name": "安次区","sort": 2},
                      {"Code": "131003","Name": "广阳区","sort": 3},
                      {"Code": "131022","Name": "固安县","sort": 4},
                      {"Code": "131023","Name": "永清县","sort": 5},
                      {"Code": "131024","Name": "香河县","sort": 6},
                      {"Code": "131025","Name": "大城县","sort": 7},
                      {"Code": "131026","Name": "文安县","sort": 8},
                      {"Code": "131028","Name": "大厂回族自治县","sort": 9},
                      {"Code": "131081","Name": "霸州市","sort": 10},
                      {"Code": "131082","Name": "三河市","sort": 11}

                  ]
             }, 
             {
                  "Code": "131100",
                  "Name": "衡水市",
                  "sort": 11,
                  "level": [
                      {"Code": "131101","Name": "市辖区","sort": 1},
                      {"Code": "131102","Name": "桃城区","sort": 2},
                      {"Code": "131103","Name": "冀州区","sort": 3},
                      {"Code": "131121","Name": "枣强县","sort": 4},
                      {"Code": "131122","Name": "武邑县","sort": 5},
                      {"Code": "131123","Name": "武强县","sort": 6},
                      {"Code": "131124","Name": "饶阳县","sort": 7},
                      {"Code": "131125","Name": "安平县","sort": 8},
                      {"Code": "131126","Name": "故城县","sort": 9},
                      {"Code": "131127","Name": "景县 ","sort": 10},
                      {"Code": "131128","Name": "阜城县","sort": 11},
                      {"Code": "131182","Name": "深州市","sort": 12} 
                      ]
             }, 
                          {
                  "Code": "139000",
                  "Name": "省直辖",
                  "sort": 12,
                  "level": [
                      {"Code": "139001","Name": "定州市","sort": 1}
                      ]
             }
      
         ]
     },
     {
         "Code": "140000",
         "Name": "山西省",
         "level": [ 
             {
                  "Code": "140100",
                  "Name": "太原市",
                  "sort": 1,
                  "level": [
                      {"Code": "140101","Name": "市辖区","sort": 1},
                      {"Code": "140105","Name": "小店区","sort": 2},
                      {"Code": "140106","Name": "迎泽区","sort": 3},
                      {"Code": "140107","Name": "杏花岭区","sort": 4},
                      {"Code": "140108","Name": "尖草坪区","sort": 5},
                      {"Code": "140109","Name": "万柏林区","sort": 6},
                      {"Code": "140110","Name": "晋源区","sort": 7},
                      {"Code": "140121","Name": "清徐县","sort": 8},
                      {"Code": "140122","Name": "阳曲县","sort": 9},
                      {"Code": "140123","Name": "娄烦县","sort": 10},
                      {"Code": "140181","Name": "古交市","sort": 11}
                  ]
             },
             {
                  "Code": "140200",
                  "Name": "大同市",
                  "sort": 2,
                  "level": [
                      {"Code": "140201","Name": "市辖区","sort": 1},
                      {"Code": "140202","Name": "城区","sort": 2},
                      {"Code": "140203","Name": "矿区","sort": 3},
                      {"Code": "140211","Name": "南郊区","sort": 4},
                      {"Code": "140212","Name": "新荣区","sort": 5},
                      {"Code": "140221","Name": "阳高县","sort": 6},
                      {"Code": "140222","Name": "天镇县","sort": 7},
                      {"Code": "140223","Name": "广灵县","sort": 8},
                      {"Code": "140224","Name": "灵丘县","sort": 9},
                      {"Code": "140225","Name": "浑源县","sort": 10},
                      {"Code": "140226","Name": "左云县","sort": 11},
                      {"Code": "140227","Name": "大同县","sort": 12}
                  ]
             },
             {
                  "Code": "140300",
                  "Name": "阳泉市",
                  "sort": 3,
                  "level": [
                      {"Code": "140301","Name": "市辖区","sort": 1},
                      {"Code": "140302","Name": "城区","sort": 2},
                      {"Code": "140303","Name": "矿区","sort": 3},
                      {"Code": "140311","Name": "郊区","sort": 4},
                      {"Code": "140321","Name": "平定县","sort": 5},
                      {"Code": "140322","Name": "盂县","sort": 6}
                  ]
             },  
             {
                  "Code": "140400",
                  "Name": "长治市",
                  "sort": 4,
                  "level": [
                      {"Code": "140401","Name": "市辖区","sort": 1},
                      {"Code": "140402","Name": "城区","sort": 2},
                      {"Code": "140411","Name": "郊区","sort": 3},
                      {"Code": "140421","Name": "长治县","sort": 4},
                      {"Code": "140423","Name": "襄垣县","sort": 5},
                      {"Code": "140424","Name": "屯留县","sort": 6},
                      {"Code": "140425","Name": "平顺县","sort": 7},
                      {"Code": "140426","Name": "黎城县","sort": 8},
                      {"Code": "140427","Name": "壶关县","sort": 9},
                      {"Code": "140428","Name": "长子县","sort": 10},
                      {"Code": "140429","Name": "武乡县","sort": 11},
                      {"Code": "140430","Name": "沁县","sort": 12},
                      {"Code": "140431","Name": "沁源县","sort": 13},
                      {"Code": "140481","Name": "潞城市","sort": 14}
                  ]
             },  
             {
                  "Code": "140500",
                  "Name": "晋城市",
                  "sort": 5,
                  "level": [
                      {"Code": "140501","Name": "市辖区","sort": 1},
                      {"Code": "140502","Name": "城区","sort": 2},
                      {"Code": "140521","Name": "沁水县","sort": 3},
                      {"Code": "140522","Name": "阳城县","sort": 4},
                      {"Code": "140524","Name": "陵川县","sort": 5},
                      {"Code": "140525","Name": "泽州县","sort": 6},
                      {"Code": "140581","Name": "高平市","sort": 7}
                  ]
             },  
             {
                  "Code": "140600",
                  "Name": "朔州市",
                  "sort": 6,
                  "level": [
                      {"Code": "140601","Name": "市辖区","sort": 1},
                      {"Code": "140602","Name": "朔城区","sort": 2},
                      {"Code": "140603","Name": "平鲁区","sort": 3},
                      {"Code": "140621","Name": "山阴县","sort": 4},
                      {"Code": "140622","Name": "应县","sort": 5},
                      {"Code": "140623","Name": "右玉县","sort": 6},
                      {"Code": "140624","Name": "怀仁县","sort": 7}
                  ]
	         },  
             {
                  "Code": "140700",
                  "Name": "晋中市",
                  "sort": 7,
                  "level": [  
                      {"Code": "140701","Name": "市辖区","sort": 1},
                      {"Code": "140702","Name": "榆次区","sort": 2},
                      {"Code": "140721","Name": "榆社县","sort": 3},
                      {"Code": "140722","Name": "左权县","sort": 4},
                      {"Code": "140723","Name": "和顺县","sort": 5},
                      {"Code": "140724","Name": "昔阳县","sort": 6},
                      {"Code": "140725","Name": "寿阳县","sort": 7},
                      {"Code": "140726","Name": "太谷县","sort": 8},
                      {"Code": "140727","Name": "祁县","sort": 9},
                      {"Code": "140728","Name": "平遥县","sort": 10},
                      {"Code": "140729","Name": "灵石县","sort": 11},
                      {"Code": "140781","Name": "介休市","sort": 12}
                  ]
             },  
             {
                  "Code": "140800",
                  "Name": "运城市",
                  "sort": 8,
                  "level": [
                      {"Code": "140801","Name": "市辖区","sort": 1},
                      {"Code": "140802","Name": "盐湖区","sort": 2},
                      {"Code": "140821","Name": "临猗县","sort": 3},
                      {"Code": "140822","Name": "万荣县","sort": 4},
                      {"Code": "140823","Name": "闻喜县","sort": 5},
                      {"Code": "140824","Name": "稷山县","sort": 6},
                      {"Code": "140825","Name": "新绛县","sort": 7},
                      {"Code": "140826","Name": "绛县","sort": 8},
                      {"Code": "140827","Name": "垣曲县","sort": 9},
                      {"Code": "140828","Name": "夏县","sort": 10},
                      {"Code": "140829","Name": "平陆县","sort": 11},
                      {"Code": "140830","Name": "芮城县","sort": 12},
                      {"Code": "140881","Name": "永济市","sort": 13},
                      {"Code": "140882","Name": "河津市","sort": 14}
                  ]
             },  
             {
                  "Code": "140900",
                  "Name": "忻州市",
                  "sort": 9,
                  "level": [
                      {"Code": "140901","Name": "市辖区","sort": 1},
                      {"Code": "140902","Name": "忻府区","sort": 2},
                      {"Code": "140921","Name": "定襄县","sort": 3},
                      {"Code": "140922","Name": "五台县","sort": 4},
                      {"Code": "140923","Name": "代县","sort": 5},
                      {"Code": "140924","Name": "繁峙县","sort": 6},
                      {"Code": "140925","Name": "宁武县","sort": 7},
                      {"Code": "140926","Name": "静乐县","sort": 8},
                      {"Code": "140927","Name": "神池县","sort": 9},
                      {"Code": "140928","Name": "五寨县","sort": 10},
                      {"Code": "140929","Name": "岢岚县","sort": 11},
                      {"Code": "140930","Name": "河曲县","sort": 12},
                      {"Code": "140931","Name": "保德县","sort": 13},
                      {"Code": "140932","Name": "偏关县","sort": 14},
                      {"Code": "140981","Name": "原平市","sort": 15}
                  ]
              },  
             {
                  "Code": "141000",
                  "Name": "临汾市",
                  "sort": 10,
                  "level": [
                      {"Code": "141001","Name": "市辖区","sort": 1},
                      {"Code": "141002","Name": "尧都区","sort": 2},
                      {"Code": "141021","Name": "曲沃县","sort": 3},
                      {"Code": "141022","Name": "翼城县","sort": 4},
                      {"Code": "141023","Name": "襄汾县","sort": 5},
                      {"Code": "141024","Name": "洪洞县","sort": 6},
                      {"Code": "141025","Name": "古县","sort": 7},
                      {"Code": "141026","Name": "安泽县","sort": 8},
                      {"Code": "141027","Name": "浮山县","sort": 9},
                      {"Code": "141028","Name": "吉县","sort": 10},
                      {"Code": "141029","Name": "乡宁县","sort": 11},
                      {"Code": "141030","Name": "大宁县","sort": 12},
                      {"Code": "141031","Name": "隰县","sort": 13},
                      {"Code": "141032","Name": "永和县","sort": 14},
                      {"Code": "141033","Name": "蒲县","sort": 15},
                      {"Code": "141034","Name": "汾西县","sort": 16},
                      {"Code": "141081","Name": "侯马市","sort": 17},
                      {"Code": "141082","Name": "霍州市","sort": 18}
                  ]
             },  
             {
                  "Code": "141100",
                  "Name": "吕梁市",
                  "sort": 11,
                  "level": [
                      {"Code": "141101","Name": "市辖区","sort": 1},
                      {"Code": "141102","Name": "离石区","sort": 2},
                      {"Code": "141121","Name": "文水县","sort": 3},
                      {"Code": "141122","Name": "交城县","sort": 4},
                      {"Code": "141123","Name": "兴县","sort": 5},
                      {"Code": "141124","Name": "临县","sort": 6},
                      {"Code": "141125","Name": "柳林县","sort": 7},
                      {"Code": "141126","Name": "石楼县","sort": 8},
                      {"Code": "141127","Name": "岚县","sort": 9},
                      {"Code": "141128","Name": "方山县","sort": 10},
                      {"Code": "141129","Name": "中阳县","sort": 11},
                      {"Code": "141130","Name": "交口县","sort": 12},
                      {"Code": "141181","Name": "孝义市","sort": 13},
                      {"Code": "141182","Name": "汾阳市","sort": 14}
                  ]
             }        
         ]
    },
    {
          "Code": "150000",
          "Name": "内蒙古自治区",
          "level": [
              {
                   "Code": "150100",
                   "Name": "呼和浩特市",
                   "sort": 1,
                   "level": [
                      {"Code": "150101","Name": "市辖区","sort": 1},
                      {"Code": "150102","Name": "新城区","sort": 2},
                      {"Code": "150103","Name": "回民区","sort": 3},
                      {"Code": "150104","Name": "玉泉区","sort": 4},
                      {"Code": "150105","Name": "赛罕区","sort": 5},
                      {"Code": "150121","Name": "土默特左旗","sort": 6},
                      {"Code": "150122","Name": "托克托县","sort": 7},
                      {"Code": "150123","Name": "和林格尔县","sort": 8},
                      {"Code": "150124","Name": "清水河县","sort": 9},
                      {"Code": "150125","Name": "武川县","sort": 10}
                   ]
              },
              {
                   "Code": "150200",
                   "Name": "包头市",
                   "sort": 2,
                   "level": [
                      {"Code": "150201","Name": "市辖区","sort": 1},
                      {"Code": "150202","Name": "东河区","sort": 2},
                      {"Code": "150203","Name": "昆都仑区","sort": 3},
                      {"Code": "150204","Name": "青山区","sort": 4},
                      {"Code": "150205","Name": "石拐区","sort": 5},
                      {"Code": "150206","Name": "白云鄂博矿区","sort": 6},
                      {"Code": "150207","Name": "九原区","sort": 7},
                      {"Code": "150221","Name": "土默特右旗","sort": 8},
                      {"Code": "150222","Name": "固阳县","sort": 9},
                      {"Code": "150223","Name": "达尔罕茂明安联合旗","sort": 10}
                   ]
              },
              {
                   "Code": "150300",
                   "Name": "乌海市",
                   "sort": 3,
                   "level": [
                      {"Code": "150301","Name": "市辖区","sort": 1},
                      {"Code": "150302","Name": "海勃湾区","sort": 2},
                      {"Code": "150303","Name": "海南区","sort": 3},
                      {"Code": "150304","Name": "乌达区","sort": 4}
                   ]
              },  
              {
                   "Code": "150400",
                   "Name": "赤峰市",
                   "sort": 4,
                   "level": [
                      {"Code": "150401","Name": "市辖区","sort": 1},
                      {"Code": "150402","Name": "红山区","sort": 2},
                      {"Code": "150403","Name": "元宝山区","sort": 3},
                      {"Code": "150404","Name": "松山区","sort": 4},
                      {"Code": "150421","Name": "阿鲁科尔沁旗","sort": 5},
                      {"Code": "150422","Name": "巴林左旗","sort": 6},
                      {"Code": "150423","Name": "巴林右旗","sort": 7},
                      {"Code": "150424","Name": "林西县","sort": 8},
                      {"Code": "150425","Name": "克什克腾旗","sort": 9},
                      {"Code": "150426","Name": "翁牛特旗","sort": 10},
                      {"Code": "150428","Name": "喀喇沁旗","sort": 11},
                      {"Code": "150429","Name": "宁城县","sort": 12},
                      {"Code": "150430","Name": "敖汉旗","sort": 13}
                   ]
              },  
              {
                  "Code": "150500",
                  "Name": "通辽市",
                  "sort": 5,
                  "level": [
                      {"Code": "150501","Name": "市辖区","sort": 1},
                      {"Code": "150502","Name": "科尔沁区","sort": 2},
                      {"Code": "150521","Name": "科尔沁左翼中旗","sort": 3},
                      {"Code": "150522","Name": "科尔沁左翼后旗","sort": 4},
                      {"Code": "150523","Name": "开鲁县","sort": 5},
                      {"Code": "150524","Name": "库伦旗","sort": 6},
                      {"Code": "150525","Name": "奈曼旗","sort": 7},
                      {"Code": "150526","Name": "扎鲁特旗","sort": 8},
                      {"Code": "150581","Name": "霍林郭勒市","sort": 9}
                  ]
               },  
              {
                  "Code": "150600",
                  "Name": "鄂尔多斯市",
                  "sort": 6,
                  "level": [
                      {"Code": "150601","Name": "市辖区","sort": 1},
                      {"Code": "150602","Name": "东胜区","sort": 2},
                      {"Code": "150603","Name": "康巴什区","sort": 3},
                      {"Code": "150621","Name": "达拉特旗","sort": 4},
                      {"Code": "150622","Name": "准格尔旗","sort": 5},
                      {"Code": "150623","Name": "鄂托克前旗","sort": 6},
                      {"Code": "150624","Name": "鄂托克旗 ","sort": 7},
                      {"Code": "150625","Name": "杭锦旗","sort": 8},
                      {"Code": "150626","Name": "乌审旗","sort": 9},
                      {"Code": "150627","Name": "伊金霍洛旗","sort": 10}
                  ]
              },  
              {
                  "Code": "150700",
                  "Name": "呼伦贝尔市",
                  "sort": 7,
                  "level": [
                      {"Code": "150701","Name": "市辖区","sort": 1},
                      {"Code": "150702","Name": "海拉尔区","sort": 2},
                      {"Code": "150703","Name": "扎赉诺尔区","sort": 3},
                      {"Code": "150721","Name": "阿荣旗","sort": 4},
                      {"Code": "150722","Name": "莫力达瓦达斡尔族自治旗","sort": 5},
                      {"Code": "150723","Name": "鄂伦春自治旗","sort": 6},
                      {"Code": "150724","Name": "鄂温克族自治旗","sort": 7},
                      {"Code": "150725","Name": "陈巴尔虎旗","sort": 8},
                      {"Code": "150726","Name": "新巴尔虎左旗","sort": 9},
                      {"Code": "150727","Name": "新巴尔虎右旗","sort": 10},
                      {"Code": "150781","Name": "满洲里市","sort": 11},
                      {"Code": "150782","Name": "牙克石市","sort": 12},
                      {"Code": "150783","Name": "扎兰屯市","sort": 13},
                      {"Code": "150784","Name": "额尔古纳市","sort": 14},
                      {"Code": "150785","Name": "根河市","sort": 15}
                  ]
              },  
              {
                  "Code": "150800",
                  "Name": "巴彦淖尔市",
                  "sort": 8,
                  "level": [
                      {"Code": "150801","Name": "市辖区","sort": 1},
                      {"Code": "150802","Name": "临河区","sort": 2},
                      {"Code": "150821","Name": "五原县","sort": 3},
                      {"Code": "150822","Name": "磴口县","sort": 4},
                      {"Code": "150823","Name": "乌拉特前旗","sort": 5},
                      {"Code": "150824","Name": "乌拉特中旗","sort": 6},
                      {"Code": "150825","Name": "乌拉特后旗","sort": 7},
                      {"Code": "150826","Name": "杭锦后旗","sort": 8}
                  ]
              },  
              {
                  "Code": "150900",
                  "Name": "乌兰察布市",
                  "sort": 9,
                  "level": [
                      {"Code": "150901","Name": "市辖区","sort": 1},
                      {"Code": "150902","Name": "集宁区","sort": 2},
                      {"Code": "150921","Name": "卓资县","sort": 3},
                      {"Code": "150922","Name": "化德县","sort": 4},
                      {"Code": "150923","Name": "商都县","sort": 5},
                      {"Code": "150924","Name": "兴和县","sort": 6},
                      {"Code": "150925","Name": "凉城县","sort": 7},
                      {"Code": "150926","Name": "察哈尔右翼前旗","sort": 8},
                      {"Code": "150927","Name": "察哈尔右翼中旗","sort": 9},
                      {"Code": "150928","Name": "察哈尔右翼后旗","sort": 10},
                      {"Code": "150929","Name": "四子王旗","sort": 11},
                      {"Code": "150981","Name": "丰镇市","sort": 12}
                  ]
              },  
              {
                  "Code": "152200",
                  "Name": "兴安盟",
                  "sort": 10,
                  "level": [
                      {"Code": "152201","Name": "乌兰浩特市","sort": 1},
                      {"Code": "152202","Name": "阿尔山市","sort": 2},
                      {"Code": "152221","Name": "科尔沁右翼前旗","sort": 3},
                      {"Code": "152222","Name": "科尔沁右翼中旗","sort": 4},
                      {"Code": "152223","Name": "扎赉特旗","sort": 5},
                      {"Code": "152224","Name": "突泉县","sort": 6}
                 ]
			 },  
              {
                  "Code": "152500",
                  "Name": "锡林郭勒盟",
                  "sort": 11,
                  "level": [
                      {"Code": "152501","Name": "二连浩特市","sort": 1},
                      {"Code": "152502","Name": "锡林浩特市","sort": 2},
                      {"Code": "152522","Name": "阿巴嘎旗","sort": 3},
                      {"Code": "152523","Name": "苏尼特左旗","sort": 4},
                      {"Code": "152524","Name": "苏尼特右旗","sort": 5},
                      {"Code": "152525","Name": "东乌珠穆沁旗","sort": 6},
                      {"Code": "152526","Name": "西乌珠穆沁旗","sort": 7},
                      {"Code": "152527","Name": "太仆寺旗","sort": 8},
                      {"Code": "152528","Name": "镶黄旗","sort": 9},
                      {"Code": "152529","Name": "正镶白旗","sort": 10},
                      {"Code": "152530","Name": "正蓝旗","sort": 11},
                      {"Code": "152531","Name": "多伦县","sort": 12}
                  ]
              },
              {
                  "Code": "152900",
                  "Name": "阿拉善 ",
                  "sort": 12,
                  "level": [
                      {"Code": "152921","Name": "阿拉善左旗","sort": 1},
                      {"Code": "152922","Name": "阿拉善右旗","sort": 2},
                      {"Code": "152923","Name": "额济纳旗","sort": 3}
                  ]
               }        
          ]
     },
     {
          "Code": "210000",
          "Name": "辽宁省",
          "level": [
              {"Code": "210100","Name": "沈阳市","sort": 1,"level":  [
                    {"Code": "210101","Name": "市辖区","sort": 1},
                    {"Code": "210102","Name": "和平区","sort": 2},
                    {"Code": "210103","Name": "沈河区","sort": 3},
                    {"Code": "210104","Name": "大东区","sort": 4},
                    {"Code": "210105","Name": "皇姑区","sort": 5},
                    {"Code": "210106","Name": "铁西区","sort": 6},
                    {"Code": "210111","Name": "苏家屯区","sort": 7},
                    {"Code": "210112","Name": "浑南区","sort": 8},
                    {"Code": "210113","Name": "沈北新区","sort": 9},
                    {"Code": "210114","Name": "于洪区","sort": 10},
                    {"Code": "210115","Name": "辽中区","sort": 11},
                    {"Code": "210123","Name": "康平县","sort": 12},
                    {"Code": "210124","Name": "法库县","sort": 13},
                    {"Code": "210181","Name": "新民市","sort": 14}
              ]},
              {"Code": "210200","Name": "大连市","sort": 2,"level":  [
                    {"Code": "210201","Name": "市辖区","sort": 1},
                    {"Code": "210202","Name": "中山区","sort": 2},
                    {"Code": "210203","Name": "西岗区","sort": 3},
                    {"Code": "210204","Name": "沙河口区","sort": 4},
                    {"Code": "210211","Name": "甘井子区","sort": 5},
                    {"Code": "210212","Name": "旅顺口区","sort": 6},
                    {"Code": "210213","Name": "金州区","sort": 7},
                    {"Code": "210214","Name": "普兰店区","sort": 8},
                    {"Code": "210224","Name": "长海县","sort": 9},
                    {"Code": "210281","Name": "瓦房店市","sort": 10},
                    {"Code": "210283","Name": "庄河市","sort": 11}
              ]},
              {"Code": "210300","Name": "鞍山市","sort": 3,"level":  [
                    {"Code": "210301","Name": "市辖区","sort": 1},
                    {"Code": "210302","Name": "铁东区","sort": 2},
                    {"Code": "210303","Name": "铁西区","sort": 3},
                    {"Code": "210304","Name": "立山区","sort": 4},
                    {"Code": "210311","Name": "千山区","sort": 5},
                    {"Code": "210321","Name": "台安县","sort": 6},
                    {"Code": "210323","Name": "岫岩满族自治县","sort": 7},
                    {"Code": "210381","Name": "海城市","sort": 8}
              ]},  
              {"Code": "210400","Name": "抚顺市","sort": 4,"level":  [
                    {"Code": "210401","Name": "市辖区","sort": 1},
                    {"Code": "210402","Name": "新抚区","sort": 2},
                    {"Code": "210403","Name": "东洲区","sort": 3},
                    {"Code": "210404","Name": "望花区","sort": 4},
                    {"Code": "210411","Name": "顺城区","sort": 5},
                    {"Code": "210421","Name": "抚顺县","sort": 6},
                    {"Code": "210422","Name": "新宾满族自治县","sort": 7},
                    {"Code": "210423","Name": "清原满族自治县","sort": 8}
              ]},  
              {"Code": "210500","Name": "本溪市","sort": 5,"level":  [
                    {"Code": "210501","Name": "市辖区","sort": 1},
                    {"Code": "210502","Name": "平山区","sort": 2},
                    {"Code": "210503","Name": "溪湖区","sort": 3},
                    {"Code": "210504","Name": "明山区","sort": 4},
                    {"Code": "210505","Name": "南芬区","sort": 5},
                    {"Code": "210521","Name": "本溪满族自治县","sort": 6},
                    {"Code": "210522","Name": "桓仁满族自治县","sort": 7}
              ]},  
              {"Code": "210600","Name": "丹东市","sort": 6,"level":  [
                    {"Code": "210601","Name": "市辖区","sort": 1},
                    {"Code": "210602","Name": "元宝区","sort": 2},
                    {"Code": "210603","Name": "振兴区","sort": 3},
                    {"Code": "210604","Name": "振安区","sort": 4},
                    {"Code": "210624","Name": "宽甸满族自治县","sort": 5},
                    {"Code": "210681","Name": "东港市","sort": 6},
                    {"Code": "210682","Name": "凤城市","sort": 7}
              ]},  
              {"Code": "210700","Name": "锦州市","sort": 7,"level":  [
                    {"Code": "210701","Name": "市辖区","sort": 1},
                    {"Code": "210702","Name": "古塔区","sort": 2},
                    {"Code": "210703","Name": "凌河区","sort": 3},
                    {"Code": "210711","Name": "太和区","sort": 4},
                    {"Code": "210726","Name": "黑山县","sort": 5},
                    {"Code": "210727","Name": "义县","sort": 6},
                    {"Code": "210781","Name": "凌海市","sort": 7},
                    {"Code": "210782","Name": "北镇市","sort": 8}
              ]},  
              {"Code": "210800","Name": "营口市","sort": 8,"level":  [
                    {"Code": "210801","Name": "市辖区","sort": 1},
                    {"Code": "210802","Name": "站前区","sort": 2},
                    {"Code": "210803","Name": "西市区","sort": 3},
                    {"Code": "210804","Name": "鲅鱼圈区","sort": 4},
                    {"Code": "210811","Name": "老边区","sort": 5},
                    {"Code": "210881","Name": "盖州市","sort": 6},
                    {"Code": "210882","Name": "大石桥市","sort": 7}
              ]},  
              {"Code": "210900","Name": "阜新市","sort": 9,"level":  [
                    {"Code": "210901","Name": "市辖区","sort": 1},
                    {"Code": "210902","Name": "海州区","sort": 2},
                    {"Code": "210903","Name": "新邱区","sort": 3},
                    {"Code": "210904","Name": "太平区","sort": 4},
                    {"Code": "210905","Name": "清河门区","sort": 5},
                    {"Code": "210911","Name": "细河区","sort": 6},
                    {"Code": "210921","Name": "阜新蒙古族自治县","sort": 7},
                    {"Code": "210922","Name": "彰武县","sort": 8}
              ]},  
              {"Code": "211000","Name": "辽阳市","sort": 10,"level": [
                    {"Code": "211001","Name": "市辖区","sort": 1},
                    {"Code": "211002","Name": "白塔区","sort": 2},
                    {"Code": "211003","Name": "文圣区","sort": 3},
                    {"Code": "211004","Name": "宏伟区","sort": 4},
                    {"Code": "211005","Name": "弓长岭区","sort": 5},
                    {"Code": "211011","Name": "太子河区","sort": 6},
                    {"Code": "211021","Name": "辽阳县","sort": 7},
                    {"Code": "211081","Name": "灯塔市","sort": 8}
              ]},  
              {"Code": "211100","Name": "盘锦市","sort": 11,"level": [
                    {"Code": "211101","Name": "市辖区","sort": 1},
                    {"Code": "211102","Name": "双台子区","sort": 2},
                    {"Code": "211103","Name": "兴隆台区","sort": 3},
                    {"Code": "211104","Name": "大洼区","sort": 4},
                    {"Code": "211122","Name": "盘山县","sort": 5}
              ]},
              {"Code": "211200","Name": "铁岭市","sort": 12,"level": [
                    {"Code": "211201","Name": "市辖区","sort": 1},
                    {"Code": "211202","Name": "银州区","sort": 2},
                    {"Code": "211204","Name": "清河区","sort": 3},
                    {"Code": "211221","Name": "铁岭县","sort": 4},
                    {"Code": "211223","Name": "西丰县","sort": 5},
                    {"Code": "211224","Name": "昌图县","sort": 6},
                    {"Code": "211281","Name": "调兵山市","sort": 7},
                    {"Code": "211282","Name": "开原市 ","sort": 8}
              ]}, 
              {"Code": "211300","Name": "朝阳市","sort": 13,"level": [
                    {"Code": "211301","Name": "市辖区","sort": 1},
                    {"Code": "211302","Name": "双塔区","sort": 2},
                    {"Code": "211303","Name": "龙城区","sort": 3},
                    {"Code": "211321","Name": "朝阳县","sort": 4},
                    {"Code": "211322","Name": "建平县","sort": 5},
                    {"Code": "211324","Name": "喀喇沁左翼蒙古族自治县","sort": 6},
                    {"Code": "211381","Name": "北票市","sort": 7},
                    {"Code": "211382","Name": "凌源市","sort": 8}
              ]},
              {"Code": "211400","Name": "葫芦岛市","sort": 14,"level": [
                    {"Code": "211401","Name": "市辖区","sort": 1},
                    {"Code": "211402","Name": "连山区","sort": 2},
                    {"Code": "211403","Name": "龙港区","sort": 3},
                    {"Code": "211404","Name": "南票区","sort": 4},
                    {"Code": "211421","Name": "绥中县","sort": 5},
                    {"Code": "211422","Name": "建昌县","sort": 6},
                    {"Code": "211481","Name": "兴城市","sort": 7}
              ]}     
          ]
     },
     {
          "Code": "220000",
          "Name": "吉林省",
          "level": [
              {"Code": "220100","Name": "长春市","sort": 1,"level": [
                    {"Code": "220101","Name": "市辖区","sort": 1},
                    {"Code": "220102","Name": "南关区","sort": 2},
                    {"Code": "220103","Name": "宽城区","sort": 3},
                    {"Code": "220104","Name": "朝阳区","sort": 4},
                    {"Code": "220105","Name": "二道区","sort": 5},
                    {"Code": "220106","Name": "绿园区","sort": 6},
                    {"Code": "220112","Name": "双阳区区","sort": 7},
                    {"Code": "220113","Name": "九台区","sort": 8},
                    {"Code": "220122","Name": "农安县区","sort": 9},
                    {"Code": "220182","Name": "榆树市","sort": 10},
                    {"Code": "220183","Name": "德惠市","sort": 11}
              ]},
              {"Code": "220200","Name": "吉林市","sort": 2,"level": [
                    {"Code": "220201","Name": "市辖区","sort": 1},
                    {"Code": "220202","Name": "昌邑区","sort": 2},
                    {"Code": "220203","Name": "龙潭区","sort": 3},
                    {"Code": "220204","Name": "船营区","sort": 4},
                    {"Code": "220211","Name": "丰满区","sort": 5},
                    {"Code": "220221","Name": "永吉县","sort": 6},
                    {"Code": "220281","Name": "蛟河市","sort": 7},
                    {"Code": "220282","Name": "桦甸市","sort": 8},
                    {"Code": "220283","Name": "舒兰市","sort": 9},
                    {"Code": "220284","Name": "磐石市","sort": 10}
              ]},
              {"Code": "220300","Name": "四平市","sort": 3,"level": [
                    {"Code": "220301","Name": "市辖区","sort": 1},
                    {"Code": "220302","Name": "铁西区","sort": 2},
                    {"Code": "220303","Name": "铁东区","sort": 3},
                    {"Code": "220322","Name": "梨树县","sort": 4},
                    {"Code": "220323","Name": "伊通满族自治县","sort": 5},
                    {"Code": "220381","Name": "公主岭市","sort": 6},
                    {"Code": "220382","Name": "双辽市","sort": 7}
              ]},  
              {"Code": "220400","Name": "辽源市","sort": 4,"level": [
                    {"Code": "220401","Name": "市辖区","sort": 1},
                    {"Code": "220402","Name": "龙山区","sort": 2},
                    {"Code": "220403","Name": "西安区","sort": 3},
                    {"Code": "220421","Name": "东丰县","sort": 4},
                    {"Code": "220422","Name": "东辽县","sort": 5}
              ]},  
              {"Code": "220500","Name": "通化市","sort": 5,"level": [
                    {"Code": "220501","Name": "市辖区","sort": 1},
                    {"Code": "220502","Name": "东昌区","sort": 2},
                    {"Code": "220503","Name": "二道江区","sort": 3},
                    {"Code": "220521","Name": "通化县","sort": 4},
                    {"Code": "220523","Name": "辉南县","sort": 5},
                    {"Code": "220524","Name": "柳河县","sort": 6},
                    {"Code": "220581","Name": "梅河口市","sort": 7},
                    {"Code": "220582","Name": "集安市","sort": 8}
              ]},  
              {"Code": "220600","Name": "白山市","sort": 6,"level": [
                    {"Code": "220601","Name": "市辖区","sort": 1},
                    {"Code": "220602","Name": "浑江区","sort": 2},
                    {"Code": "220605","Name": "江源区","sort": 3},
                    {"Code": "220621","Name": "抚松县","sort": 4},
                    {"Code": "220622","Name": "靖宇县","sort": 5},
                    {"Code": "220623","Name": "长白朝鲜族自治县","sort": 6},
                    {"Code": "220681","Name": "临江市","sort": 7}
              ]},  
              {"Code": "220700","Name": "松原市","sort": 7,"level": [
                    {"Code": "220701","Name": "市辖区","sort": 1},
                    {"Code": "220702","Name": "宁江区","sort": 2},
                    {"Code": "220721","Name": "前郭尔罗斯蒙古族自治县","sort": 3},
                    {"Code": "220722","Name": "长岭县","sort": 4},
                    {"Code": "220723","Name": "乾安县","sort": 5},
                    {"Code": "220781","Name": "扶余市","sort": 6}
              ]},  
              {"Code": "220800","Name": "白城市","sort": 8,"level": [
                    {"Code": "220801","Name": "市辖区","sort": 1},
                    {"Code": "220802","Name": "洮北区","sort": 2},
                    {"Code": "220821","Name": "镇赉县","sort": 3},
                    {"Code": "220822","Name": "通榆县","sort": 4},
                    {"Code": "220881","Name": "洮南市","sort": 5},
                    {"Code": "220882","Name": "大安市","sort": 6}
              ]},  
              {"Code": "222400","Name": "延边朝鲜族自治州","sort": 9,"level": [
                    {"Code": "222401","Name": "延吉市","sort": 1},
                    {"Code": "222402","Name": "图们市","sort": 2},
                    {"Code": "222403","Name": "敦化市","sort": 3},
                    {"Code": "222404","Name": "珲春市","sort": 4},
                    {"Code": "222405","Name": "龙井市","sort": 5},
                    {"Code": "222406","Name": "和龙市","sort": 6},
                    {"Code": "222424","Name": "汪清县","sort": 7},
                    {"Code": "222426","Name": "安图县","sort": 8}
              ]}      
          ]
    },
    {
          "Code": "230000",
          "Name": "黑龙江省",
          "level": [
              {"Code": "230100","Name": "哈尔滨市","sort": 1,"level": [
                      {"Code": "230101","Name": "市辖区","sort": 1},
                      {"Code": "230102","Name": "道里区","sort": 2},
                      {"Code": "230103","Name": "南岗区","sort": 3},
                      {"Code": "230104","Name": "道外区","sort": 4},
                      {"Code": "230108","Name": "平房区","sort": 5},
                      {"Code": "230109","Name": "松北区","sort": 6},
                      {"Code": "230110","Name": "香坊区","sort": 7},
                      {"Code": "230111","Name": "呼兰区","sort": 8},
                      {"Code": "230112","Name": "阿城区","sort": 9},
                      {"Code": "230113","Name": "双城区","sort": 10},
                      {"Code": "230123","Name": "依兰县","sort": 11},
                      {"Code": "230124","Name": "方正县","sort": 12},
                      {"Code": "230125","Name": "宾县","sort": 13},
                      {"Code": "230126","Name": "巴彦县","sort": 14},
                      {"Code": "230127","Name": "木兰县","sort": 15},
                      {"Code": "230128","Name": "通河县","sort": 16},
                      {"Code": "230129","Name": "延寿县","sort": 17},
                      {"Code": "230183","Name": "尚志市","sort": 18},
                      {"Code": "230184","Name": "五常市","sort": 19}
              ]},
              {"Code": "230200","Name": "齐齐哈尔市","sort": 2,"level": [
                      {"Code": "230201","Name": "市辖区","sort": 1},
                      {"Code": "230202","Name": "龙沙区","sort": 2},
                      {"Code": "230203","Name": "建华区","sort": 3},
                      {"Code": "230204","Name": "铁锋区","sort": 4},
                      {"Code": "230205","Name": "昂昂溪区","sort": 5},
                      {"Code": "230206","Name": "富拉尔基区","sort": 6},
                      {"Code": "230207","Name": "碾子山区","sort": 7},
                      {"Code": "230208","Name": "梅里斯达斡尔族区","sort": 8},
                      {"Code": "230221","Name": "龙江县","sort": 9},
                      {"Code": "230223","Name": "依安县","sort": 10},
                      {"Code": "230224","Name": "泰来县","sort": 11},
                      {"Code": "230225","Name": "甘南县","sort": 12},
                      {"Code": "230227","Name": "富裕县","sort": 13},
                      {"Code": "230229","Name": "克山县","sort": 14},
                      {"Code": "230230","Name": "克东县","sort": 15},
                      {"Code": "230231","Name": "拜泉县","sort": 16},
                      {"Code": "230281","Name": "讷河市","sort": 17}
              ]},
              {"Code": "230300","Name": "鸡西市","sort": 3,"level": [
                      {"Code": "230301","Name": "市辖区","sort": 1},
                      {"Code": "230302","Name": "鸡冠区","sort": 2},
                      {"Code": "230303","Name": "恒山区","sort": 3},
                      {"Code": "230304","Name": "滴道区","sort": 4},
                      {"Code": "230305","Name": "梨树区","sort": 5},
                      {"Code": "230306","Name": "城子河区","sort": 6},
                      {"Code": "230307","Name": "麻山区","sort": 7},
                      {"Code": "230321","Name": "鸡东县","sort": 8},
                      {"Code": "230381","Name": "虎林市","sort": 9},
                      {"Code": "230382","Name": "密山市","sort": 10}
              ]},  
              {"Code": "230400","Name": "鹤岗市","sort": 4,"level": [
                      {"Code": "230401","Name": "市辖区","sort": 1},
                      {"Code": "230402","Name": "向阳区","sort": 2},
                      {"Code": "230403","Name": "工农区","sort": 3},
                      {"Code": "230404","Name": "南山区","sort": 4},
                      {"Code": "230405","Name": "兴安区","sort": 5},
                      {"Code": "230406","Name": "东山区","sort": 6},
                      {"Code": "230407","Name": "兴山区","sort": 7},
                      {"Code": "230421","Name": "萝北县","sort": 8},
                      {"Code": "230422","Name": "绥滨县","sort": 9}
              ]},  
              {"Code": "230500","Name": "双鸭山市","sort": 5,"level": [
                      {"Code": "230501","Name": "市辖区","sort": 1},
                      {"Code": "230502","Name": "尖山区","sort": 2},
                      {"Code": "230503","Name": "岭东区","sort": 3},
                      {"Code": "230505","Name": "四方台区","sort": 4},
                      {"Code": "230506","Name": "宝山区","sort": 5},
                      {"Code": "230521","Name": "集贤县","sort": 6},
                      {"Code": "230522","Name": "友谊县","sort": 7},
                      {"Code": "230523","Name": "宝清县","sort": 8},
                      {"Code": "230524","Name": "饶河县","sort": 9}
              ]},  
              {"Code": "230600","Name": "大庆市","sort": 6,"level": [
                      {"Code": "230601","Name": "市辖区","sort": 1},
                      {"Code": "230602","Name": "萨尔图区","sort": 2},
                      {"Code": "230603","Name": "龙凤区","sort": 3},
                      {"Code": "230604","Name": "让胡路区","sort": 4},
                      {"Code": "230605","Name": "红岗区","sort": 5},
                      {"Code": "230606","Name": "大同区","sort": 6},
                      {"Code": "230621","Name": "肇州县","sort": 7},
                      {"Code": "230622","Name": "肇源县","sort": 8},
                      {"Code": "230623","Name": "林甸县","sort": 9},
                      {"Code": "230624","Name": "杜尔伯特蒙古族自治县","sort": 10}
              ]},  
              {"Code": "230700","Name": "伊春","sort": 7,"level": [
                      {"Code": "230701","Name": "市辖区","sort": 1},
                      {"Code": "230702","Name": "伊春区","sort": 2},
                      {"Code": "230703","Name": "南岔区","sort": 3},
                      {"Code": "230704","Name": "友好区","sort": 4},
                      {"Code": "230705","Name": "西林区","sort": 5},
                      {"Code": "230706","Name": "翠峦区","sort": 6},
                      {"Code": "230707","Name": "新青区","sort": 7},
                      {"Code": "230708","Name": "美溪区","sort": 8},
                      {"Code": "230709","Name": "金山屯区","sort": 9},
                      {"Code": "230710","Name": "五营区","sort": 10},
                      {"Code": "230711","Name": "乌马河区","sort": 11},
                      {"Code": "230712","Name": "汤旺河区","sort": 12},
                      {"Code": "230713","Name": "带岭区","sort": 13},
                      {"Code": "230714","Name": "乌伊岭区","sort": 14},
                      {"Code": "230715","Name": "红星区","sort": 15},
                      {"Code": "230716","Name": "上甘岭区","sort": 16},
                      {"Code": "230722","Name": "嘉荫县","sort": 17},
                      {"Code": "230781","Name": "铁力市","sort": 18}
              ]},  
              {"Code": "230800","Name": "佳木斯市","sort": 8,"level": [
                      {"Code": "230801","Name": "市辖区","sort": 1},
                      {"Code": "230803","Name": "向阳区","sort": 2},
                      {"Code": "230804","Name": "前进区","sort": 3},
                      {"Code": "230805","Name": "东风区","sort": 4},
                      {"Code": "230811","Name": "郊区","sort": 5},
                      {"Code": "230822","Name": "桦南县","sort": 6},
                      {"Code": "230826","Name": "桦川县","sort": 7},
                      {"Code": "230828","Name": "汤原县","sort": 8},
                      {"Code": "230881","Name": "同江市","sort": 9},
                      {"Code": "230882","Name": "富锦市","sort": 10},
                      {"Code": "230883","Name": "抚远市","sort": 11},
              ]},  
              {"Code": "230900","Name": "七台河市","sort": 9,"level": [
                      {"Code": "230901","Name": "市辖区","sort": 1},
                      {"Code": "230902","Name": "新兴区","sort": 2},
                      {"Code": "230903","Name": "桃山区","sort": 3},
                      {"Code": "230904","Name": "茄子河区","sort": 4},
                      {"Code": "230921","Name": "勃利县","sort": 5}
              ]},  
              {"Code": "231000","Name": "牡丹江市","sort": 10,"level": [
                      {"Code": "231001","Name": "市辖区","sort": 1},
                      {"Code": "231002","Name": "东安区","sort": 2},
                      {"Code": "231003","Name": "阳明区","sort": 3},
                      {"Code": "231004","Name": "爱民区","sort": 4},
                      {"Code": "231005","Name": "西安区","sort": 5},
                      {"Code": "231025","Name": "林口县","sort": 6},
                      {"Code": "231081","Name": "绥芬河市","sort": 7},
                      {"Code": "231083","Name": "海林市","sort": 8},
                      {"Code": "231084","Name": "宁安市","sort": 9},
                      {"Code": "231085","Name": "穆棱市","sort": 10},
                      {"Code": "231086","Name": "东宁市","sort": 11}
              ]},  
              {"Code": "231100","Name": "黑河市","sort": 11,"level": [
                      {"Code": "231101","Name": "市辖区","sort": 1},
                      {"Code": "231102","Name": "爱辉区","sort": 2},
                      {"Code": "231121","Name": "嫩江县","sort": 3},
                      {"Code": "231123","Name": "逊克县","sort": 4},
                      {"Code": "231124","Name": "孙吴县","sort": 5},
                      {"Code": "231181","Name": "北安市","sort": 6},
                      {"Code": "231182","Name": "五大连池市","sort": 7}
              ]},
              {"Code": "231200","Name": "绥化市","sort": 12,"level": [
                      {"Code": "231201","Name": "市辖区","sort": 1},
                      {"Code": "231202","Name": "北林区","sort": 2},
                      {"Code": "231221","Name": "望奎县","sort": 3},
                      {"Code": "231222","Name": "兰西县","sort": 4},
                      {"Code": "231223","Name": "青冈县","sort": 5},
                      {"Code": "231224","Name": "庆安县","sort": 6},
                      {"Code": "231225","Name": "明水县","sort": 7},
                      {"Code": "231226","Name": "绥棱县","sort": 8},
                      {"Code": "231281","Name": "安达市","sort": 9},
                      {"Code": "231282","Name": "肇东市","sort": 10},
                      {"Code": "231283","Name": "海伦市","sort": 11}
              ]},
              {"Code": "232700","Name": "大兴安岭地区","sort": 13,"level": [
                      {"Code": "232721","Name": "呼玛县","sort": 1},
                      {"Code": "232722","Name": "塔河县","sort": 2},
                      {"Code": "232723","Name": "漠河县","sort": 3}
              ]},       
          ]
    },
    {
          "Code": "310000",
          "Name": "上海市",
          "level": [
              {"Code": "310100","Name": "市辖区","sort": 1,"level": [
                      {"Code": "310101","Name": "黄浦区","sort": 1},
                      {"Code": "310104","Name": "徐汇区","sort": 2},
                      {"Code": "310105","Name": "长宁区","sort": 3},
                      {"Code": "310106","Name": "静安区","sort": 4},
                      {"Code": "310107","Name": "普陀区","sort": 5},
                      {"Code": "310109","Name": "虹口区","sort": 6},
                      {"Code": "310110","Name": "杨浦区","sort": 7},
                      {"Code": "310112","Name": "闵行区","sort": 8},
                      {"Code": "310113","Name": "宝山区","sort": 9},
                      {"Code": "310114","Name": "嘉定区","sort": 10},
                      {"Code": "310115","Name": "浦东新区","sort": 11},
                      {"Code": "310116","Name": "金山区","sort": 12},
                      {"Code": "310117","Name": "松江区","sort": 13},
                      {"Code": "310118","Name": "青浦区","sort": 14},
                      {"Code": "310120","Name": "奉贤区","sort": 15},
                      {"Code": "310151","Name": "崇明区","sort": 16}
              ]}     
          ]
    },
    {
          "Code": "320000",
          "Name": "江苏省",
          "level": [
              {"Code": "320100","Name": "南京市","sort": 1,"level": [
                      {"Code": "320101","Name": "市辖区","sort": 1},
                      {"Code": "320102","Name": "玄武区","sort": 2},
                      {"Code": "320104","Name": "秦淮区","sort": 3},
                      {"Code": "320105","Name": "建邺区","sort": 4},
                      {"Code": "320106","Name": "鼓楼区","sort": 5},
                      {"Code": "320111","Name": "浦口区","sort": 6},
                      {"Code": "320113","Name": "栖霞区","sort": 7},
                      {"Code": "320114","Name": "雨花台区","sort": 8},
                      {"Code": "320115","Name": "江宁区","sort": 9},
                      {"Code": "320116","Name": "六合区","sort": 10},
                      {"Code": "320117","Name": "溧水区","sort": 11},
                      {"Code": "320118","Name": "高淳区","sort": 12}
              ]},
              {"Code": "320200","Name": "无锡市","sort": 2,"level": [
                      {"Code": "320201","Name": "市辖区","sort": 1},
                      {"Code": "320205","Name": "锡山区","sort": 2},
                      {"Code": "320206","Name": "惠山区","sort": 3},
                      {"Code": "320211","Name": "滨湖区","sort": 4},
                      {"Code": "320213","Name": "梁溪区","sort": 5},
                      {"Code": "320214","Name": "新吴区","sort": 6},
                      {"Code": "320281","Name": "江阴市","sort": 7},
                      {"Code": "320282","Name": "宜兴市","sort": 8}
              ]},
              {"Code": "320300","Name": "徐州市","sort": 3,"level": [
                      {"Code": "320301","Name": "市辖区","sort": 1},
                      {"Code": "320302","Name": "鼓楼区","sort": 2},
                      {"Code": "320303","Name": "云龙区","sort": 3},
                      {"Code": "320305","Name": "贾汪区","sort": 4},
                      {"Code": "320311","Name": "泉山区","sort": 5},
                      {"Code": "320312","Name": "铜山区","sort": 6},
                      {"Code": "320321","Name": "丰县","sort": 7},
                      {"Code": "320322","Name": "沛县","sort": 8},
                      {"Code": "320324","Name": "睢宁县","sort": 9},
                      {"Code": "320381","Name": "新沂市","sort": 10},
                      {"Code": "320382","Name": "邳州市","sort": 11}
              ]},  
              {"Code": "320400","Name": "常州市","sort": 4,"level": [
                      {"Code": "320401","Name": "市辖区","sort": 1},
                      {"Code": "320402","Name": "天宁区","sort": 2},
                      {"Code": "320404","Name": "钟楼区","sort": 3},
                      {"Code": "320411","Name": "新北区","sort": 4},
                      {"Code": "320412","Name": "武进区","sort": 5},
                      {"Code": "320413","Name": "金坛区","sort": 6},
                      {"Code": "320481","Name": "溧阳市","sort": 7}
              ]},  
              {"Code": "320500","Name": "苏州市","sort": 5,"level": [
                      {"Code": "320501","Name": " 市辖区 ","sort": 1},
                      {"Code": "320505","Name": "虎丘区","sort": 2},
                      {"Code": "320506","Name": "吴中区","sort": 3},
                      {"Code": "320507","Name": "相城区","sort": 4},
                      {"Code": "320508","Name": "姑苏区","sort": 5},
                      {"Code": "320509","Name": "吴江区","sort": 6},
                      {"Code": "320581","Name": "常熟市","sort": 7},
                      {"Code": "320582","Name": "张家港市","sort": 8},
                      {"Code": "320583","Name": "昆山市","sort": 9},
                      {"Code": "320585","Name": "太仓市","sort": 10}
              ]},  
              {"Code": "320600","Name": "南通市","sort": 6,"level": [
                      {"Code": "320601","Name": "市辖区","sort": 1},
                      {"Code": "320602","Name": "崇川区","sort": 2},
                      {"Code": "320611","Name": "港闸区","sort": 3},
                      {"Code": "320612","Name": "通州区","sort": 4},
                      {"Code": "320621","Name": "海安县","sort": 5},
                      {"Code": "320623","Name": "如东县","sort": 6},
                      {"Code": "320681","Name": "启东市","sort": 7},
                      {"Code": "320682","Name": "如皋市","sort": 8},
                      {"Code": "320684","Name": "海门市","sort": 9}
              ]},  
              {"Code": "320700","Name": "连云港市","sort": 7,"level": [
                      {"Code": "320701","Name": "市辖区","sort": 1},
                      {"Code": "320703","Name": "连云区","sort": 2},
                      {"Code": "320706","Name": "海州区","sort": 3},
                      {"Code": "320707","Name": "赣榆区","sort": 4},
                      {"Code": "320722","Name": "东海县","sort": 5},
                      {"Code": "320723","Name": "灌云县","sort": 6},
                      {"Code": "320724","Name": "灌南县","sort": 7}
              ]},  
              {"Code": "320800","Name": "淮安市","sort": 8,"level": [
                      {"Code": "320801","Name": "市辖区","sort": 1},
                      {"Code": "320803","Name": "淮安区","sort": 2},
                      {"Code": "320804","Name": "淮阴区","sort": 3},
                      {"Code": "320812","Name": "清江浦区","sort": 4},
                      {"Code": "320813","Name": "洪泽区","sort": 5},
                      {"Code": "320826","Name": "涟水县","sort": 6},
                      {"Code": "320830","Name": "盱眙县","sort": 7},
                      {"Code": "320831","Name": "金湖县","sort": 8}
              ]},  
              {"Code": "320900","Name": "盐城市","sort": 9,"level": [
                      {"Code": "320901","Name": "市辖区","sort": 1},
                      {"Code": "320902","Name": "亭湖区","sort": 2},
                      {"Code": "320903","Name": "盐都区","sort": 3},
                      {"Code": "320904","Name": "大丰区","sort": 4},
                      {"Code": "320921","Name": "响水县","sort": 5},
                      {"Code": "320922","Name": "滨海县","sort": 6},
                      {"Code": "320923","Name": "阜宁县","sort": 7},
                      {"Code": "320924","Name": "射阳县","sort": 8},
                      {"Code": "320925","Name": "建湖县","sort": 9},
                      {"Code": "320981","Name": "东台市","sort": 10}
              ]},  
              {"Code": "321000","Name": "扬州市","sort": 10,"level": [
                      {"Code": "321001","Name": "市辖区","sort": 1},
                      {"Code": "321002","Name": "广陵区","sort": 2},
                      {"Code": "321003","Name": "邗江区","sort": 3},
                      {"Code": "321012","Name": "江都区","sort": 4},
                      {"Code": "321023","Name": "宝应县","sort": 5},
                      {"Code": "321081","Name": "仪征市","sort": 6},
                      {"Code": "321084","Name": "高邮市","sort": 7}
              ]},  
              {"Code": "321100","Name": "镇江市","sort": 11,"level": [
                      {"Code": "321101","Name": "市辖区","sort": 1},
                      {"Code": "321102","Name": "京口区","sort": 2},
                      {"Code": "321111","Name": "润州区","sort": 3},
                      {"Code": "321112","Name": "丹徒区","sort": 4},
                      {"Code": "321181","Name": "丹阳市","sort": 5},
                      {"Code": "321182","Name": "扬中市","sort": 6},
                      {"Code": "321183","Name": "句容市","sort": 7}
              ]},
              {"Code": "321200","Name": "泰州市","sort": 12,"level": [
                      {"Code": "321201","Name": "市辖区","sort": 1},
                      {"Code": "321202","Name": "海陵区","sort": 2},
                      {"Code": "321203","Name": "高港区","sort": 3},
                      {"Code": "321204","Name": "姜堰区","sort": 4},
                      {"Code": "321281","Name": "兴化市","sort": 5},
                      {"Code": "321282","Name": "靖江市","sort": 6},
                      {"Code": "321283","Name": "泰兴市","sort": 7}
              ]},
              {"Code": "321300","Name": "宿迁市","sort": 13,"level": [
                      {"Code": "321301","Name": "市辖区","sort": 1},
                      {"Code": "321302","Name": "宿城区","sort": 2},
                      {"Code": "321311","Name": "宿豫区","sort": 3},
                      {"Code": "321322","Name": "沭阳县","sort": 4},
                      {"Code": "321323","Name": "泗阳县","sort": 5},
                      {"Code": "321324","Name": "泗洪县","sort": 6}
              ]}     
          ]
    },
    {
          "Code": "330000",
          "Name": "浙江省",
          "level": [
              {"Code": "330100","Name": "杭州市","sort": 1,"level": [
                      {"Code": "330101","Name": "市辖区","sort": 1},
                      {"Code": "330102","Name": "上城区","sort": 2},
                      {"Code": "330103","Name": "下城区","sort": 3},
                      {"Code": "330104","Name": "江干区","sort": 4},
                      {"Code": "330105","Name": "拱墅区","sort": 5},
                      {"Code": "330106","Name": "西湖区","sort": 6},
                      {"Code": "330108","Name": "滨江区","sort": 7},
                      {"Code": "330109","Name": "萧山区","sort": 8},
                      {"Code": "330110","Name": "余杭区","sort": 9},
                      {"Code": "330111","Name": "富阳区","sort": 10},
                      {"Code": "330122","Name": "桐庐县","sort": 11},
                      {"Code": "330127","Name": "淳安县","sort": 12},
                      {"Code": "330182","Name": "建德市","sort": 13},
                      {"Code": "330185","Name": "临安市","sort": 14}
              ]},
              {"Code": "330200","Name": "宁波市","sort": 2,"level": [
                      {"Code": "330201","Name": "市辖区","sort": 1},
                      {"Code": "330203","Name": "海曙区","sort": 2},
                      {"Code": "330204","Name": "江东区","sort": 3},
                      {"Code": "330205","Name": "江北区","sort": 4},
                      {"Code": "330206","Name": "北仑区","sort": 5},
                      {"Code": "330211","Name": "镇海区","sort": 6},
                      {"Code": "330212","Name": "鄞州区","sort": 7},
                      {"Code": "330225","Name": "象山县","sort": 8},
                      {"Code": "330226","Name": "宁海县","sort": 9},
                      {"Code": "330281","Name": "余姚市","sort": 10},
                      {"Code": "330282","Name": "慈溪市","sort": 11},
                      {"Code": "330283","Name": "奉化市","sort": 12}
              ]},
              {"Code": "330300","Name": "温州市","sort": 3,"level": [
                      {"Code": "330301","Name": "市辖区","sort": 1},
                      {"Code": "330302","Name": "鹿城区","sort": 2},
                      {"Code": "330303","Name": "龙湾区","sort": 3},
                      {"Code": "330304","Name": "瓯海区","sort": 4},
                      {"Code": "330305","Name": "洞头区","sort": 5},
                      {"Code": "330324","Name": "永嘉县","sort": 6},
                      {"Code": "330326","Name": "平阳县","sort": 7},
                      {"Code": "330327","Name": "苍南县","sort": 8},
                      {"Code": "330328","Name": "文成县","sort": 9},
                      {"Code": "330329","Name": "泰顺县","sort": 10},
                      {"Code": "330381","Name": "瑞安市","sort": 11},
                      {"Code": "330382","Name": "乐清市","sort": 12}
              ]},  
              {"Code": "330400","Name": "嘉兴市","sort": 4,"level": [
                      {"Code": "330401","Name": "市辖区","sort": 1},
                      {"Code": "330402","Name": "南湖区","sort": 2},
                      {"Code": "330411","Name": "秀洲区","sort": 3},
                      {"Code": "330421","Name": "嘉善县","sort": 4},
                      {"Code": "330424","Name": "海盐县","sort": 5},
                      {"Code": "330481","Name": "海宁市","sort": 6},
                      {"Code": "330482","Name": "平湖市","sort": 7},
                      {"Code": "330483","Name": "桐乡市","sort": 8}
              ]},  
              {"Code": "330500","Name": "湖州市","sort": 5,"level": [
                      {"Code": "330501","Name": "市辖区","sort": 1},
                      {"Code": "330502","Name": "吴兴区","sort": 2},
                      {"Code": "330503","Name": "南浔区","sort": 3},
                      {"Code": "330521","Name": "德清县","sort": 4},
                      {"Code": "330522","Name": "长兴县","sort": 5},
                      {"Code": "330523","Name": "安吉县","sort": 6}
              ]},  
              {"Code": "330600","Name": "绍兴市","sort": 6,"level": [
                      {"Code": "330601","Name": "市辖区","sort": 1},
                      {"Code": "330602","Name": "越城区","sort": 2},
                      {"Code": "330603","Name": "柯桥区","sort": 3},
                      {"Code": "330604","Name": "上虞区","sort": 4},
                      {"Code": "330624","Name": "新昌县","sort": 5},
                      {"Code": "330681","Name": "诸暨市","sort": 6},
                      {"Code": "330683","Name": "嵊州市","sort": 7}
              ]},  
              {"Code": "330700","Name": "金华市","sort": 7,"level": [
                      {"Code": "330701","Name": "市辖区","sort": 1},
                      {"Code": "330702","Name": "婺城区","sort": 2},
                      {"Code": "330703","Name": "金东区","sort": 3},
                      {"Code": "330723","Name": "武义县","sort": 4},
                      {"Code": "330726","Name": "浦江县","sort": 5},
                      {"Code": "330727","Name": "磐安县","sort": 6},
                      {"Code": "330781","Name": "兰溪市","sort": 7},
                      {"Code": "330782","Name": "义乌市","sort": 8},
                      {"Code": "330783","Name": "东阳市","sort": 9},
                      {"Code": "330784","Name": "永康市","sort": 10}
              ]},  
              {"Code": "330800","Name": "衢州市","sort": 8,"level": [
                      {"Code": "330801","Name": "市辖区","sort": 1},
                      {"Code": "330802","Name": "柯城区","sort": 2},
                      {"Code": "330803","Name": "衢江区","sort": 3},
                      {"Code": "330822","Name": "常山县","sort": 4},
                      {"Code": "330824","Name": "开化县","sort": 5},
                      {"Code": "330825","Name": "龙游县","sort": 6},
                      {"Code": "330881","Name": "江山市","sort": 7}
              ]},  
              {"Code": "330900","Name": "舟山市","sort": 9,"level": [
                      {"Code": "330901","Name": "市辖区","sort": 1},
                      {"Code": "330902","Name": "定海区","sort": 2},
                      {"Code": "330903","Name": "普陀区","sort": 3},
                      {"Code": "330921","Name": "岱山县","sort": 4},
                      {"Code": "330922","Name": "嵊泗县","sort": 5}
              ]},  
              {"Code": "331000","Name": "台州市","sort": 10,"level": [
                      {"Code": "331001","Name": "市辖区","sort": 1},
                      {"Code": "331002","Name": "椒江区","sort": 2},
                      {"Code": "331003","Name": "黄岩区","sort": 3},
                      {"Code": "331004","Name": "路桥区","sort": 4},
                      {"Code": "331021","Name": "玉环县","sort": 5},
                      {"Code": "331022","Name": "三门县","sort": 6},
                      {"Code": "331023","Name": "天台县","sort": 7},
                      {"Code": "331024","Name": "仙居县","sort": 8},
                      {"Code": "331081","Name": "温岭市","sort": 9},
                      {"Code": "331082","Name": "临海市","sort": 10}
              ]},  
              {"Code": "331100","Name": "丽水市","sort": 11,"level": [
                      {"Code": "331101","Name": "市辖区","sort": 1},
                      {"Code": "331102","Name": "莲都区","sort": 2},
                      {"Code": "331121","Name": "青田县","sort": 3},
                      {"Code": "331122","Name": "缙云县","sort": 4},
                      {"Code": "331123","Name": "遂昌县","sort": 5},
                      {"Code": "331124","Name": "松阳县","sort": 6},
                      {"Code": "331125","Name": "云和县","sort": 7},
                      {"Code": "331126","Name": "庆元县","sort": 8},
                      {"Code": "331127","Name": "景宁畲族自治县","sort": 9},
                      {"Code": "331181","Name": "龙泉市","sort": 10}
              ]}
          ]
    },
    {
          "Code": "340000",
          "Name": "安徽省",
          "level": [
              {"Code": "340100","Name": "合肥市","sort": 1,"level": [
                      {"Code": "340101","Name": "市辖区","sort": 1},
                      {"Code": "340102","Name": "瑶海区","sort": 2},
                      {"Code": "340103","Name": "庐阳区","sort": 3},
                      {"Code": "340104","Name": "蜀山区","sort": 4},
                      {"Code": "340111","Name": "包河区","sort": 5},
                      {"Code": "340121","Name": "长丰县","sort": 6},
                      {"Code": "340122","Name": "肥东县","sort": 7},
                      {"Code": "340123","Name": "肥西县","sort": 8},
                      {"Code": "340124","Name": "庐江县","sort": 9},
                      {"Code": "340181","Name": "巢湖市","sort": 10}
              ]},
              {"Code": "340200","Name": "芜湖市","sort": 2,"level": [
                      {"Code": "340201","Name": "市辖区","sort": 1},
                      {"Code": "340202","Name": "镜湖区","sort": 2},
                      {"Code": "340203","Name": "弋江区","sort": 3},
                      {"Code": "340207","Name": "鸠江区","sort": 4},
                      {"Code": "340208","Name": "三山区","sort": 5},
                      {"Code": "340221","Name": "芜湖县","sort": 6},
                      {"Code": "340222","Name": "繁昌县","sort": 7},
                      {"Code": "340223","Name": "南陵县","sort": 8},
                      {"Code": "340225","Name": "无为县","sort": 9}
              ]},
              {"Code": "340300","Name": "蚌埠市","sort": 3,"level": [
                      {"Code": "340301","Name": "市辖区","sort": 1},
                      {"Code": "340302","Name": "龙子湖区","sort": 2},
                      {"Code": "340303","Name": "蚌山区","sort": 3},
                      {"Code": "340304","Name": "禹会区","sort": 4},
                      {"Code": "340311","Name": "淮上区","sort": 5},
                      {"Code": "340321","Name": "怀远县","sort": 6},
                      {"Code": "340322","Name": "五河县","sort": 7},
                      {"Code": "340323","Name": "固镇县","sort": 8}
              ]},  
              {"Code": "340400","Name": "淮南市","sort": 4,"level": [
                      {"Code": "340401","Name": "市辖区","sort": 1},
                      {"Code": "340402","Name": "大通区","sort": 2},
                      {"Code": "340403","Name": "田家庵区","sort": 3},
                      {"Code": "340404","Name": "谢家集区","sort": 4},
                      {"Code": "340405","Name": "八公山区","sort": 5},
                      {"Code": "340406","Name": "潘集区","sort": 6},
                      {"Code": "340421","Name": "凤台县","sort": 7},
                      {"Code": "340422","Name": "寿县","sort": 8}
              ]},  
              {"Code": "340500","Name": "马鞍山市","sort": 5,"level": [
                      {"Code": "340501","Name": "市辖区","sort": 1},
                      {"Code": "340503","Name": "花山区","sort": 2},
                      {"Code": "340504","Name": "雨山区","sort": 3},
                      {"Code": "340506","Name": "博望区","sort": 4},
                      {"Code": "340521","Name": "当涂县","sort": 5},
                      {"Code": "340522","Name": "含山县","sort": 6},
                      {"Code": "340523","Name": "和县","sort": 7}
              ]},  
              {"Code": "340600","Name": "淮北市","sort": 6,"level": [
                      {"Code": "340601","Name": "市辖区","sort": 1},
                      {"Code": "340602","Name": "杜集区","sort": 2},
                      {"Code": "340603","Name": "相山区","sort": 3},
                      {"Code": "340604","Name": "烈山区","sort": 4},
                      {"Code": "340621","Name": "濉溪县","sort": 5}
              ]},  
              {"Code": "340700","Name": "铜陵市","sort": 7,"level": [
                      {"Code": "340701","Name": "市辖区","sort": 1},
                      {"Code": "340705","Name": "铜官区","sort": 2},
                      {"Code": "340706","Name": "义安区","sort": 3},
                      {"Code": "340711","Name": "郊区","sort": 4},
                      {"Code": "340722","Name": "枞阳县","sort": 5},
              ]},  
              {"Code": "340800","Name": "安庆市","sort": 8,"level": [
                      {"Code": "340801","Name": "市辖区","sort": 1},
                      {"Code": "340802","Name": "迎江区","sort": 2},
                      {"Code": "340803","Name": "大观区","sort": 3},
                      {"Code": "340811","Name": "宜秀区","sort": 4},
                      {"Code": "340822","Name": "怀宁县","sort": 5},
                      {"Code": "340824","Name": "潜山县","sort": 6},
                      {"Code": "340825","Name": "太湖县","sort": 7},
                      {"Code": "340826","Name": "宿松县","sort": 8},
                      {"Code": "340827","Name": "望江县","sort": 9},
                      {"Code": "340828","Name": "岳西县","sort": 10},
                      {"Code": "340881","Name": "桐城市","sort": 11}
              ]},  
              {"Code": "341000","Name": "黄山市","sort": 9,"level": [
                      {"Code": "341001","Name": "市辖区","sort": 1},
                      {"Code": "341002","Name": "屯溪区","sort": 2},
                      {"Code": "341003","Name": "黄山区","sort": 3},
                      {"Code": "341004","Name": "徽州区","sort": 4},
                      {"Code": "341021","Name": "歙县","sort": 5},
                      {"Code": "341022","Name": "休宁县","sort": 6},
                      {"Code": "341023","Name": "黟县","sort": 7},
                      {"Code": "341024","Name": "祁门县","sort": 8}
              ]},  
              {"Code": "341100","Name": "滁州市","sort": 10,"level": [
                      {"Code": "341101","Name": "市辖区","sort": 1},
                      {"Code": "341102","Name": "琅琊区","sort": 2},
                      {"Code": "341103","Name": "南谯区","sort": 3},
                      {"Code": "341122","Name": "来安县","sort": 4},
                      {"Code": "341124","Name": "全椒县","sort": 5},
                      {"Code": "341125","Name": "定远县","sort": 6},
                      {"Code": "341126","Name": "凤阳县","sort": 7},
                      {"Code": "341181","Name": "天长市","sort": 8},
                      {"Code": "341182","Name": "明光市","sort": 9}
              ]},  
              {"Code": "341200","Name": "阜阳市","sort": 11,"level": [
                      {"Code": "341201","Name": "市辖区","sort": 1},
                      {"Code": "341202","Name": "颍州区","sort": 2},
                      {"Code": "341203","Name": "颍东区","sort": 3},
                      {"Code": "341204","Name": "颍泉区","sort": 4}, 
                      {"Code": "341221","Name": "临泉县","sort": 5}, 
                      {"Code": "341222","Name": "太和县","sort": 6}, 
                      {"Code": "341225","Name": "阜南县","sort": 7}, 
                      {"Code": "341226","Name": "颍上县","sort": 8}, 
                      {"Code": "341282","Name": "界首市","sort": 9} 
              ]},
              {"Code": "341300","Name": "宿州市","sort": 12,"level": [
                      {"Code": "341301","Name": "市辖区","sort": 1}, 
                      {"Code": "341302","Name": "埇桥区","sort": 2}, 
                      {"Code": "341321","Name": "砀山县","sort": 3}, 
                      {"Code": "341322","Name": "萧县","sort": 4}, 
                      {"Code": "341323","Name": "灵璧县","sort": 5}, 
                      {"Code": "341324","Name": "泗县","sort": 6} 
              ]},
              {"Code": "341400","Name": "巢湖市","sort": 13,"level": [
                      {"Code": "341501","Name": "市辖区","sort": 1}, 
                      {"Code": "341502","Name": "金安区","sort": 2}, 
                      {"Code": "341503","Name": "裕安区","sort": 3}, 
                      {"Code": "341504","Name": "叶集区","sort": 4}, 
                      {"Code": "341522","Name": "霍邱县","sort": 5}, 
                      {"Code": "341523","Name": "舒城县","sort": 6}, 
                      {"Code": "341524","Name": "金寨县","sort": 7}, 
                      {"Code": "341525","Name": "霍山县","sort": 8} 
              ]}, 
              {"Code": "341500","Name": "六安市","sort": 14,"level": [
                      {"Code": "330301","Name": "市辖区","sort": 1},
                      {"Code": "330302","Name": "鹿城区","sort": 2},
                      {"Code": "330303","Name": "龙湾区","sort": 3},
                      {"Code": "330304","Name": "瓯海区","sort": 4},
                      {"Code": "330305","Name": "洞头区","sort": 5},
                      {"Code": "330324","Name": "永嘉县","sort": 6},
                      {"Code": "330326","Name": "平阳县","sort": 7},
                      {"Code": "330327","Name": "苍南县","sort": 8},
                      {"Code": "330328","Name": "文成县","sort": 9},
                      {"Code": "330329","Name": "泰顺县","sort": 10},
                      {"Code": "330381","Name": "瑞安市","sort": 11},
                      {"Code": "330382","Name": "乐清市","sort": 12}
              ]},
              {"Code": "341600","Name": "亳州市","sort": 15,"level": [
                      {"Code": "341601","Name": "市辖区","sort": 1}, 
                      {"Code": "341602","Name": "谯城区","sort": 2}, 
                      {"Code": "341621","Name": "涡阳县","sort": 3}, 
                      {"Code": "341622","Name": "蒙城县","sort": 4}, 
                      {"Code": "341623","Name": "利辛县","sort": 5}
              ]},
              {"Code": "341700","Name": "池州市","sort": 16,"level": [
                      {"Code": "341701","Name": "市辖区","sort": 1}, 
                      {"Code": "341702","Name": "贵池区","sort": 2}, 
                      {"Code": "341721","Name": "东至县","sort": 3}, 
                      {"Code": "341722","Name": "石台县","sort": 4}, 
                      {"Code": "341723","Name": "青阳县","sort": 5}, 
              ]}, 
              {"Code": "341800","Name": "宣城市","sort": 17,"level": [
                      {"Code": "341801","Name": "市辖区","sort": 1}, 
                      {"Code": "341802","Name": "宣州区","sort": 2}, 
                      {"Code": "341821","Name": "郎溪县","sort": 3}, 
                      {"Code": "341822","Name": "广德县","sort": 4}, 
                      {"Code": "341823","Name": "泾县","sort":  5}, 
                      {"Code": "341824","Name": "绩溪县","sort": 6}, 
                      {"Code": "341825","Name": "旌德县","sort": 7}, 
                      {"Code": "341881","Name": "宁国市","sort": 8}
              ]}   
          ]
    },
    {
          "Code": "350000",
          "Name": "福建省",
          "level": [ 
              {"Code": "350100","Name": "福州市","sort": 1,"level": [
                      {"Code": "350101","Name": "市辖区","sort": 1}, 
                      {"Code": "350102","Name": "鼓楼区","sort": 2}, 
                      {"Code": "350103","Name": "台江区","sort": 3}, 
                      {"Code": "350104","Name": "仓山区","sort": 4}, 
                      {"Code": "350105","Name": "马尾区","sort": 5}, 
                      {"Code": "350111","Name": "晋安区","sort": 6}, 
                      {"Code": "350121","Name": "闽侯县","sort": 7}, 
                      {"Code": "350122","Name": "连江县","sort": 8}, 
                      {"Code": "350123","Name": "罗源县","sort": 9}, 
                      {"Code": "350124","Name": "闽清县","sort": 10}, 
                      {"Code": "350125","Name": "永泰县","sort":11},
                      {"Code": "350128","Name": "平潭县","sort":12},
                      {"Code": "350181","Name": "福清市","sort":13},
                      {"Code": "350182","Name": "长乐市","sort":14}
              ]},
              {"Code": "350200","Name": "厦门市","sort": 2,"level": [
                      {"Code": "350201","Name": "市辖区","sort": 1},
                      {"Code": "350203","Name": "思明区","sort": 2},
                      {"Code": "350205","Name": "海沧区","sort": 3},
                      {"Code": "350206","Name": "湖里区","sort": 4},
                      {"Code": "350211","Name": "集美区","sort": 5},
                      {"Code": "350212","Name": "同安区","sort": 6},
                      {"Code": "350213","Name": "翔安区","sort": 7}
              ]},
              {"Code": "350300","Name": "莆田市","sort": 3,"level": [
                      {"Code": "350301","Name": "市辖区","sort": 1},
                      {"Code": "350302","Name": "城厢区","sort": 2},
                      {"Code": "350303","Name": "涵江区","sort": 3},
                      {"Code": "350304","Name": "荔城区","sort": 4},
                      {"Code": "350305","Name": "秀屿区","sort": 5},
                      {"Code": "350322","Name": "仙游县","sort": 6}
              ]},  
              {"Code": "350400","Name": "三明市","sort": 4,"level": [
                      {"Code": "350401","Name": "市辖区","sort": 1}, 
                      {"Code": "350402","Name": "梅列区","sort": 2}, 
                      {"Code": "350403","Name": "三元区","sort": 3}, 
                      {"Code": "350421","Name": "明溪县","sort": 4}, 
                      {"Code": "350423","Name": "清流县","sort": 5}, 
                      {"Code": "350424","Name": "宁化县","sort": 6}, 
                      {"Code": "350425","Name": "大田县","sort": 8}, 
                      {"Code": "350426","Name": "尤溪县","sort": 9}, 
                      {"Code": "350427","Name": "沙县","sort": 10}, 
                      {"Code": "350428","Name": "将乐县","sort": 11}, 
                      {"Code": "350429","Name": "泰宁县","sort": 12}, 
                      {"Code": "350430","Name": "建宁县","sort": 13}, 
                      {"Code": "350481","Name": "永安市","sort": 14}
              ]},  
              {"Code": "350500","Name": "泉州市","sort": 5,"level": [
                      {"Code": "350501","Name": "市辖区","sort": 1}, 
                      {"Code": "350502","Name": "鲤城区","sort": 2}, 
                      {"Code": "350503","Name": "丰泽区","sort": 3}, 
                      {"Code": "350504","Name": "洛江区","sort": 4}, 
                      {"Code": "350505","Name": "泉港区","sort": 5}, 
                      {"Code": "350521","Name": "惠安县","sort": 6}, 
                      {"Code": "350524","Name": "安溪县","sort": 8}, 
                      {"Code": "350525","Name": "永春县","sort": 9}, 
                      {"Code": "350526","Name": "德化县","sort": 10}, 
                      {"Code": "350527","Name": "金门县","sort": 11}, 
                      {"Code": "350581","Name": "石狮市","sort": 12}, 
                      {"Code": "350582","Name": "晋江市","sort": 13}, 
                      {"Code": "350583","Name": "南安市","sort": 14}
              ]},  
              {"Code": "350600","Name": "漳州市","sort": 6,"level": [
                      {"Code": "350601","Name": "市辖区","sort": 1}, 
                      {"Code": "350602","Name": "芗城区","sort": 2}, 
                      {"Code": "350603","Name": "龙文区","sort": 3}, 
                      {"Code": "350622","Name": "云霄县","sort": 4}, 
                      {"Code": "350623","Name": "漳浦县","sort": 5}, 
                      {"Code": "350624","Name": "诏安县","sort": 6}, 
                      {"Code": "350625","Name": "长泰县","sort": 8}, 
                      {"Code": "350626","Name": "东山县","sort": 9}, 
                      {"Code": "350627","Name": "南靖县","sort": 10}, 
                      {"Code": "350628","Name": "平和县","sort": 11}, 
                      {"Code": "350629","Name": "华安县","sort": 12}, 
                      {"Code": "350681","Name": "龙海市","sort": 13} 
              ]},                                                
              {"Code": "350700","Name": "南平市","sort": 7,"level": [
                      {"Code": "350701","Name": "市辖区","sort": 1}, 
                      {"Code": "350702","Name": "延平区","sort": 2}, 
                      {"Code": "350703","Name": "建阳区","sort": 3}, 
                      {"Code": "350721","Name": "顺昌县","sort": 4}, 
                      {"Code": "350722","Name": "浦城县","sort": 5}, 
                      {"Code": "350723","Name": "光泽县","sort": 6}, 
                      {"Code": "350724","Name": "松溪县","sort": 7}, 
                      {"Code": "350725","Name": "政和县","sort": 8}, 
                      {"Code": "350781","Name": "邵武市","sort": 9}, 
                      {"Code": "350782","Name": "武夷山市","sort": 10},
                      {"Code": "350783","Name": "建瓯市","sort": 11},
              ]},  
              {"Code": "350800","Name": "龙岩市","sort": 8,"level": [
                      {"Code": "350801","Name": "市辖区","sort": 1},
                      {"Code": "350802","Name": "新罗区","sort": 2},
                      {"Code": "350803","Name": "永定区","sort": 3},
                      {"Code": "350821","Name": "长汀县","sort": 4},
                      {"Code": "350823","Name": "上杭县","sort": 5},
                      {"Code": "350824","Name": "武平县","sort": 6},
                      {"Code": "350825","Name": "连城县","sort": 7},
                      {"Code": "350881","Name": "漳平市","sort": 8}
              ]},  
              {"Code": "350900","Name": "宁德市","sort": 9,"level": [
                      {"Code": "350901","Name": "市辖区","sort": 1},
                      {"Code": "350902","Name": "蕉城区","sort": 2},
                      {"Code": "350921","Name": "霞浦县","sort": 3},
                      {"Code": "350922","Name": "古田县","sort": 4},
                      {"Code": "350923","Name": "屏南县","sort": 5},
                      {"Code": "350924","Name": "寿宁县","sort": 6},
                      {"Code": "350925","Name": "周宁县","sort": 7}, 
                      {"Code": "350926","Name": "柘荣县","sort": 8}, 
                      {"Code": "350981","Name": "福安市","sort": 9}, 
                      {"Code": "350982","Name": "福鼎市","sort": 10} 
              ]}  
          ]
    },
    {
          "Code": "360000",
          "Name": "江西省",
          "level": [
              {"Code": "360100","Name": "南昌市","sort": 1,"level": [
                      {"Code": "360101","Name": "市辖区","sort": 1}, 
                      {"Code": "360102","Name": "东湖区","sort": 2}, 
                      {"Code": "360103","Name": "西湖区","sort": 3}, 
                      {"Code": "360104","Name": "青云谱区","sort": 4}, 
                      {"Code": "360105","Name": "湾里区","sort": 5}, 
                      {"Code": "360111","Name": "青山湖区 ","sort": 6}, 
                      {"Code": "360112","Name": "新建区","sort": 7}, 
                      {"Code": "360121","Name": "南昌县","sort": 8}, 
                      {"Code": "360123","Name": "安义县","sort": 9}, 
                      {"Code": "360124","Name": "进贤县","sort": 10}
              ]},
              {"Code": "360200","Name": "景德镇市","sort": 2,"level": [
                      {"Code": "360201","Name": "市辖区","sort": 1}, 
                      {"Code": "360202","Name": "昌江区","sort": 2}, 
                      {"Code": "360203","Name": "珠山区","sort": 3}, 
                      {"Code": "360222","Name": "浮梁县","sort": 4}, 
                      {"Code": "360281","Name": "乐平市","sort": 5}
              ]},
              {"Code": "360300","Name": "萍乡市","sort": 3,"level": [
                      {"Code": "360301","Name": "市辖区","sort": 1}, 
                      {"Code": "360302","Name": "安源区","sort": 2}, 
                      {"Code": "360313","Name": "湘东区","sort": 3}, 
                      {"Code": "360321","Name": "莲花县","sort": 4}, 
                      {"Code": "360322","Name": "上栗县","sort": 5}, 
                      {"Code": "360323","Name": "芦溪县","sort": 6},
              ]},  
              {"Code": "360400","Name": "九江市","sort": 4,"level": [
                      {"Code": "360401","Name": "市辖区","sort": 1}, 
                      {"Code": "360402","Name": "濂溪区","sort": 2}, 
                      {"Code": "360403","Name": "浔阳区","sort": 3}, 
                      {"Code": "360421","Name": "九江县","sort": 4}, 
                      {"Code": "360423","Name": "武宁县","sort": 5}, 
                      {"Code": "360424","Name": "修水县","sort": 6}, 
                      {"Code": "360425","Name": "永修县","sort": 7}, 
                      {"Code": "360426","Name": "德安县","sort": 8}, 
                      {"Code": "360428","Name": "都昌县","sort": 9}, 
                      {"Code": "360429","Name": "湖口县","sort": 10}, 
                      {"Code": "360430","Name": "彭泽县","sort": 11}, 
                      {"Code": "360481","Name": "瑞昌市","sort": 12}, 
                      {"Code": "360482","Name": "共青城市","sort": 13}, 
                      {"Code": "360483","Name": "庐山市","sort": 14}
              ]},  
              {"Code": "360500","Name": "新余市","sort": 5,"level": [
                      {"Code": "360501","Name": "市辖区","sort": 1}, 
                      {"Code": "360502","Name": "渝水区","sort": 2}, 
                      {"Code": "360521","Name": "分宜县","sort": 3},
              ]},  
              {"Code": "360600","Name": "鹰潭市","sort": 6,"level": [
                      {"Code": "360601","Name": "市辖区","sort": 1}, 
                      {"Code": "360602","Name": "月湖区","sort": 2}, 
                      {"Code": "360622","Name": "余江县","sort": 3}, 
                      {"Code": "360681","Name": "贵溪市","sort": 4} 
              ]},  
              {"Code": "360700","Name": "赣州市","sort": 7,"level": [
                      {"Code": "360701","Name": "市辖区","sort": 1}, 
                      {"Code": "360702","Name": "章贡区","sort": 2}, 
                      {"Code": "360703","Name": "南康区","sort": 3},
                      {"Code": "360721","Name": "赣县","sort": 4},
                      {"Code": "360722","Name": "信丰县","sort": 5},
                      {"Code": "360723","Name": "大余县","sort": 6},
                      {"Code": "360724","Name": "上犹县","sort": 7},
                      {"Code": "360725","Name": "崇义县","sort": 8},
                      {"Code": "360726","Name": "安远县","sort": 9},
                      {"Code": "360727","Name": "龙南县","sort": 10},
                      {"Code": "360728","Name": "定南县","sort": 11},
                      {"Code": "360729","Name": "全南县","sort": 12},
                      {"Code": "360730","Name": "宁都县","sort": 13},
                      {"Code": "360731","Name": "于都县","sort": 14},
                      {"Code": "360732","Name": "兴国县","sort": 15},
                      {"Code": "360733","Name": "会昌县","sort": 16},
                      {"Code": "360734","Name": "寻乌县","sort": 17},
                      {"Code": "360735","Name": "石城县","sort": 18},
                      {"Code": "360781","Name": "瑞金市","sort": 19} 
              ]},  
              {"Code": "360800","Name": "吉安市","sort": 8,"level": [
                      {"Code": "360801","Name": "市辖区","sort": 1}, 
                      {"Code": "360802","Name": "吉州区","sort": 2}, 
                      {"Code": "360803","Name": "青原区","sort": 3}, 
                      {"Code": "360821","Name": "吉安县","sort": 4}, 
                      {"Code": "360822","Name": "吉水县","sort": 5}, 
                      {"Code": "360823","Name": "峡江县","sort": 6}, 
                      {"Code": "360824","Name": "新干县","sort": 7}, 
                      {"Code": "360825","Name": "永丰县","sort": 8}, 
                      {"Code": "360826","Name": "泰和县","sort": 9}, 
                      {"Code": "360827","Name": "遂川县","sort": 10}, 
                      {"Code": "360828","Name": "万安县","sort": 11}, 
                      {"Code": "360829","Name": "安福县","sort": 12}, 
                      {"Code": "360830","Name": "永新县","sort": 13}, 
                      {"Code": "360881","Name": "井冈山市","sort": 14} 
              ]},  
              {"Code": "360900","Name": "宜春市","sort": 9,"level": [
                      {"Code": "360901","Name": "市辖区","sort": 1}, 
                      {"Code": "360902","Name": "袁州区","sort": 2}, 
                      {"Code": "360921","Name": "奉新县","sort": 3}, 
                      {"Code": "360922","Name": "万载县","sort": 4}, 
                      {"Code": "360923","Name": "上高县","sort": 5}, 
                      {"Code": "360924","Name": "宜丰县","sort": 6}, 
                      {"Code": "360925","Name": "靖安县","sort": 7}, 
                      {"Code": "360926","Name": "铜鼓县","sort": 8}, 
                      {"Code": "360981","Name": "丰城市","sort": 9}, 
                      {"Code": "360982","Name": "樟树市","sort": 10}, 
                      {"Code": "360983","Name": "高安市","sort": 11}
              ]},  
              {"Code": "361000","Name": "抚州市","sort": 10,"level": [
                      {"Code": "361001","Name": "市辖区","sort": 1}, 
                      {"Code": "361002","Name": "临川区","sort": 2}, 
                      {"Code": "361021","Name": "南城县","sort": 3}, 
                      {"Code": "361022","Name": "黎川县","sort": 4}, 
                      {"Code": "361023","Name": "南丰县","sort": 5}, 
                      {"Code": "361024","Name": "崇仁县","sort": 6}, 
                      {"Code": "361025","Name": "乐安县","sort": 7}, 
                      {"Code": "361026","Name": "宜黄县","sort": 8}, 
                      {"Code": "361027","Name": "金溪县","sort": 9}, 
                      {"Code": "361028","Name": "资溪县","sort": 10}, 
                      {"Code": "361029","Name": "东乡县","sort": 11}, 
                      {"Code": "361030","Name": "广昌县","sort": 12} 
              ]},  
              {"Code": "361100","Name": "上饶市","sort": 11,"level": [
                      {"Code": "361101","Name": "市辖区","sort": 1}, 
                      {"Code": "361102","Name": "信州区","sort": 2}, 
                      {"Code": "361103","Name": "广丰区","sort": 3}, 
                      {"Code": "361121","Name": "上饶县","sort": 4}, 
                      {"Code": "361123","Name": "玉山县","sort": 5}, 
                      {"Code": "361124","Name": "铅山县","sort": 6}, 
                      {"Code": "361125","Name": "横峰县","sort": 7}, 
                      {"Code": "361126","Name": "弋阳县","sort": 8}, 
                      {"Code": "361127","Name": "余干县","sort": 9}, 
                      {"Code": "361128","Name": "鄱阳县","sort": 10}, 
                      {"Code": "361129","Name": "万年县","sort": 11},
                      {"Code": "361130","Name": "婺源县","sort": 12},
                      {"Code": "361181","Name": "德兴市","sort": 13}
              ]}
          ]
    },
    {         
          "Code": "370000",
          "Name": "山东省",
          "level": [
              {"Code": "370100","Name": "济南市","sort": 1,"level": [
                      {"Code": "370101","Name": "市辖区","sort": 1},
                      {"Code": "370102","Name": "历下区","sort": 2},
                      {"Code": "370103","Name": "市中区","sort": 3},
                      {"Code": "370104","Name": "槐荫区","sort": 4},
                      {"Code": "370105","Name": "天桥区","sort": 5},
                      {"Code": "370112","Name": "历城区","sort": 6},
                      {"Code": "370113","Name": "长清区","sort": 7},
                      {"Code": "370124","Name": "平阴县","sort": 8},
                      {"Code": "370125","Name": "济阳县","sort": 9},
                      {"Code": "370126","Name": "商河县","sort": 10},
                      {"Code": "370181","Name": "章丘市","sort": 11}
              ]},
              {"Code": "370200","Name": "青岛市","sort": 2,"level": [
                      {"Code": "370201","Name": "市辖区","sort": 1},
                      {"Code": "370202","Name": "市南区","sort": 2},
                      {"Code": "370203","Name": "市北区","sort": 3}, 
                      {"Code": "370211","Name": "黄岛区","sort": 4}, 
                      {"Code": "370212","Name": "崂山区","sort": 5}, 
                      {"Code": "370213","Name": "李沧区","sort": 6}, 
                      {"Code": "370214","Name": "城阳区","sort": 7}, 
                      {"Code": "370281","Name": "胶州市","sort": 8}, 
                      {"Code": "370282","Name": "即墨市","sort": 9}, 
                      {"Code": "370283","Name": "平度市","sort": 10}, 
                      {"Code": "370285","Name": "莱西市","sort": 11}
              ]},
              {"Code": "370300","Name": "淄博市","sort": 3,"level": [
                      {"Code": "370301","Name": "市辖区","sort": 1}, 
                      {"Code": "370302","Name": "淄川区","sort": 2}, 
                      {"Code": "370303","Name": "张店区","sort": 3}, 
                      {"Code": "370304","Name": "博山区","sort": 4}, 
                      {"Code": "370305","Name": "临淄区","sort": 5}, 
                      {"Code": "370306","Name": "周村区","sort": 6}, 
                      {"Code": "370321","Name": "桓台县","sort": 7}, 
                      {"Code": "370322","Name": "高青县","sort": 8}, 
                      {"Code": "370323","Name": "沂源县","sort": 9}
              ]},  
              {"Code": "370400","Name": "枣庄市","sort": 4,"level": [
                      {"Code": "370401","Name": "市辖区","sort": 1}, 
                      {"Code": "370402","Name": "市中区","sort": 2}, 
                      {"Code": "370403","Name": "薛城区","sort": 3}, 
                      {"Code": "370404","Name": "峄城区","sort": 4}, 
                      {"Code": "370405","Name": "台儿庄区","sort": 5}, 
                      {"Code": "370406","Name": "山亭区","sort": 6}, 
                      {"Code": "370481","Name": "滕州市","sort": 7} 

              ]},  
              {"Code": "370500","Name": "东营市","sort": 5,"level": [
                      {"Code": "370501","Name": "市辖区","sort": 1},
                      {"Code": "370502","Name": "东营区","sort": 2}, 
                      {"Code": "370503","Name": "河口区","sort": 3}, 
                      {"Code": "370505","Name": "垦利区","sort": 4}, 
                      {"Code": "370522","Name": "利津县","sort": 5}, 
                      {"Code": "370523","Name": "广饶县","sort": 6}
              ]},  
              {"Code": "370600","Name": "烟台市","sort": 6,"level": [
                      {"Code": "370601","Name": "市辖区","sort": 1}, 
                      {"Code": "370602","Name": "芝罘区","sort": 2}, 
                      {"Code": "370611","Name": "福山区","sort": 3}, 
                      {"Code": "370612","Name": "牟平区","sort": 4}, 
                      {"Code": "370613","Name": "莱山区","sort": 5}, 
                      {"Code": "370634","Name": "长岛县","sort": 6}, 
                      {"Code": "370681","Name": "龙口市","sort": 7}, 
                      {"Code": "370682","Name": "莱阳市","sort": 8}, 
                      {"Code": "370683","Name": "莱州市","sort": 9}, 
                      {"Code": "370684","Name": "蓬莱市","sort": 10}, 
                      {"Code": "370685","Name": "招远市","sort": 11}, 
                      {"Code": "370686","Name": "栖霞市","sort": 12}, 
                      {"Code": "370687","Name": "海阳市","sort": 13}
              ]},  
              {"Code": "370700","Name": "潍坊市","sort": 7,"level": [
                      {"Code": "370701","Name": "市辖区","sort": 1}, 
                      {"Code": "370702","Name": "潍城区","sort": 2}, 
                      {"Code": "370703","Name": "寒亭区","sort": 3}, 
                      {"Code": "370704","Name": "坊子区","sort": 4}, 
                      {"Code": "370705","Name": "奎文区","sort": 5},
                      {"Code": "370724","Name": "临朐县","sort": 6},
                      {"Code": "370725","Name": "昌乐县","sort": 7},
                      {"Code": "370781","Name": "青州市","sort": 8},
                      {"Code": "370782","Name": "诸城市","sort": 9},
                      {"Code": "370783","Name": "寿光市","sort": 10},
                      {"Code": "370784","Name": "安丘市","sort": 11},
                      {"Code": "370785","Name": "高密市","sort": 12},
                      {"Code": "370786","Name": "昌邑市","sort": 13}
              ]},  
              {"Code": "370800","Name": "济宁市","sort": 8,"level": [
                      {"Code": "370801","Name": "市辖区","sort": 1},
                      {"Code": "370811","Name": "任城区","sort": 2},
                      {"Code": "370812","Name": "兖州区","sort": 3},
                      {"Code": "370826","Name": "微山县","sort": 4},
                      {"Code": "370827","Name": "鱼台县","sort": 5},
                      {"Code": "370828","Name": "金乡县","sort": 6},
                      {"Code": "370829","Name": "嘉祥县","sort": 7},
                      {"Code": "370830","Name": "汶上县","sort": 8}, 
                      {"Code": "370831","Name": "泗水县","sort": 9}, 
                      {"Code": "370832","Name": "梁山县","sort": 10}, 
                      {"Code": "370881","Name": "曲阜市","sort": 11}, 
                      {"Code": "370883","Name": "邹城市","sort": 12}
              ]},  
              {"Code": "370900","Name": "泰安市","sort": 9,"level": [
                      {"Code": "370901","Name": "市辖区","sort": 1}, 
                      {"Code": "370902","Name": "泰山区","sort": 2}, 
                      {"Code": "370911","Name": "岱岳区","sort": 3}, 
                      {"Code": "370921","Name": "宁阳县","sort": 4}, 
                      {"Code": "370923","Name": "东平县","sort": 5}, 
                      {"Code": "370982","Name": "新泰市","sort": 6}, 
                      {"Code": "370983","Name": "肥城市","sort": 7}
              ]},  
              {"Code": "371000","Name": "威海市","sort": 10,"level": [
                      {"Code": "371001","Name": "市辖区","sort": 1}, 
                      {"Code": "371002","Name": "环翠区","sort": 2}, 
                      {"Code": "371003","Name": "文登区","sort": 3}, 
                      {"Code": "371082","Name": "荣成市","sort": 4}, 
                      {"Code": "371083","Name": "乳山市","sort": 5}
              ]},  
              {"Code": "371100","Name": "日照市","sort": 11,"level": [
                      {"Code": "371101","Name": "市辖区","sort": 1}, 
                      {"Code": "371102","Name": "东港区","sort": 2}, 
                      {"Code": "371103","Name": "岚山区","sort": 3}, 
                      {"Code": "371121","Name": "五莲县","sort": 4}, 
                      {"Code": "371122","Name": "莒县","sort": 5}
              ]},
              {"Code": "371200","Name": "莱芜市","sort": 12,"level": [
                      {"Code": "371201","Name": "市辖区","sort": 1}, 
                      {"Code": "371202","Name": "莱城区","sort": 2}, 
                      {"Code": "371203","Name": "钢城区","sort": 3}
              ]},
              {"Code": "371300","Name": "临沂市","sort": 13,"level": [
                      {"Code": "371301","Name": "市辖区","sort": 1}, 
                      {"Code": "371302","Name": "兰山区","sort": 2}, 
                      {"Code": "371311","Name": "罗庄区","sort": 3}, 
                      {"Code": "371312","Name": "河东区","sort": 4}, 
                      {"Code": "371321","Name": "沂南县","sort": 5}, 
                      {"Code": "371322","Name": "郯城县","sort": 6}, 
                      {"Code": "371323","Name": "沂水县","sort": 7}, 
                      {"Code": "371324","Name": "兰陵县","sort": 8}, 
                      {"Code": "371325","Name": "费县","sort": 9}, 
                      {"Code": "371326","Name": "平邑县","sort": 10}, 
                      {"Code": "371327","Name": "莒南县","sort": 11}, 
                      {"Code": "371328","Name": "蒙阴县","sort": 12}, 
                      {"Code": "371329","Name": "临沭县","sort": 13}
              ]}, 
              {"Code": "371400","Name": "德州市","sort": 14,"level": [
                      {"Code": "371401","Name": "市辖区","sort": 1}, 
                      {"Code": "371402","Name": "德城区","sort": 2}, 
                      {"Code": "371403","Name": "陵城区","sort": 3}, 
                      {"Code": "371422","Name": "宁津县","sort": 4}, 
                      {"Code": "371423","Name": "庆云县","sort": 5}, 
                      {"Code": "371424","Name": "临邑县","sort": 6}, 
                      {"Code": "371425","Name": "齐河县","sort": 7}, 
                      {"Code": "371426","Name": "平原县","sort": 8}, 
                      {"Code": "371427","Name": "夏津县","sort": 9}, 
                      {"Code": "371428","Name": "武城县","sort": 10}, 
                      {"Code": "371481","Name": "乐陵市","sort": 11},
                      {"Code": "371482","Name": "禹城市","sort": 12}
              ]}, 
              {"Code": "371500","Name": "聊城市","sort": 15,"level": [
                      {"Code": "371501","Name": "市辖区","sort": 1},
                      {"Code": "371502","Name": "东昌府区","sort": 2},
                      {"Code": "371521","Name": "阳谷县","sort": 3},
                      {"Code": "371522","Name": "莘县","sort": 4},
                      {"Code": "371523","Name": "茌平县","sort": 5},
                      {"Code": "371524","Name": "东阿县","sort": 6},
                      {"Code": "371525","Name": "冠县","sort": 7},
                      {"Code": "371526","Name": "高唐县","sort": 8},
                      {"Code": "371581","Name": "临清市","sort": 9}
              ]}, 
              {"Code": "371600","Name": "滨州市","sort": 16,"level": [
                      {"Code": "371601","Name": "市辖区","sort": 1},
                      {"Code": "371602","Name": "滨城区","sort": 2},
                      {"Code": "371603","Name": "沾化区","sort": 3},
                      {"Code": "371621","Name": "惠民县","sort": 4},
                      {"Code": "371622","Name": "阳信县","sort": 5},
                      {"Code": "371623","Name": "无棣县","sort": 6}, 
                      {"Code": "371625","Name": "博兴县","sort": 7}, 
                      {"Code": "371626","Name": "邹平县","sort": 8}
              ]},
              {"Code": "371700","Name": "荷泽市","sort": 17,"level": [
                      {"Code": "371701","Name": "市辖区","sort": 1}, 
                      {"Code": "371702","Name": "牡丹区","sort": 2}, 
                      {"Code": "371703","Name": "定陶区","sort": 3}, 
                      {"Code": "371721","Name": "曹县","sort": 4}, 
                      {"Code": "371722","Name": "单县","sort": 5}, 
                      {"Code": "371723","Name": "成武县","sort": 6}, 
                      {"Code": "371724","Name": "巨野县","sort": 7}, 
                      {"Code": "371725","Name": "郓城县","sort": 8}, 
                      {"Code": "371726","Name": "鄄城县","sort": 9}, 
                      {"Code": "371728","Name": "东明县","sort": 10}
              ]}         
          ]
    },
    {
          "Code": "410000",
          "Name": "河南省",
          "level": [
              {"Code": "410100","Name": "郑州市","sort": 1,"level": [
                      {"Code": "410101","Name": "市辖区","sort": 1}, 
                      {"Code": "410102","Name": "中原区","sort": 2}, 
                      {"Code": "410103","Name": "二七区","sort": 3}, 
                      {"Code": "410104","Name": "管城回族区","sort": 4}, 
                      {"Code": "410105","Name": "金水区","sort": 5}, 
                      {"Code": "410106","Name": "上街区","sort": 6}, 
                      {"Code": "410108","Name": "惠济区","sort": 7}, 
                      {"Code": "410122","Name": "中牟县","sort": 8}, 
                      {"Code": "410181","Name": "巩义市","sort": 9}, 
                      {"Code": "410182","Name": "荥阳市","sort": 10}, 
                      {"Code": "410183","Name": "新密市","sort": 11}, 
                      {"Code": "410184","Name": "新郑市","sort": 12}, 
                      {"Code": "410185","Name": "登封市","sort": 13}
              ]},
              {"Code": "410200","Name": "开封市","sort": 2,"level": [
                      {"Code": "410201","Name": "市辖区","sort": 1}, 
                      {"Code": "410202","Name": "龙亭区","sort": 2}, 
                      {"Code": "410203","Name": "顺河回族区","sort": 3}, 
                      {"Code": "410204","Name": "鼓楼区","sort": 4}, 
                      {"Code": "410205","Name": "禹王台区","sort": 5}, 
                      {"Code": "410211","Name": "金明区","sort": 6}, 
                      {"Code": "410212","Name": "祥符区","sort": 7}, 
                      {"Code": "410221","Name": "杞县","sort": 8}, 
                      {"Code": "410222","Name": "通许县","sort": 9}, 
                      {"Code": "410223","Name": "尉氏县","sort": 10}, 
                      {"Code": "410225","Name": "兰考县","sort": 11}
              ]},
              {"Code": "410300","Name": "洛阳市","sort": 3,"level": [
                      {"Code": "410301","Name": "市辖区","sort": 1}, 
                      {"Code": "410302","Name": "老城区","sort": 2}, 
                      {"Code": "410303","Name": "西工区","sort": 3}, 
                      {"Code": "410304","Name": "瀍河回族区","sort": 4},
                      {"Code": "410305","Name": "涧西区","sort": 5}, 
                      {"Code": "410306","Name": "吉利区","sort": 6}, 
                      {"Code": "410311","Name": "洛龙区","sort": 7},
                      {"Code": "410322","Name": "孟津县","sort": 8}, 
                      {"Code": "410323","Name": "新安县","sort": 9},
                      {"Code": "410324","Name": "栾川县","sort": 10},
                      {"Code": "410325","Name": "嵩县","sort": 11},
                      {"Code": "410326","Name": "汝阳县","sort": 12},
                      {"Code": "410327","Name": "宜阳县","sort": 13},
                      {"Code": "410328","Name": "洛宁县","sort": 14},
                      {"Code": "410329","Name": "伊川县","sort": 15},
                      {"Code": "410381","Name": "偃师市","sort": 16}
              ]},  
              {"Code": "410400","Name": "平顶山市","sort": 4,"level": [
                      {"Code": "410401","Name": "市辖区","sort": 1},
                      {"Code": "410402","Name": "新华区","sort": 2},
                      {"Code": "410403","Name": "卫东区","sort": 3},
                      {"Code": "410404","Name": "石龙区","sort": 4},
                      {"Code": "410411","Name": "湛河区","sort": 5},
                      {"Code": "410421","Name": "宝丰县","sort": 6},
                      {"Code": "410422","Name": "叶县","sort": 7},
                      {"Code": "410423","Name": "鲁山县","sort": 8},
                      {"Code": "410425","Name": "郏县","sort": 9},
                      {"Code": "410481","Name": "舞钢市","sort": 10},
                      {"Code": "410482","Name": "汝州市","sort": 11}
              ]},  
              {"Code": "410500","Name": "安阳市","sort": 5,"level": [
                      {"Code": "410501","Name": "市辖区","sort": 1}, 
                      {"Code": "410502","Name": "文峰区","sort": 2}, 
                      {"Code": "410503","Name": "北关区","sort": 3}, 
                      {"Code": "410505","Name": "殷都区","sort": 4}, 
                      {"Code": "410506","Name": "龙安区","sort": 5}, 
                      {"Code": "410522","Name": "安阳县","sort": 6}, 
                      {"Code": "410523","Name": "汤阴县","sort": 7}, 
                      {"Code": "410526","Name": "滑县","sort": 8}, 
                      {"Code": "410527","Name": "内黄县","sort": 9}, 
                      {"Code": "410581","Name": "林州市","sort": 10}
              ]},  
              {"Code": "410600","Name": "鹤壁市","sort": 6,"level": [
                      {"Code": "410601","Name": "市辖区","sort": 1}, 
                      {"Code": "410602","Name": "鹤山区","sort": 2}, 
                      {"Code": "410603","Name": "山城区","sort": 3}, 
                      {"Code": "410611","Name": "淇滨区","sort": 4}, 
                      {"Code": "410621","Name": "浚县","sort": 5}, 
                      {"Code": "410622","Name": "淇县","sort": 6}
              ]},  
              {"Code": "410700","Name": "新乡市","sort": 7,"level": [
                      {"Code": "410701","Name": "市辖区","sort": 1}, 
                      {"Code": "410702","Name": "红旗区","sort": 2}, 
                      {"Code": "410703","Name": "卫滨区","sort": 3}, 
                      {"Code": "410704","Name": "凤泉区","sort": 4}, 
                      {"Code": "410711","Name": "牧野区","sort": 5}, 
                      {"Code": "410721","Name": "新乡县","sort": 6}, 
                      {"Code": "410724","Name": "获嘉县","sort": 7}, 
                      {"Code": "410725","Name": "原阳县","sort": 8}, 
                      {"Code": "410726","Name": "延津县","sort": 9}, 
                      {"Code": "410727","Name": "封丘县","sort": 10}, 
                      {"Code": "410728","Name": "长垣县","sort": 11}, 
                      {"Code": "410781","Name": "卫辉市","sort": 12}, 
                      {"Code": "410782","Name": "辉县市","sort": 13}
              ]},  
              {"Code": "410800","Name": "焦作市","sort": 8,"level": [
                      {"Code": "410801","Name": "市辖区","sort": 1}, 
                      {"Code": "410802","Name": "解放区","sort": 2}, 
                      {"Code": "410803","Name": "中站区","sort": 3}, 
                      {"Code": "410804","Name": "马村区","sort": 4}, 
                      {"Code": "410811","Name": "山阳区","sort": 5}, 
                      {"Code": "410821","Name": "修武县","sort": 6}, 
                      {"Code": "410822","Name": "博爱县","sort": 7}, 
                      {"Code": "410823","Name": "武陟县","sort": 8}, 
                      {"Code": "410825","Name": "温县","sort": 9}, 
                      {"Code": "410882","Name": "沁阳市","sort": 10}, 
                      {"Code": "410883","Name": "孟州市","sort": 11}
              ]},  
              {"Code": "410900","Name": "濮阳市","sort": 9,"level": [
                      {"Code": "410901","Name": "市辖区","sort": 1}, 
                      {"Code": "410902","Name": "华龙区","sort": 2}, 
                      {"Code": "410922","Name": "清丰县","sort": 3}, 
                      {"Code": "410923","Name": "南乐县","sort": 4}, 
                      {"Code": "410926","Name": "范县","sort": 5}, 
                      {"Code": "410927","Name": "台前县","sort": 6}, 
                      {"Code": "410928","Name": "濮阳县","sort": 7}
              ]},  
              {"Code": "411000","Name": "许昌市","sort": 10,"level": [
                      {"Code": "411001","Name": "市辖区","sort": 1}, 
                      {"Code": "411002","Name": "魏都区","sort": 2},
                      {"Code": "411023","Name": "许昌县","sort": 3},
                      {"Code": "411024","Name": "鄢陵县","sort": 4},
                      {"Code": "411025","Name": "襄城县","sort": 5},
                      {"Code": "411081","Name": "禹州市","sort": 6},
                      {"Code": "411082","Name": "长葛市","sort": 7}
              ]},  
              {"Code": "411100","Name": "漯河市","sort": 11,"level": [
                      {"Code": "411101","Name": "市辖区","sort": 1},
                      {"Code": "411102","Name": "源汇区","sort": 2},
                      {"Code": "411103","Name": "郾城区","sort": 3},
                      {"Code": "411104","Name": "召陵区","sort": 4},
                      {"Code": "411121","Name": "舞阳县","sort": 5},
                      {"Code": "411122","Name": "临颍县","sort": 6}
              ]},
              {"Code": "411200","Name": "三门峡市","sort": 12,"level": [
                     {"Code": "411201","Name": "市辖区","sort": 1},
                      {"Code": "411202","Name": "湖滨区","sort": 2},
                      {"Code": "411203","Name": "陕州区","sort": 3},
                      {"Code": "411221","Name": "渑池县","sort": 4},
                      {"Code": "411224","Name": "卢氏县","sort": 5}, 
                      {"Code": "411281","Name": "义马市","sort": 6}, 
                      {"Code": "411282","Name": "灵宝市","sort": 7}
              ]},
              {"Code": "411300","Name": "南阳市","sort": 13,"level": [
                      {"Code": "411301","Name": "市辖区","sort": 1}, 
                      {"Code": "411302","Name": "宛城区","sort": 2}, 
                      {"Code": "411303","Name": "卧龙区","sort": 3}, 
                      {"Code": "411321","Name": "南召县","sort": 4}, 
                      {"Code": "411322","Name": "方城县","sort": 5}, 
                      {"Code": "411323","Name": "西峡县","sort": 6}, 
                      {"Code": "411324","Name": "镇平县","sort": 7}, 
                      {"Code": "411325","Name": "内乡县","sort": 8}, 
                      {"Code": "411326","Name": "淅川县","sort": 9}, 
                      {"Code": "411327","Name": "社旗县","sort": 10}, 
                      {"Code": "411328","Name": "唐河县","sort": 11}, 
                      {"Code": "411329","Name": "新野县","sort": 12}, 
                      {"Code": "411330","Name": "桐柏县","sort": 13}, 
                      {"Code": "411381","Name": "邓州市","sort": 14}
              ]}, 
              {"Code": "411400","Name": "商丘市","sort": 14,"level": [
                      {"Code": "411401","Name": "市辖区","sort": 1}, 
                      {"Code": "411402","Name": "梁园区","sort": 2}, 
                      {"Code": "411403","Name": "睢阳区","sort": 3}, 
                      {"Code": "411421","Name": "民权县","sort": 4}, 
                      {"Code": "411422","Name": "睢县","sort": 5}, 
                      {"Code": "411423","Name": "宁陵县","sort": 6}, 
                      {"Code": "411424","Name": "柘城县","sort": 7}, 
                      {"Code": "411425","Name": "虞城县","sort": 8}, 
                      {"Code": "411426","Name": "夏邑县","sort": 9}, 
                      {"Code": "411481","Name": "永城市","sort": 10}
              ]},
              {"Code": "411500","Name": "信阳市","sort": 15,"level": [
                      {"Code": "411501","Name": "市辖区","sort": 1}, 
                      {"Code": "411502","Name": "浉河区","sort": 2}, 
                      {"Code": "411503","Name": "平桥区","sort": 3}, 
                      {"Code": "411521","Name": "罗山县","sort": 4}, 
                      {"Code": "411522","Name": "光山县","sort": 5}, 
                      {"Code": "411523","Name": "新县","sort": 6}, 
                      {"Code": "411524","Name": "商城县","sort": 7}, 
                      {"Code": "411525","Name": "固始县","sort": 8}, 
                      {"Code": "411526","Name": "潢川县","sort": 9}, 
                      {"Code": "411527","Name": "淮滨县","sort": 10}, 
                      {"Code": "411528","Name": "息县","sort": 11}
              ]}, 
              {"Code": "411600","Name": "周口市","sort": 16,"level": [
                      {"Code": "411601","Name": "市辖区","sort": 1}, 
                      {"Code": "411602","Name": "川汇区","sort": 2}, 
                      {"Code": "411621","Name": "扶沟县","sort": 3}, 
                      {"Code": "411622","Name": "西华县","sort": 4}, 
                      {"Code": "411623","Name": "商水县","sort": 5}, 
                      {"Code": "411624","Name": "沈丘县","sort": 6}, 
                      {"Code": "411625","Name": "郸城县","sort": 7}, 
                      {"Code": "411626","Name": "淮阳县","sort": 8}, 
                      {"Code": "411627","Name": "太康县","sort": 9}, 
                      {"Code": "411628","Name": "鹿邑县","sort": 10}, 
                      {"Code": "411681","Name": "项城市","sort": 11}
              ]},
              {"Code": "411700","Name": "驻马店市","sort": 17,"level": [
                      {"Code": "411701","Name": "市辖区","sort": 1},
                      {"Code": "411702","Name": "驿城区","sort": 2},
                      {"Code": "411721","Name": "西平县","sort": 3},
                      {"Code": "411722","Name": "上蔡县","sort": 4},
                      {"Code": "411723","Name": "平舆县","sort": 5},
                      {"Code": "411724","Name": "正阳县","sort": 6},
                      {"Code": "411725","Name": "确山县","sort": 7},
                      {"Code": "411726","Name": "泌阳县","sort": 8},
                      {"Code": "411727","Name": "汝南县","sort": 9},
                      {"Code": "411728","Name": "遂平县","sort": 10},
                      {"Code": "411729","Name": "新蔡县","sort": 11}
              ]},
              {"Code": "419000","Name": "省直辖","sort": 18,"level": [
                      {"Code": "419001","Name": "济源市","sort": 1}
              ]}        
          ]
    },
    {
          "Code": "420000",
          "Name": "湖北省",
          "level": [
              {"Code": "420100","Name": "武汉市","sort": 1,"level": [
                      {"Code": "420101","Name": "市辖区","sort": 1},
                      {"Code": "420102","Name": "江岸区","sort": 2},
                      {"Code": "420103","Name": "江汉区","sort": 3},
                      {"Code": "420104","Name": "硚口区","sort": 4},      
                      {"Code": "420105","Name": "汉阳区","sort": 5},      
                      {"Code": "420106","Name": "武昌区","sort": 6},      
                      {"Code": "420107","Name": "青山区","sort": 7},      
                      {"Code": "420111","Name": "洪山区","sort": 8},      
                      {"Code": "420112","Name": "东西湖区","sort": 9},      
                      {"Code": "420113","Name": "汉南区","sort": 10},      
                      {"Code": "420114","Name": "蔡甸区","sort": 11},      
                      {"Code": "420115","Name": "江夏区","sort": 12},      
                      {"Code": "420116","Name": "黄陂区","sort": 13},      
                      {"Code": "420117","Name": "新洲区","sort": 14}
              ]},
              {"Code": "420200","Name": "黄石市","sort": 2,"level": [
                      {"Code": "420201","Name": "市辖区","sort": 1},      
                      {"Code": "420202","Name": "黄石港区","sort": 2},      
                      {"Code": "420203","Name": "西塞山区","sort": 3},      
                      {"Code": "420204","Name": "下陆区","sort": 4},      
                      {"Code": "420205","Name": "铁山区","sort": 5},      
                      {"Code": "420222","Name": "阳新县","sort": 6},      
                      {"Code": "420281","Name": "大冶市","sort": 7}
              ]},
              {"Code": "420300","Name": "十堰市","sort": 3,"level": [
                      {"Code": "420301","Name": "市辖区","sort": 1},      
                      {"Code": "420302","Name": "茅箭区","sort": 2},      
                      {"Code": "420303","Name": "张湾区","sort": 3},      
                      {"Code": "420304","Name": "郧阳区","sort": 4},      
                      {"Code": "420322","Name": "郧西县","sort": 5},      
                      {"Code": "420323","Name": "竹山县","sort": 6},      
                      {"Code": "420324","Name": "竹溪县","sort": 7},      
                      {"Code": "420325","Name": "房县","sort": 8},      
                      {"Code": "420381","Name": "丹江口市","sort": 9}
              ]},  
              {"Code": "420500","Name": "宜昌市","sort": 4,"level": [
                     {"Code": "420501","Name": "市辖区","sort": 1},      
                      {"Code": "420502","Name": "西陵区","sort": 2},      
                      {"Code": "420503","Name": "伍家岗区","sort": 3},      
                      {"Code": "420504","Name": "点军区","sort": 4},      
                      {"Code": "420505","Name": "猇亭区","sort": 5},      
                      {"Code": "420506","Name": "夷陵区","sort": 6},     
                      {"Code": "420525","Name": "远安县","sort": 7},     
                      {"Code": "420526","Name": "兴山县","sort": 8},     
                      {"Code": "420527","Name": "秭归县","sort": 9},     
                      {"Code": "420528","Name": "长阳土家族自治县","sort": 10},     
                      {"Code": "420529","Name": "五峰土家族自治县","sort": 11},     
                      {"Code": "420581","Name": "宜都市","sort": 12},     
                      {"Code": "420582","Name": "当阳市","sort": 13},     
                      {"Code": "420583","Name": "枝江市","sort": 14}
              ]},  
              {"Code": "420600","Name": "襄樊市","sort": 5,"level": [
                      {"Code": "420601","Name": "市辖区","sort": 1},     
                      {"Code": "420602","Name": "襄城区","sort": 2},     
                      {"Code": "420606","Name": "樊城区","sort": 3},     
                      {"Code": "420607","Name": "襄州区","sort": 4},     
                      {"Code": "420624","Name": "南漳县","sort": 5},     
                      {"Code": "420625","Name": "谷城县","sort": 6},     
                      {"Code": "420626","Name": "保康县","sort": 7},     
                      {"Code": "420682","Name": "老河口市","sort":8},     
                      {"Code": "420683","Name": "枣阳市","sort": 9},     
                      {"Code": "420684","Name": "宜城市","sort": 10}
              ]},  
              {"Code": "420700","Name": "鄂州市","sort": 6,"level": [
                      {"Code": "420701","Name": "市辖区","sort": 1},     
                      {"Code": "420702","Name": "梁子湖区","sort": 2},     
                      {"Code": "420703","Name": "华容区","sort": 3},     
                      {"Code": "420704","Name": "鄂城区","sort": 4}
              ]},  
              {"Code": "420800","Name": "荆门市","sort": 7,"level": [
                      {"Code": "420801","Name": "市辖区","sort": 1},     
                      {"Code": "420802","Name": "东宝区","sort": 2},     
                      {"Code": "420804","Name": "掇刀区","sort": 3},     
                      {"Code": "420821","Name": "京山县","sort": 4},     
                      {"Code": "420822","Name": "沙洋县","sort": 5},     
                      {"Code": "420881","Name": "钟祥市","sort": 6}     
                     
              ]},  
              {"Code": "420900","Name": "孝感","sort": 8,"level": [
                      {"Code": "420901","Name": "市辖区","sort": 1}, 
                      {"Code": "420902","Name": "孝南区","sort": 7},     
                      {"Code": "420921","Name": "孝昌县","sort": 8},     
                      {"Code": "420922","Name": "大悟县","sort": 1},     
                      {"Code": "420923","Name": "云梦县","sort": 2},     
                      {"Code": "420981","Name": "应城市","sort": 3},     
                      {"Code": "420982","Name": "安陆市","sort": 4},     
                      {"Code": "420984","Name": "汉川市","sort": 5}
              ]},  
              {"Code": "421000","Name": "荆州","sort": 9,"level": [
                      {"Code": "421001","Name": "市辖区","sort": 1},     
                      {"Code": "421002","Name": "沙市区","sort": 2},     
                      {"Code": "421003","Name": "荆州区","sort": 3},     
                      {"Code": "421022","Name": "公安县","sort": 4},     
                      {"Code": "421023","Name": "监利县","sort": 5},     
                      {"Code": "421024","Name": "江陵县","sort": 6},     
                      {"Code": "421081","Name": "石首市","sort": 7},     
                      {"Code": "421083","Name": "洪湖市","sort": 8},     
                      {"Code": "421087","Name": "松滋市","sort": 9}
              ]},  
              {"Code": "421100","Name": "黄冈市","sort": 10,"level": [
                      {"Code": "421101","Name": "市辖区","sort": 1},     
                      {"Code": "421102","Name": "黄州区","sort": 2},     
                      {"Code": "421121","Name": "团风县","sort": 3},     
                      {"Code": "421122","Name": "红安县","sort": 4},     
                      {"Code": "421123","Name": "罗田县","sort": 5},     
                      {"Code": "421124","Name": "英山县","sort": 6},     
                      {"Code": "421125","Name": "浠水县","sort": 7},     
                      {"Code": "421126","Name": "蕲春县","sort": 8},     
                      {"Code": "421127","Name": "黄梅县","sort": 9},     
                      {"Code": "421181","Name": "麻城市","sort": 10},     
                      {"Code": "421182","Name": "武穴市","sort": 11}
              ]},  
              {"Code": "421200","Name": "咸宁市","sort": 11,"level": [
                      {"Code": "421201","Name": "市辖区","sort": 1},     
                      {"Code": "421202","Name": "咸安区","sort": 2},     
                      {"Code": "421221","Name": "嘉鱼县","sort": 3},     
                      {"Code": "421222","Name": "通城县","sort": 4},     
                      {"Code": "421223","Name": "崇阳县","sort": 5},     
                      {"Code": "421224","Name": "通山县","sort": 6},     
                      {"Code": "421281","Name": "赤壁市","sort": 7}
              ]},
              {"Code": "421300","Name": "随州市","sort": 12,"level": [
                      {"Code": "421301","Name": "市辖区","sort": 1},    
                      {"Code": "421303","Name": "曾都区","sort": 2},    
                      {"Code": "421321","Name": "随县","sort": 3},    
                      {"Code": "421381","Name": "广水市","sort": 4}   
              ]},
              {"Code": "422800","Name": "恩施土家族苗族自治州","sort": 13,"level": [
                      {"Code": "422801","Name": "恩施市","sort": 1},    
                      {"Code": "422802","Name": "利川市","sort": 2},    
                      {"Code": "422822","Name": "建始县","sort": 3},    
                      {"Code": "422823","Name": "巴东县","sort": 4},    
                      {"Code": "422825","Name": "宣恩县","sort": 5},    
                      {"Code": "422826","Name": "咸丰县","sort": 6},    
                      {"Code": "422827","Name": "来凤县","sort": 7},    
                      {"Code": "422828","Name": "鹤峰县","sort": 8}
              ]},
              {"Code": "429000","Name": "省直辖","sort": 14,"level": [
                      {"Code": "429004","Name": "仙桃市","sort": 1},    
                      {"Code": "429005","Name": "潜江市","sort": 2},    
                      {"Code": "429006","Name": "天门市","sort": 3},    
                      {"Code": "429021","Name": "神农架林区","sort": 4}
              ]} 
          ]
    },
    {
          "Code": "430000",
          "Name": "湖南省",
          "level": [
              {"Code": "430100","Name": "长沙","sort": 1,"level": [
                      {"Code": "430101","Name": "市辖区","sort": 1},    
                      {"Code": "430102","Name": "芙蓉区","sort": 2},    
                      {"Code": "430103","Name": "天心区","sort": 3},    
                      {"Code": "430104","Name": "岳麓区","sort": 4},    
                      {"Code": "430105","Name": "开福区","sort": 5},    
                      {"Code": "430111","Name": "雨花区","sort": 6},    
                      {"Code": "430112","Name": "望城区","sort": 7},    
                      {"Code": "430121","Name": "长沙县","sort": 8},    
                      {"Code": "430124","Name": "宁乡县","sort": 9},    
                      {"Code": "430181","Name": "浏阳市","sort": 10}
              ]},
              {"Code": "430200","Name": "株洲","sort": 2,"level": [
                      {"Code": "430201","Name": "市辖区","sort": 1},    
                      {"Code": "430202","Name": "荷塘区","sort": 2},    
                      {"Code": "430203","Name": "芦淞区","sort": 3},    
                      {"Code": "430204","Name": "石峰区","sort": 4},    
                      {"Code": "430211","Name": "天元区","sort": 5},    
                      {"Code": "430221","Name": "株洲县","sort": 6},    
                      {"Code": "430223","Name": "攸县","sort": 7},    
                      {"Code": "430224","Name": "茶陵县","sort": 8},    
                      {"Code": "430225","Name": "炎陵县","sort": 9},    
                      {"Code": "430281","Name": "醴陵市","sort": 10}
              ]},
              {"Code": "430300","Name": "湘潭","sort": 3,"level": [
                      {"Code": "430301","Name": "市辖区","sort": 1},    
                      {"Code": "430302","Name": "雨湖区","sort": 2},    
                      {"Code": "430304","Name": "岳塘区","sort": 3},    
                      {"Code": "430321","Name": "湘潭县","sort": 4},    
                      {"Code": "430381","Name": "湘乡市","sort": 5},    
                      {"Code": "430382","Name": "韶山市","sort": 6}
              ]},  
              {"Code": "430400","Name": "衡阳","sort": 4,"level": [
                      {"Code": "430401","Name": "市辖区","sort": 1},    
                      {"Code": "430405","Name": "珠晖区","sort": 2},    
                      {"Code": "430406","Name": "雁峰区","sort": 3},    
                      {"Code": "430407","Name": "石鼓区","sort": 4},    
                      {"Code": "430408","Name": "蒸湘区","sort": 5},    
                      {"Code": "430412","Name": "南岳区","sort": 6},    
                      {"Code": "430421","Name": "衡阳县","sort": 7},    
                      {"Code": "430422","Name": "衡南县","sort": 8},    
                      {"Code": "430423","Name": "衡山县","sort": 9},    
                      {"Code": "430424","Name": "衡东县","sort": 10},    
                      {"Code": "430426","Name": "祁东县","sort": 11},    
                      {"Code": "430481","Name": "耒阳市","sort": 12},    
                      {"Code": "430482","Name": "常宁市","sort": 13}
              ]},  
              {"Code": "430500","Name": "邵阳","sort": 5,"level": [
                      {"Code": "430501","Name": "市辖区","sort": 1},    
                      {"Code": "430502","Name": "双清区","sort": 2},    
                      {"Code": "430503","Name": "大祥区","sort": 3},    
                      {"Code": "430511","Name": "北塔区","sort": 4},    
                      {"Code": "430521","Name": "邵东县","sort": 5},    
                      {"Code": "430522","Name": "新邵县","sort": 6},    
                      {"Code": "430523","Name": "邵阳县","sort": 7},    
                      {"Code": "430524","Name": "隆回县","sort": 8},    
                      {"Code": "430525","Name": "洞口县","sort": 9},    
                      {"Code": "430527","Name": "绥宁县","sort": 10},   
                      {"Code": "430528","Name": "新宁县","sort": 11},   
                      {"Code": "430529","Name": "城步苗族自治县","sort": 12},   
                      {"Code": "430581","Name": "武冈市","sort": 13}
              ]},  
              {"Code": "430600","Name": "岳阳","sort": 6,"level": [
                      {"Code": "430601","Name": "市辖区","sort": 1},   
                      {"Code": "430602","Name": "岳阳楼区","sort": 2},   
                      {"Code": "430603","Name": "云溪区","sort": 3},   
                      {"Code": "430611","Name": "君山区","sort": 4},   
                      {"Code": "430621","Name": "岳阳县","sort": 5},   
                      {"Code": "430623","Name": "华容县","sort": 6},   
                      {"Code": "430624","Name": "湘阴县","sort": 7},   
                      {"Code": "430626","Name": "平江县","sort": 8},   
                      {"Code": "430681","Name": "汨罗市","sort": 9},   
                      {"Code": "430682","Name": "临湘市","sort": 10}
              ]},  
              {"Code": "430700","Name": "常德","sort": 7,"level": [
                      {"Code": "430701","Name": "市辖区","sort": 1},   
                      {"Code": "430702","Name": "武陵区","sort": 2},   
                      {"Code": "430703","Name": "鼎城区","sort": 3},   
                      {"Code": "430721","Name": "安乡县","sort": 4},   
                      {"Code": "430722","Name": "汉寿县","sort": 5},   
                      {"Code": "430723","Name": "澧县","sort": 6},   
                      {"Code": "430724","Name": "临澧县","sort": 7},   
                      {"Code": "430725","Name": "桃源县","sort": 8},   
                      {"Code": "430726","Name": "石门县","sort": 9},   
                      {"Code": "430781","Name": "津市市","sort": 10}
              ]},  
              {"Code": "430800","Name": "张家界","sort": 8,"level": [
                      {"Code": "430801","Name": "市辖区","sort": 1},   
                      {"Code": "430802","Name": "永定区","sort": 2},   
                      {"Code": "430811","Name": "武陵源区","sort": 3},   
                      {"Code": "430821","Name": "慈利县","sort": 4},   
                      {"Code": "430822","Name": "桑植县","sort": 5}
              ]},  
              {"Code": "430900","Name": "益阳","sort": 9,"level": [
                      {"Code": "430901","Name": "市辖区","sort": 1},   
                      {"Code": "430902","Name": "资阳区","sort": 2},   
                      {"Code": "430903","Name": "赫山区","sort": 3},   
                      {"Code": "430921","Name": "南县","sort": 4},   
                      {"Code": "430922","Name": "桃江县","sort": 5},   
                      {"Code": "430923","Name": "安化县","sort": 6},   
                      {"Code": "430981","Name": "沅江市","sort": 7}
              ]},  
              {"Code": "431000","Name": "郴州","sort": 10,"level": [
                      {"Code": "431001","Name": "市辖区","sort": 1},   
                      {"Code": "431002","Name": "北湖区","sort": 2},   
                      {"Code": "431003","Name": "苏仙区","sort": 3},   
                      {"Code": "431021","Name": "桂阳县","sort": 4},   
                      {"Code": "431022","Name": "宜章县","sort": 5},   
                      {"Code": "431023","Name": "永兴县","sort": 6},   
                      {"Code": "431024","Name": "嘉禾县","sort": 7},   
                      {"Code": "431025","Name": "临武县","sort": 8},   
                      {"Code": "431026","Name": "汝城县","sort": 9},   
                      {"Code": "431027","Name": "桂东县","sort": 10},   
                      {"Code": "431028","Name": "安仁县","sort": 11},   
                      {"Code": "431081","Name": "资兴市","sort": 12}
              ]},  
              {"Code": "431100","Name": "永州","sort": 11,"level": [
                      {"Code": "431101","Name": "市辖区","sort": 1},   
                      {"Code": "431102","Name": "零陵区","sort": 2},   
                      {"Code": "431103","Name": "冷水滩区","sort": 3},   
                      {"Code": "431121","Name": "祁阳县","sort": 4},   
                      {"Code": "431122","Name": "东安县","sort": 5},   
                      {"Code": "431123","Name": "双牌县","sort": 6},   
                      {"Code": "431124","Name": "道县","sort": 7},   
                      {"Code": "431125","Name": "江永县","sort": 8},   
                      {"Code": "431126","Name": "宁远县","sort": 9},   
                      {"Code": "431127","Name": "蓝山县","sort": 10},   
                      {"Code": "431128","Name": "新田县","sort": 11},   
                      {"Code": "431129","Name": "江华瑶族自治县","sort": 12}
              ]},
              {"Code": "431200","Name": "怀化","sort": 12,"level": [
                      {"Code": "431201","Name": "市辖区","sort": 1},   
                      {"Code": "431202","Name": "鹤城区","sort": 2},   
                      {"Code": "431221","Name": "中方县","sort": 3},   
                      {"Code": "431222","Name": "沅陵县","sort": 4},   
                      {"Code": "431223","Name": "辰溪县","sort": 5},  
                      {"Code": "431224","Name": "溆浦县","sort": 6},  
                      {"Code": "431225","Name": "会同县","sort": 7},  
                      {"Code": "431226","Name": "麻阳苗族自治县","sort": 8},  
                      {"Code": "431227","Name": "新晃侗族自治县","sort": 9},  
                      {"Code": "431228","Name": "芷江侗族自治县","sort": 10},  
                      {"Code": "431229","Name": "靖州苗族侗族自治县","sort": 11},  
                      {"Code": "431230","Name": "通道侗族自治县","sort": 12},  
                      {"Code": "431281","Name": "洪江市","sort": 13}
              ]},
              {"Code": "431300","Name": "娄底","sort": 13,"level": [
                      {"Code": "431301","Name": "市辖区","sort": 1},  
                      {"Code": "431302","Name": "娄星区","sort": 2},  
                      {"Code": "431321","Name": "双峰县","sort": 3},  
                      {"Code": "431322","Name": "新化县","sort": 4},  
                      {"Code": "431381","Name": "冷水江市","sort": 5},  
                      {"Code": "431382","Name": "涟源市","sort": 6}
              ]}, 
              {"Code": "433100","Name": "湘西土家族苗族自治州","sort": 14,"level": [
                      {"Code": "433101","Name": "吉首市","sort": 1},  
                      {"Code": "433122","Name": "泸溪县","sort": 2},  
                      {"Code": "433123","Name": "凤凰县","sort": 3},  
                      {"Code": "433124","Name": "花垣县","sort": 4},  
                      {"Code": "433125","Name": "保靖县","sort": 5},  
                      {"Code": "433126","Name": "古丈县","sort": 6},  
                      {"Code": "433127","Name": "永顺县","sort": 7},  
                      {"Code": "433130","Name": "龙山县","sort": 8}
              ]}      
          ]
    },
    {
          "Code": "440000",
          "Name": "广东省",
          "level": [ 
              {"Code": "440100","Name": "广州市","sort": 1,"level": [
                      {"Code": "440101","Name": "市辖区","sort": 1},  
                      {"Code": "440103","Name": "荔湾区","sort": 2},  
                      {"Code": "440104","Name": "越秀区","sort": 3},  
                      {"Code": "440105","Name": "海珠区","sort": 4},  
                      {"Code": "440106","Name": "天河区","sort": 5},  
                      {"Code": "440111","Name": "白云区","sort": 6},  
                      {"Code": "440112","Name": "黄埔区","sort": 7},  
                      {"Code": "440113","Name": "番禺区","sort": 8},  
                      {"Code": "440114","Name": "花都区","sort": 9},  
                      {"Code": "440115","Name": "南沙区","sort": 10},  
                      {"Code": "440117","Name": "从化区","sort": 11},  
                      {"Code": "440118","Name": "增城区","sort": 12}
              ]},
              {"Code": "440200","Name": "韶关市","sort": 2,"level": [
                      {"Code": "440201","Name": "市辖区","sort": 1},  
                      {"Code": "440203","Name": "武江区","sort": 2},  
                      {"Code": "440204","Name": "浈江区","sort": 3},  
                      {"Code": "440205","Name": "曲江区","sort": 4},  
                      {"Code": "440222","Name": "始兴县","sort": 5},  
                      {"Code": "440224","Name": "仁化县","sort": 6},  
                      {"Code": "440229","Name": "翁源县","sort": 7},  
                      {"Code": "440232","Name": "乳源瑶族自治县","sort": 8},  
                      {"Code": "440233","Name": "新丰县","sort": 9},  
                      {"Code": "440281","Name": "乐昌市","sort": 10},  
                      {"Code": "440282","Name": "南雄市","sort": 11}
              ]},
              {"Code": "440300","Name": "深圳市","sort": 3,"level": [
                      {"Code": "440301","Name": "市辖区","sort": 1},  
                      {"Code": "440303","Name": "罗湖区","sort": 2},  
                      {"Code": "440304","Name": "福田区","sort": 3},  
                      {"Code": "440305","Name": "南山区","sort": 4},  
                      {"Code": "440306","Name": "宝安区","sort": 5},  
                      {"Code": "440307","Name": "龙岗区","sort": 6},  
                      {"Code": "440308","Name": "盐田区","sort": 7}
              ]},  
              {"Code": "440400","Name": "珠海市","sort": 4,"level": [
                      {"Code": "440401","Name": "市辖区","sort": 1},  
                      {"Code": "440402","Name": "香洲区","sort": 2},  
                      {"Code": "440403","Name": "斗门区","sort": 3},  
                      {"Code": "440404","Name": "金湾区","sort": 4}
              ]},  
              {"Code": "440500","Name": "汕头市","sort": 5,"level": [
                      {"Code": "440501","Name": "市辖区","sort": 1},  
                      {"Code": "440507","Name": "龙湖区","sort": 2},  
                      {"Code": "440511","Name": "金平区","sort": 3},  
                      {"Code": "440512","Name": "濠江区","sort": 4},  
                      {"Code": "440513","Name": "潮阳区","sort": 5},  
                      {"Code": "440514","Name": "潮南区","sort": 6},  
                      {"Code": "440515","Name": "澄海区","sort": 7},  
                      {"Code": "440523","Name": "南澳县","sort": 8}
              ]},  
              {"Code": "440600","Name": "佛山市","sort": 6,"level": [
                      {"Code": "440601","Name": "市辖区","sort": 1}, 
                      {"Code": "440604","Name": "禅城区","sort": 2}, 
                      {"Code": "440605","Name": "南海区","sort": 3}, 
                      {"Code": "440606","Name": "顺德区","sort": 4}, 
                      {"Code": "440607","Name": "三水区","sort": 5}, 
                      {"Code": "440608","Name": "高明区","sort": 6}
              ]},  
              {"Code": "440700","Name": "江门","sort": 7,"level": [
                      {"Code": "440701","Name": "市辖区","sort": 1}, 
                      {"Code": "440703","Name": "蓬江区","sort": 2}, 
                      {"Code": "440704","Name": "江海区","sort": 3}, 
                      {"Code": "440705","Name": "新会区","sort": 4}, 
                      {"Code": "440781","Name": "台山市","sort": 5}, 
                      {"Code": "440783","Name": "开平市","sort": 6}, 
                      {"Code": "440784","Name": "鹤山市","sort": 7}, 
                      {"Code": "440785","Name": "恩平市","sort": 8}
              ]},  
              {"Code": "440800","Name": "湛江","sort": 8,"level": [
                      {"Code": "440801","Name": "市辖区","sort": 1}, 
                      {"Code": "440802","Name": "赤坎区","sort": 2}, 
                      {"Code": "440803","Name": "霞山区","sort": 3}, 
                      {"Code": "440804","Name": "坡头区","sort": 4}, 
                      {"Code": "440811","Name": "麻章区","sort": 5}, 
                      {"Code": "440823","Name": "遂溪县","sort": 6}, 
                      {"Code": "440825","Name": "徐闻县","sort": 7}, 
                      {"Code": "440881","Name": "廉江市","sort": 8}, 
                      {"Code": "440882","Name": "雷州市","sort": 9}, 
                      {"Code": "440883","Name": "吴川市","sort": 10}
              ]},  
              {"Code": "440900","Name": "茂名","sort": 9,"level": [
                      {"Code": "440901","Name": "市辖区","sort": 1}, 
                      {"Code": "440902","Name": "茂南区","sort": 2}, 
                      {"Code": "440904","Name": "电白区","sort": 3}, 
                      {"Code": "440981","Name": "高州市","sort": 4}, 
                      {"Code": "440982","Name": "化州市","sort": 5}, 
                      {"Code": "440983","Name": "信宜市","sort": 6}
              ]},  
              {"Code": "441200","Name": "肇庆","sort": 10,"level": [
                      {"Code": "441201","Name": "市辖区","sort": 1}, 
                      {"Code": "441202","Name": "端州区","sort": 2}, 
                      {"Code": "441203","Name": "鼎湖区","sort": 3}, 
                      {"Code": "441204","Name": "高要区","sort": 4}, 
                      {"Code": "441223","Name": "广宁县","sort": 5}, 
                      {"Code": "441224","Name": "怀集县","sort": 6}, 
                      {"Code": "441225","Name": "封开县","sort": 7}, 
                      {"Code": "441226","Name": "德庆县","sort": 8}, 
                      {"Code": "441284","Name": "四会市","sort": 9}
              ]},  
              {"Code": "441300","Name": "惠州","sort": 11,"level": [
                      {"Code": "441301","Name": "市辖区","sort": 1}, 
                      {"Code": "441302","Name": "惠城区","sort": 2}, 
                      {"Code": "441303","Name": "惠阳区","sort": 3}, 
                      {"Code": "441322","Name": "博罗县","sort": 4}, 
                      {"Code": "441323","Name": "惠东县","sort": 5}, 
                      {"Code": "441324","Name": "龙门县","sort": 6}
              ]},
              {"Code": "441400","Name": "梅州","sort": 12,"level": [
                      {"Code": "441401","Name": "市辖区","sort": 1}, 
                      {"Code": "441402","Name": "梅江区","sort": 2}, 
                      {"Code": "441403","Name": "梅县区","sort": 3}, 
                      {"Code": "441422","Name": "大埔县","sort": 4}, 
                      {"Code": "441423","Name": "丰顺县","sort": 5}, 
                      {"Code": "441424","Name": "五华县","sort": 6}, 
                      {"Code": "441426","Name": "平远县","sort": 7}, 
                      {"Code": "441427","Name": "蕉岭县","sort": 8}, 
                      {"Code": "441481","Name": "兴宁市","sort": 9}
              
              ]},
              {"Code": "441500","Name": "汕尾","sort": 13,"level": [
                      {"Code": "441501","Name": "市辖区","sort": 1}, 
                      {"Code": "441502","Name": "城区","sort": 2}, 
                      {"Code": "441521","Name": "海丰县","sort": 3}, 
                      {"Code": "441523","Name": "陆河县","sort": 4}, 
                      {"Code": "441581","Name": "陆丰市","sort": 5}
              ]}, 
              {"Code": "441600","Name": "河源","sort": 14,"level": [
                      {"Code": "441601","Name": "市辖区","sort": 1}, 
                      {"Code": "441602","Name": "源城区","sort": 2}, 
                      {"Code": "441621","Name": "紫金县","sort": 3}, 
                      {"Code": "441622","Name": "龙川县","sort": 4}, 
                      {"Code": "441623","Name": "连平县","sort": 5},
                      {"Code": "441624","Name": "和平县","sort": 6},
                      {"Code": "441625","Name": "东源县","sort": 7}
              ]},
              {"Code": "441700","Name": "阳江","sort": 15,"level": [
                      {"Code": "441701","Name": "市辖区","sort": 1},
                      {"Code": "441702","Name": "江城区","sort": 2},
                      {"Code": "441704","Name": "阳东区","sort": 3},
                      {"Code": "441721","Name": "阳西县","sort": 4},
                      {"Code": "441781","Name": "阳春市","sort": 5}
              ]},  
              {"Code": "441800","Name": "清远市","sort": 16,"level": [
                      {"Code": "441801","Name": "市辖区","sort": 1},
                      {"Code": "441802","Name": "清城区","sort": 2},
                      {"Code": "441803","Name": "清新区","sort": 3},
                      {"Code": "441821","Name": "佛冈县","sort": 4},
                      {"Code": "441823","Name": "阳山县","sort": 5},
                      {"Code": "441825","Name": "连山壮族瑶族自治县","sort": 6},
                      {"Code": "441826","Name": "连南瑶族自治县","sort": 7},
                      {"Code": "441881","Name": "英德市","sort": 8},
                      {"Code": "441882","Name": "连州市","sort": 9}
              ]},  
              {"Code": "441900","Name": "东莞市","sort": 17,"level": [
              ]},
              {"Code": "442000","Name": "中山市","sort": 18,"level": [
              ]},
              {"Code": "445100","Name": "潮州市","sort": 19,"level": [
                      {"Code": "445101","Name": "市辖区","sort": 1},      
                      {"Code": "445102","Name": "湘桥区","sort": 2},      
                      {"Code": "445103","Name": "潮安区","sort": 3},      
                      {"Code": "445122","Name": "饶平县","sort": 4}
              ]}, 
              {"Code": "445200","Name": "揭阳市","sort": 20,"level": [
                      {"Code": "445201","Name": "市辖区","sort": 1},      
                      {"Code": "445202","Name": "榕城区","sort": 2},      
                      {"Code": "445203","Name": "揭东区","sort": 3},      
                      {"Code": "445222","Name": "揭西县","sort": 4},      
                      {"Code": "445224","Name": "惠来县","sort": 5},      
                      {"Code": "445281","Name": "普宁市","sort": 6}
              ]},
              {"Code": "445300","Name": "云浮市","sort": 21,"level": [
                      {"Code": "445301","Name": "市辖区","sort": 1},      
                      {"Code": "445302","Name": "云城区","sort": 2},      
                      {"Code": "445303","Name": "云安区","sort": 3},      
                      {"Code": "445321","Name": "新兴县","sort": 4},      
                      {"Code": "445322","Name": "郁南县","sort": 5},      
                      {"Code": "445381","Name": "罗定市","sort": 6}
              ]}     
          ]
    },
    {
          "Code": "450000",
          "Name": "广西壮族自治区",
          "level": [
              {"Code": "450100","Name": "南宁市","sort": 1,"level": [
                      {"Code": "450101","Name": "市辖区","sort": 1},      
                      {"Code": "450102","Name": "兴宁区","sort": 2},      
                      {"Code": "450103","Name": "青秀区","sort": 3},      
                      {"Code": "450105","Name": "江南区","sort": 4},      
                      {"Code": "450107","Name": "西乡塘区","sort": 5},      
                      {"Code": "450108","Name": "良庆区","sort": 6},      
                      {"Code": "450109","Name": "邕宁区","sort": 7},      
                      {"Code": "450110","Name": "武鸣区","sort": 8},      
                      {"Code": "450123","Name": "隆安县","sort": 9},      
                      {"Code": "450124","Name": "马山县","sort": 10},      
                      {"Code": "450125","Name": "上林县","sort": 11},      
                      {"Code": "450126","Name": "宾阳县","sort": 12},      
                      {"Code": "450127","Name": "横县","sort": 13}
              ]},
              {"Code": "450200","Name": "柳州市","sort": 2,"level": [
                      {"Code": "450201","Name": "市辖区","sort": 1},      
                      {"Code": "450202","Name": "城中区","sort": 2},      
                      {"Code": "450203","Name": "鱼峰区","sort": 3},     
                      {"Code": "450204","Name": "柳南区","sort": 4},     
                      {"Code": "450205","Name": "柳北区","sort": 5},     
                      {"Code": "450206","Name": "柳江区","sort": 6},     
                      {"Code": "450222","Name": "柳城县","sort": 7},     
                      {"Code": "450223","Name": "鹿寨县","sort": 8},     
                      {"Code": "450224","Name": "融安县","sort": 9},     
                      {"Code": "450225","Name": "融水苗族自治县","sort": 10},     
                      {"Code": "450226","Name": "三江侗族自治县","sort": 11}
              ]},
              {"Code": "450300","Name": "桂林市","sort": 3,"level": [
                      {"Code": "450301","Name": "市辖区","sort": 1},     
                      {"Code": "450302","Name": "秀峰区","sort": 2},     
                      {"Code": "450303","Name": "叠彩区","sort": 3},     
                      {"Code": "450304","Name": "象山区","sort": 4},     
                      {"Code": "450305","Name": "七星区","sort": 5},     
                      {"Code": "450311","Name": "雁山区","sort": 6},     
                      {"Code": "450312","Name": "临桂区","sort": 7},     
                      {"Code": "450321","Name": "阳朔县","sort": 8},     
                      {"Code": "450323","Name": "灵川县","sort": 9},     
                      {"Code": "450324","Name": "全州县","sort": 10},     
                      {"Code": "450325","Name": "兴安县","sort": 11},     
                      {"Code": "450326","Name": "永福县","sort": 12},     
                      {"Code": "450327","Name": "灌阳县","sort": 13},     
                      {"Code": "450328","Name": "龙胜各族自治县","sort": 14},     
                      {"Code": "450329","Name": "资源县","sort": 15},     
                      {"Code": "450330","Name": "平乐县","sort": 16},     
                      {"Code": "450331","Name": "荔浦县","sort": 17},     
                      {"Code": "450332","Name": "恭城瑶族自治县         ","sort": 3}
              ]},  
              {"Code": "450400","Name": "梧州市","sort": 4,"level": [
                      {"Code": "450401","Name": "市辖区","sort": 1},     
                      {"Code": "450403","Name": "万秀区","sort": 2},     
                      {"Code": "450405","Name": "长洲区","sort": 3},     
                      {"Code": "450406","Name": "龙圩区","sort": 4},     
                      {"Code": "450421","Name": "苍梧县","sort": 5},     
                      {"Code": "450422","Name": "藤县","sort": 6},     
                      {"Code": "450423","Name": "蒙山县","sort": 7},     
                      {"Code": "450481","Name": "岑溪市","sort": 8}
              ]},  
              {"Code": "450500","Name": "北海市","sort": 5,"level": [
                      {"Code": "450501","Name": "市辖区","sort": 1},     
                      {"Code": "450502","Name": "海城区","sort": 2},     
                      {"Code": "450503","Name": "银海区","sort": 3},     
                      {"Code": "450512","Name": "铁山港区","sort": 4},     
                      {"Code": "450521","Name": "合浦县","sort": 5}
              ]},  
              {"Code": "450600","Name": "防城港市","sort": 6,"level": [
                      {"Code": "450601","Name": "市辖区","sort": 1},     
                      {"Code": "450602","Name": "港口区","sort": 2},     
                      {"Code": "450603","Name": "防城区","sort": 3},     
                      {"Code": "450621","Name": "上思县","sort": 4},     
                      {"Code": "450681","Name": "东兴市","sort": 5}
              ]},  
              {"Code": "450700","Name": "钦州市","sort": 7,"level": [
                      {"Code": "450701","Name": "市辖区","sort": 1},  
                      {"Code": "450702","Name": "钦南区","sort": 2},  
                      {"Code": "450703","Name": "钦北区","sort": 3},  
                      {"Code": "450721","Name": "灵山县","sort": 4},  
                      {"Code": "450722","Name": "浦北县","sort": 5}  

              ]},  
              {"Code": "450800","Name": "贵港市","sort": 8,"level": [
                      {"Code": "450801","Name": "市辖区","sort": 1},     
                      {"Code": "450802","Name": "港北区","sort": 2},     
                      {"Code": "450803","Name": "港南区","sort": 3},     
                      {"Code": "450804","Name": "覃塘区","sort": 4},     
                      {"Code": "450821","Name": "平南县","sort": 5},     
                      {"Code": "450881","Name": "桂平市","sort": 6},     
              ]},  
              {"Code": "450900","Name": "玉林市","sort": 9,"level": [
                      {"Code": "450901","Name": "市辖区","sort": 1},     
                      {"Code": "450902","Name": "玉州区","sort": 2},     
                      {"Code": "450903","Name": "福绵区","sort": 3},     
                      {"Code": "450921","Name": "容县","sort": 4},     
                      {"Code": "450922","Name": "陆川县","sort": 5},     
                      {"Code": "450923","Name": "博白县","sort": 6},     
                      {"Code": "450924","Name": "兴业县","sort": 7},     
                      {"Code": "450981","Name": "北流市","sort": 8}
              ]},  
              {"Code": "451000","Name": "百色市","sort": 10,"level": [
                      {"Code": "451001","Name": "市辖区","sort": 1},    
                      {"Code": "451002","Name": "右江区","sort": 2},    
                      {"Code": "451021","Name": "田阳县","sort": 3},    
                      {"Code": "451022","Name": "田东县","sort": 4},    
                      {"Code": "451023","Name": "平果县","sort": 5},    
                      {"Code": "451024","Name": "德保县","sort": 6},    
                      {"Code": "451026","Name": "那坡县","sort": 7},    
                      {"Code": "451027","Name": "凌云县","sort": 8},    
                      {"Code": "451028","Name": "乐业县","sort": 9},    
                      {"Code": "451029","Name": "田林县","sort": 10},    
                      {"Code": "451030","Name": "西林县","sort": 11},    
                      {"Code": "451031","Name": "隆林各族自治县","sort": 12},    
                      {"Code": "451081","Name": "靖西市","sort": 13}
              ]},  
              {"Code": "451100","Name": "贺州市","sort": 11,"level": [
                      {"Code": "451101","Name": "市辖区","sort": 1},    
                      {"Code": "451102","Name": "八步区","sort": 2},    
                      {"Code": "451103","Name": "平桂区","sort": 3},    
                      {"Code": "451121","Name": "昭平县","sort": 4},    
                      {"Code": "451122","Name": "钟山县","sort": 5},    
                      {"Code": "451123","Name": "富川瑶族自治县","sort": 6}
              ]},
              {"Code": "451200","Name": "河池市","sort": 12,"level": [
                      {"Code": "451201","Name": "市辖区","sort": 1},    
                      {"Code": "451202","Name": "金城江区","sort": 2},    
                      {"Code": "451221","Name": "南丹县","sort": 3},    
                      {"Code": "451222","Name": "天峨县","sort": 4},    
                      {"Code": "451223","Name": "凤山县","sort": 5},    
                      {"Code": "451224","Name": "东兰县","sort": 6},    
                      {"Code": "451225","Name": "罗城仫佬族自治县","sort": 7},    
                      {"Code": "451226","Name": "环江毛南族自治县","sort": 8},    
                      {"Code": "451227","Name": "巴马瑶族自治县","sort": 9},    
                      {"Code": "451228","Name": "都安瑶族自治县","sort": 10},    
                      {"Code": "451229","Name": "大化瑶族自治县","sort": 11},    
                      {"Code": "451281","Name": "宜州市","sort": 12}
              ]},
              {"Code": "451300","Name": "来宾市","sort": 13,"level": [
                      {"Code": "451301","Name": "市辖区","sort": 1},    
                      {"Code": "451302","Name": "兴宾区","sort": 2},    
                      {"Code": "451321","Name": "忻城县","sort": 3},    
                      {"Code": "451322","Name": "象州县","sort": 4},    
                      {"Code": "451323","Name": "武宣县","sort": 5},    
                      {"Code": "451324","Name": "金秀瑶族自治县","sort": 6},    
                      {"Code": "451381","Name": "合山市","sort": 7}
              ]}, 
              {"Code": "451400","Name": "崇左市","sort": 14,"level": [
                      {"Code": "451401","Name": "市辖区","sort": 1},    
                      {"Code": "451402","Name": "江州区","sort": 2},    
                      {"Code": "451421","Name": "扶绥县","sort": 3},    
                      {"Code": "451422","Name": "宁明县","sort": 4},    
                      {"Code": "451423","Name": "龙州县","sort": 5},    
                      {"Code": "451424","Name": "大新县","sort": 6},    
                      {"Code": "451425","Name": "天等县","sort": 7},    
                      {"Code": "451481","Name": "凭祥市","sort": 8}
              ]}      
          ]
    },
    {
          "Code": "460000",
          "Name": "海南省",
          "level": [
              {"Code": "460100","Name": "海口市","sort": 1,"level": [
                      {"Code": "460101","Name": "市辖区","sort": 1},    
                      {"Code": "460105","Name": "秀英区","sort": 2},    
                      {"Code": "460106","Name": "龙华区","sort": 3},    
                      {"Code": "460107","Name": "琼山区","sort": 4},    
                      {"Code": "460108","Name": "美兰区","sort": 5}
              ]},
              {"Code": "460200","Name": "三亚市","sort": 2,"level": [
                      {"Code": "460201","Name": "市辖区","sort": 1},    
                      {"Code": "460202","Name": "海棠区","sort": 2},    
                      {"Code": "460203","Name": "吉阳区","sort": 3},    
                      {"Code": "460204","Name": "天涯区","sort": 4},    
                      {"Code": "460205","Name": "崖州区","sort": 5}
              ]},
              {"Code": "460300","Name": "三沙市","sort": 3,"level": []},    
              {"Code": "460400","Name": "儋州市","sort": 4,"level": []},    
              {"Code": "469000","Name": "省直辖县","sort": 5,"level": [
                      {"Code": "469001","Name": "五指山市","sort": 1},    
                      {"Code": "469002","Name": "琼海市","sort": 2},    
                      {"Code": "469005","Name": "文昌市","sort": 3},    
                      {"Code": "469006","Name": "万宁市","sort": 4},    
                      {"Code": "469007","Name": "东方市","sort": 5},    
                      {"Code": "469021","Name": "定安县","sort": 6},    
                      {"Code": "469022","Name": "屯昌县","sort": 7},    
                      {"Code": "469023","Name": "澄迈县","sort": 8},    
                      {"Code": "469024","Name": "临高县","sort": 9},   
                      {"Code": "469025","Name": "白沙黎族自治县","sort": 10},   
                      {"Code": "469026","Name": "昌江黎族自治县","sort": 11},   
                      {"Code": "469027","Name": "乐东黎族自治县","sort": 12},   
                      {"Code": "469028","Name": "陵水黎族自治县","sort": 13},   
                      {"Code": "469029","Name": "保亭黎族苗族自治县","sort": 14},   
                      {"Code": "469030","Name": "琼中黎族苗族自治县","sort": 15}
              ]}    
          ]
    },
    {
          "Code": "500000",
          "Name": "重庆市",
          "level": [
              {"Code": "500100","Name": "市辖区","sort": 1,"level": [
                      {"Code": "500101","Name": "万州区","sort": 1},   
                      {"Code": "500102","Name": "涪陵区","sort": 2},   
                      {"Code": "500103","Name": "渝中区","sort": 3},   
                      {"Code": "500104","Name": "大渡口区","sort": 4},   
                      {"Code": "500105","Name": "江北区","sort": 5},   
                      {"Code": "500106","Name": "沙坪坝区","sort": 6},   
                      {"Code": "500107","Name": "九龙坡区","sort": 7},   
                      {"Code": "500108","Name": "南岸区","sort": 8},   
                      {"Code": "500109","Name": "北碚区","sort": 9},   
                      {"Code": "500110","Name": "綦江区","sort": 10},   
                      {"Code": "500111","Name": "大足区","sort": 11},   
                      {"Code": "500112","Name": "渝北区","sort": 12},   
                      {"Code": "500113","Name": "巴南区","sort": 13},   
                      {"Code": "500114","Name": "黔江区","sort": 14},   
                      {"Code": "500115","Name": "长寿区","sort": 15},   
                      {"Code": "500116","Name": "江津区","sort": 16},   
                      {"Code": "500117","Name": "合川区","sort": 17},   
                      {"Code": "500118","Name": "永川区","sort": 18},   
                      {"Code": "500119","Name": "南川区","sort": 19},   
                      {"Code": "500120","Name": "璧山区","sort": 20},   
                      {"Code": "500151","Name": "铜梁区","sort": 21},   
                      {"Code": "500152","Name": "潼南区","sort": 5},   
                      {"Code": "500153","Name": "荣昌区","sort": 6},   
                      {"Code": "500154","Name": "开州区","sort": 7}
              ]},
              {"Code": "500200","Name": "县","sort": 2,"level": [
                      {"Code": "500228","Name": "梁平县","sort": 1},   
                      {"Code": "500229","Name": "城口县","sort": 2},   
                      {"Code": "500230","Name": "丰都县","sort": 3},   
                      {"Code": "500231","Name": "垫江县","sort": 4},   
                      {"Code": "500232","Name": "武隆县","sort": 5},   
                      {"Code": "500233","Name": "忠县","sort": 6},   
                      {"Code": "500235","Name": "云阳县 ","sort": 7},   
                      {"Code": "500236","Name": "奉节县 ","sort": 8},   
                      {"Code": "500237","Name": "巫山县 ","sort": 9},   
                      {"Code": "500238","Name": "巫溪县 ","sort": 10},   
                      {"Code": "500240","Name": "石柱土家族自治县","sort": 11},   
                      {"Code": "500241","Name": "秀山土家族苗族自治县","sort": 12},   
                      {"Code": "500242","Name": "酉阳土家族苗族自治县","sort": 13},   
                      {"Code": "500243","Name": "彭水苗族土家族自治县","sort": 14}
              ]}
          ]
    },
    {
          "Code": "510000",
          "Name": "四川省",
          "level": [
              {"Code": "510100","Name": "成都市","sort": 1,"level": [
                      {"Code": "510101","Name": "市辖区","sort": 1},   
                      {"Code": "510104","Name": "锦江区","sort": 2},   
                      {"Code": "510105","Name": "青羊区","sort": 3},   
                      {"Code": "510106","Name": "金牛区","sort": 4},   
                      {"Code": "510107","Name": "武侯区","sort": 5},   
                      {"Code": "510108","Name": "成华区","sort": 6},   
                      {"Code": "510112","Name": "龙泉驿区","sort": 7},   
                      {"Code": "510113","Name": "青白江区","sort": 8},   
                      {"Code": "510114","Name": "新都区","sort": 9},   
                      {"Code": "510115","Name": "温江区","sort": 10},   
                      {"Code": "510116","Name": "双流区","sort": 11},   
                      {"Code": "510121","Name": "金堂县","sort": 12},   
                      {"Code": "510124","Name": "郫县","sort": 13},   
                      {"Code": "510129","Name": "大邑县","sort": 14},   
                      {"Code": "510131","Name": "蒲江县","sort": 15},   
                      {"Code": "510132","Name": "新津县","sort": 16},   
                      {"Code": "510181","Name": "都江堰市","sort": 17},   
                      {"Code": "510182","Name": "彭州市","sort": 18},   
                      {"Code": "510183","Name": "邛崃市","sort": 19},   
                      {"Code": "510184","Name": "崇州市","sort": 20},  
                      {"Code": "510185","Name": "简阳市","sort": 21}
              ]},
              {"Code": "510300","Name": "自贡市","sort": 2,"level": [
                      {"Code": "510301","Name": "市辖区","sort": 1},  
                      {"Code": "510302","Name": "自流井区","sort": 2},  
                      {"Code": "510303","Name": "贡井区","sort": 3},  
                      {"Code": "510304","Name": "大安区","sort": 4},  
                      {"Code": "510311","Name": "沿滩区","sort": 5},  
                      {"Code": "510321","Name": "荣县","sort": 6},  
                      {"Code": "510322","Name": "富顺县","sort": 7}
              ]},
              {"Code": "510400","Name": "攀枝花市","sort": 3,"level": [
                      {"Code": "510401","Name": "市辖区","sort": 1},  
                      {"Code": "510402","Name": "东区","sort": 2},  
                      {"Code": "510403","Name": "西区","sort": 3},  
                      {"Code": "510411","Name": "仁和区","sort": 4},  
                      {"Code": "510421","Name": "米易县","sort": 5},  
                      {"Code": "510422","Name": "盐边县","sort": 6}
              ]},  
              {"Code": "510500","Name": "泸州市","sort": 4,"level": [
                      {"Code": "510501","Name": "市辖区","sort": 1},  
                      {"Code": "510502","Name": "江阳区","sort": 2},  
                      {"Code": "510503","Name": "纳溪区","sort": 3},  
                      {"Code": "510504","Name": "龙马潭区","sort": 4},  
                      {"Code": "510521","Name": "泸县","sort": 5},  
                      {"Code": "510522","Name": "合江县","sort": 6},  
                      {"Code": "510524","Name": "叙永县","sort": 7},  
                      {"Code": "510525","Name": "古蔺县","sort": 8}
              ]},  
              {"Code": "510600","Name": "德阳市","sort": 5,"level": [
                      {"Code": "510601","Name": "市辖区","sort": 1},  
                      {"Code": "510603","Name": "旌阳区","sort": 2},  
                      {"Code": "510623","Name": "中江县","sort": 3},  
                      {"Code": "510626","Name": "罗江县","sort": 4},  
                      {"Code": "510681","Name": "广汉市","sort": 5},  
                      {"Code": "510682","Name": "什邡市","sort": 6},  
                      {"Code": "510683","Name": "绵竹市","sort": 7}
              ]},  
              {"Code": "510700","Name": "绵阳市","sort": 6,"level": [
                      {"Code": "510701","Name": "市辖区","sort": 1},  
                      {"Code": "510703","Name": "涪城区","sort": 2},  
                      {"Code": "510704","Name": "游仙区","sort": 3},  
                      {"Code": "510705","Name": "安州区","sort": 4},  
                      {"Code": "510722","Name": "三台县","sort": 5},  
                      {"Code": "510723","Name": "盐亭县","sort": 6},  
                      {"Code": "510725","Name": "梓潼县","sort": 7},  
                      {"Code": "510726","Name": "北川羌族自治县","sort": 8},  
                      {"Code": "510727","Name": "平武县","sort": 9},  
                      {"Code": "510781","Name": "江油市","sort": 10}
              ]},  
              {"Code": "510800","Name": "广元市","sort": 7,"level": [
                      {"Code": "510801","Name": "市辖区","sort": 1},  
                      {"Code": "510802","Name": "利州区","sort": 2},  
                      {"Code": "510811","Name": "昭化区","sort": 3},  
                      {"Code": "510812","Name": "朝天区","sort": 4},  
                      {"Code": "510821","Name": "旺苍县","sort": 5},  
                      {"Code": "510822","Name": "青川县","sort": 6},  
                      {"Code": "510823","Name": "剑阁县","sort": 7},  
                      {"Code": "510824","Name": "苍溪县","sort": 8}
              ]},  
              {"Code": "510900","Name": "遂宁市","sort": 8,"level": [
                      {"Code": "510901","Name": "市辖区","sort": 1},  
                      {"Code": "510903","Name": "船山区","sort": 2},  
                      {"Code": "510904","Name": "安居区","sort": 3},  
                      {"Code": "510921","Name": "蓬溪县","sort": 4},  
                      {"Code": "510922","Name": "射洪县","sort": 5},  
                      {"Code": "510923","Name": "大英县","sort": 6}
              ]},  
              {"Code": "511000","Name": "内江市","sort": 9,"level": [
                      {"Code": "511001","Name": "市辖区","sort": 1},  
                      {"Code": "511002","Name": "市中区","sort": 2},  
                      {"Code": "511011","Name": "东兴区","sort": 3},  
                      {"Code": "511024","Name": "威远县","sort": 4},  
                      {"Code": "511025","Name": "资中县","sort": 5},  
                      {"Code": "511028","Name": "隆昌县","sort": 6}
              ]},  
              {"Code": "511100","Name": "乐山市","sort": 10,"level": [
                      {"Code": "511101","Name": "市辖区","sort": 1},  
                      {"Code": "511102","Name": "市中区","sort": 2},  
                      {"Code": "511111","Name": "沙湾区","sort": 3},  
                      {"Code": "511112","Name": "五通桥区","sort": 4},  
                      {"Code": "511113","Name": "金口河区","sort": 5}, 
                      {"Code": "511123","Name": "犍为县","sort": 6}, 
                      {"Code": "511124","Name": "井研县","sort": 7}, 
                      {"Code": "511126","Name": "夹江县","sort": 8}, 
                      {"Code": "511129","Name": "沐川县","sort": 9}, 
                      {"Code": "511132","Name": "峨边彝族自治县","sort": 10}, 
                      {"Code": "511133","Name": "马边彝族自治县","sort": 11}, 
                      {"Code": "511181","Name": "峨眉山市","sort": 12}
              ]},  
              {"Code": "511300","Name": "南充市","sort": 11,"level": [
                      {"Code": "511301","Name": "市辖区","sort": 1}, 
                      {"Code": "511302","Name": "顺庆区","sort": 2}, 
                      {"Code": "511303","Name": "高坪区","sort": 3}, 
                      {"Code": "511304","Name": "嘉陵区","sort": 4}, 
                      {"Code": "511321","Name": "南部县","sort": 5}, 
                      {"Code": "511322","Name": "营山县","sort": 6}, 
                      {"Code": "511323","Name": "蓬安县","sort": 7}, 
                      {"Code": "511324","Name": "仪陇县","sort": 8}, 
                      {"Code": "511325","Name": "西充县","sort": 9}, 
                      {"Code": "511381","Name": "阆中市","sort": 10}
              ]},
              {"Code": "511400","Name": "眉山市","sort": 12,"level": [
                      {"Code": "511401","Name": "市辖区","sort": 1}, 
                      {"Code": "511402","Name": "东坡区","sort": 2}, 
                      {"Code": "511403","Name": "彭山区","sort": 3}, 
                      {"Code": "511421","Name": "仁寿县","sort": 4}, 
                      {"Code": "511423","Name": "洪雅县","sort": 5}, 
                      {"Code": "511424","Name": "丹棱县","sort": 6}, 
                      {"Code": "511425","Name": "青神县","sort": 7}
              ]},
              {"Code": "511500","Name": "宜宾市","sort": 13,"level": [
                      {"Code": "511501","Name": "市辖区","sort": 1}, 
                      {"Code": "511502","Name": "翠屏区","sort": 2}, 
                      {"Code": "511503","Name": "南溪区","sort": 3}, 
                      {"Code": "511521","Name": "宜宾县","sort": 4}, 
                      {"Code": "511523","Name": "江安县","sort": 5}, 
                      {"Code": "511524","Name": "长宁县","sort": 6}, 
                      {"Code": "511525","Name": "高县","sort": 7}, 
                      {"Code": "511526","Name": "珙县","sort": 8}, 
                      {"Code": "511527","Name": "筠连县","sort": 9}, 
                      {"Code": "511528","Name": "兴文县","sort": 10}, 
                      {"Code": "511529","Name": "屏山县","sort": 11}
              ]}, 
              {"Code": "511600","Name": "广安市","sort": 14,"level": [
                      {"Code": "511601","Name": "市辖区","sort": 1}, 
                      {"Code": "511602","Name": "广安区","sort": 2}, 
                      {"Code": "511603","Name": "前锋区","sort": 3}, 
                      {"Code": "511621","Name": "岳池县","sort": 4}, 
                      {"Code": "511622","Name": "武胜县","sort": 5}, 
                      {"Code": "511623","Name": "邻水县","sort": 6}, 
                      {"Code": "511681","Name": "华蓥市","sort": 7}
              ]},
              {"Code": "511700","Name": "达州市","sort": 15,"level": [
                      {"Code": "511701","Name": "市辖区","sort": 1}, 
                      {"Code": "511702","Name": "通川区","sort": 2}, 
                      {"Code": "511703","Name": "达川区","sort": 3}, 
                      {"Code": "511722","Name": "宣汉县","sort": 4}, 
                      {"Code": "511723","Name": "开江县","sort": 5}, 
                      {"Code": "511724","Name": "大竹县","sort": 6}, 
                      {"Code": "511725","Name": "渠县","sort": 7}, 
                      {"Code": "511781","Name": "万源市","sort": 8}
              ]},  
              {"Code": "511800","Name": "雅安市","sort": 16,"level": [
                      {"Code": "511801","Name": "市辖区","sort": 1}, 
                      {"Code": "511802","Name": "雨城区","sort": 2}, 
                      {"Code": "511803","Name": "名山区","sort": 3}, 
                      {"Code": "511822","Name": "荥经县","sort": 4}, 
                      {"Code": "511823","Name": "汉源县","sort": 5}, 
                      {"Code": "511824","Name": "石棉县","sort": 6}, 
                      {"Code": "511825","Name": "天全县","sort": 7}, 
                      {"Code": "511826","Name": "芦山县","sort": 8}, 
                      {"Code": "511827","Name": "宝兴县","sort": 9}
              ]},  
              {"Code": "511900","Name": "巴中市","sort": 17,"level": [
                      {"Code": "511901","Name": "市辖区","sort": 1}, 
                      {"Code": "511902","Name": "巴州区","sort": 2}, 
                      {"Code": "511903","Name": "恩阳区","sort": 3}, 
                      {"Code": "511921","Name": "通江县","sort": 4}, 
                      {"Code": "511922","Name": "南江县","sort": 5},
                      {"Code": "511923","Name": "平昌县","sort": 6}
              ]},  
              {"Code": "512000","Name": "资阳市","sort": 18,"level": [
                      {"Code": "512001","Name": "市辖区","sort": 1},
                      {"Code": "512002","Name": "雁江区","sort": 2},
                      {"Code": "512021","Name": "安岳县","sort": 3},
                      {"Code": "512022","Name": "乐至县","sort": 4}
              ]},  
              {"Code": "513200","Name": "阿坝市","sort": 19,"level": [
                      {"Code": "513201","Name": "马尔康市","sort": 1},
                      {"Code": "513221","Name": "汶川县","sort": 2},
                      {"Code": "513222","Name": "理县","sort": 3},
                      {"Code": "513223","Name": "茂县","sort": 4},
                      {"Code": "513224","Name": "松潘县","sort": 5},
                      {"Code": "513225","Name": "九寨沟县","sort": 6},
                      {"Code": "513226","Name": "金川县","sort": 7},
                      {"Code": "513227","Name": "小金县","sort": 8},
                      {"Code": "513228","Name": "黑水县","sort": 9},
                      {"Code": "513230","Name": "壤塘县","sort": 10},
                      {"Code": "513231","Name": "阿坝县","sort": 11},      
                      {"Code": "513232","Name": "若尔盖县","sort": 12},      
                      {"Code": "513233","Name": "红原县","sort": 13}
              ]},
              {"Code": "513300","Name": "甘孜藏族自治州","sort": 20,"level": [
                      {"Code": "513301","Name": "康定市","sort": 1},      
                      {"Code": "513322","Name": "泸定县","sort": 2},      
                      {"Code": "513323","Name": "丹巴县","sort": 3},      
                      {"Code": "513324","Name": "九龙县","sort": 4},      
                      {"Code": "513325","Name": "雅江县","sort": 5},      
                      {"Code": "513326","Name": "道孚县","sort": 6},      
                      {"Code": "513327","Name": "炉霍县","sort": 7},      
                      {"Code": "513328","Name": "甘孜县","sort": 8},      
                      {"Code": "513329","Name": "新龙县","sort": 9},      
                      {"Code": "513330","Name": "德格县","sort": 10},      
                      {"Code": "513331","Name": "白玉县","sort": 11},      
                      {"Code": "513332","Name": "石渠县","sort": 12},      
                      {"Code": "513333","Name": "色达县","sort": 13},      
                      {"Code": "513334","Name": "理塘县","sort": 14},      
                      {"Code": "513335","Name": "巴塘县","sort": 15},      
                      {"Code": "513336","Name": "乡城县","sort": 16},      
                      {"Code": "513337","Name": "稻城县","sort": 17},      
                      {"Code": "513338","Name": "得荣县","sort": 18}
              ]},
              {"Code": "513400","Name": "凉山彝族自治州","sort": 21,"level": [
                      {"Code": "513401","Name": "西昌市","sort": 1},      
                      {"Code": "513422","Name": "木里藏族自治县","sort": 2},      
                      {"Code": "513423","Name": "盐源县","sort": 3},      
                      {"Code": "513424","Name": "德昌县","sort": 4},      
                      {"Code": "513425","Name": "会理县","sort": 5},      
                      {"Code": "513426","Name": "会东县","sort": 6},      
                      {"Code": "513427","Name": "宁南县","sort": 7},      
                      {"Code": "513428","Name": "普格县","sort": 8},      
                      {"Code": "513429","Name": "布拖县","sort": 9},      
                      {"Code": "513430","Name": "金阳县","sort": 10},      
                      {"Code": "513431","Name": "昭觉县","sort": 11},      
                      {"Code": "513432","Name": "喜德县","sort": 12},     
                      {"Code": "513433","Name": "冕宁县","sort": 13},     
                      {"Code": "513434","Name": "越西县","sort": 14},     
                      {"Code": "513435","Name": "甘洛县","sort": 15},     
                      {"Code": "513436","Name": "美姑县","sort": 16},     
                      {"Code": "513437","Name": "雷波县","sort": 17}
              ]}     
          ]
    },
    {
          "Code": "520000",
          "Name": "贵州省",
          "level": [
              {"Code": "520100","Name": "贵阳市","sort": 1,"level": [
                      {"Code": "520101","Name": "市辖区","sort": 1},     
                      {"Code": "520102","Name": "南明区","sort": 2},     
                      {"Code": "520103","Name": "云岩区","sort": 3},     
                      {"Code": "520111","Name": "花溪区","sort": 4},     
                      {"Code": "520112","Name": "乌当区","sort": 5},     
                      {"Code": "520113","Name": "白云区","sort": 6},     
                      {"Code": "520115","Name": "观山湖区","sort": 7},     
                      {"Code": "520121","Name": "开阳县","sort": 8},     
                      {"Code": "520122","Name": "息烽县","sort": 9},     
                      {"Code": "520123","Name": "修文县","sort": 10},     
                      {"Code": "520181","Name": "清镇市","sort": 11}     
              ]},
              {"Code": "520200","Name": "六盘水市","sort": 2,"level": [
                      {"Code": "520201","Name": "钟山区","sort": 1},   
                      {"Code": "520203","Name": "六枝特区","sort": 2},  
                      {"Code": "520221","Name": "水城县","sort": 3},   
                      {"Code": "520222","Name": "盘县","sort": 4}     
              ]},
              {"Code": "520300","Name": "遵义市","sort": 3,"level": [
                      {"Code": "520301","Name": "市辖区","sort": 1},     
                      {"Code": "520302","Name": "红花岗区","sort": 2},     
                      {"Code": "520303","Name": "汇川区","sort": 3},     
                      {"Code": "520304","Name": "播州区","sort": 4},     
                      {"Code": "520322","Name": "桐梓县","sort": 5},     
                      {"Code": "520323","Name": "绥阳县","sort": 6},     
                      {"Code": "520324","Name": "正安县","sort": 7},     
                      {"Code": "520325","Name": "道真仡佬族苗族自治县","sort": 8},     
                      {"Code": "520326","Name": "务川仡佬族苗族自治县","sort": 9},     
                      {"Code": "520327","Name": "凤冈县","sort": 10},     
                      {"Code": "520328","Name": "湄潭县","sort": 11},     
                      {"Code": "520329","Name": "余庆县","sort": 12},     
                      {"Code": "520330","Name": "习水县","sort": 13},     
                      {"Code": "520381","Name": "赤水市","sort": 14},     
                      {"Code": "520382","Name": "仁怀市","sort": 15}
              ]},  
              {"Code": "520400","Name": "安顺市","sort": 4,"level": [
                      {"Code": "520401","Name": "市辖区","sort": 1},     
                      {"Code": "520402","Name": "西秀区","sort": 2},     
                      {"Code": "520403","Name": "平坝区","sort": 3},     
                      {"Code": "520422","Name": "普定县","sort": 4},     
                      {"Code": "520423","Name": "镇宁布依族苗族自治县","sort": 5},     
                      {"Code": "520424","Name": "关岭布依族苗族自治县","sort": 6},     
                      {"Code": "520425","Name": "紫云苗族布依族自治县","sort": 7}
              ]},  
              {"Code": "522200","Name": "毕节市","sort": 5,"level": [
                      {"Code": "520501","Name": "市辖区","sort": 1},     
                      {"Code": "520502","Name": "七星关区","sort": 2},     
                      {"Code": "520521","Name": "大方县","sort": 3},     
                      {"Code": "520522","Name": "黔西县","sort": 4},     
                      {"Code": "520523","Name": "金沙县","sort": 5},     
                      {"Code": "520524","Name": "织金县","sort": 6},     
                      {"Code": "520525","Name": "纳雍县","sort": 7},     
                      {"Code": "520526","Name": "威宁彝族回族苗族自治县","sort": 8},     
                      {"Code": "520527","Name": "赫章县","sort": 9}
              ]},  
              {"Code": "522300","Name": "铜仁市","sort": 6,"level": [
                      {"Code": "520601","Name": "市辖区","sort": 1},     
                      {"Code": "520602","Name": "碧江区","sort": 2},     
                      {"Code": "520603","Name": "万山区","sort": 3},     
                      {"Code": "520621","Name": "江口县","sort": 4},     
                      {"Code": "520622","Name": "玉屏侗族自治县","sort": 5},     
                      {"Code": "520623","Name": "石阡县","sort": 6},     
                      {"Code": "520624","Name": "思南县","sort": 7},     
                      {"Code": "520625","Name": "印江土家族苗族自治县","sort": 8},     
                      {"Code": "520626","Name": "德江县","sort": 9},     
                      {"Code": "520627","Name": "沿河土家族自治县","sort": 10},     
                      {"Code": "520628","Name": "松桃苗族自治县 ","sort": 11}
              ]},  
              {"Code": "522400","Name": "黔西南布依族苗族自治州","sort": 7,"level": [
                      {"Code": "522301","Name": "兴义市","sort": 1},     
                      {"Code": "522322","Name": "兴仁县","sort": 2},    
                      {"Code": "522323","Name": "普安县","sort": 3},    
                      {"Code": "522324","Name": "晴隆县","sort": 4},    
                      {"Code": "522325","Name": "贞丰县","sort": 5},    
                      {"Code": "522326","Name": "望谟县","sort": 6},    
                      {"Code": "522327","Name": "册亨县","sort": 7},    
                      {"Code": "522328","Name": "安龙县","sort": 8}
              ]},  
              {"Code": "522600","Name": "黔东南苗族侗族自治州 市","sort": 8,"level": [
                      {"Code": "522601","Name": "凯里市","sort": 1},    
                      {"Code": "522622","Name": "黄平县","sort": 2},    
                      {"Code": "522623","Name": "施秉县","sort": 3},    
                      {"Code": "522624","Name": "三穗县","sort": 4},    
                      {"Code": "522625","Name": "镇远县","sort": 5},    
                      {"Code": "522626","Name": "岑巩县","sort": 6},    
                      {"Code": "522627","Name": "天柱县","sort": 7},    
                      {"Code": "522628","Name": "锦屏县","sort": 8},    
                      {"Code": "522629","Name": "剑河县","sort": 9},    
                      {"Code": "522630","Name": "台江县","sort": 10},    
                      {"Code": "522631","Name": "黎平县","sort": 11},    
                      {"Code": "522632","Name": "榕江县","sort": 12},    
                      {"Code": "522633","Name": "从江县","sort": 13},    
                      {"Code": "522634","Name": "雷山县","sort": 14},    
                      {"Code": "522635","Name": "麻江县","sort": 15},    
                      {"Code": "522636","Name": "丹寨县","sort": 16}
              ]},  
              {"Code": "522700","Name": "黔南布依族苗族自治州 ","sort": 9,"level": [
                      {"Code": "522701","Name": "都匀市","sort": 1},    
                      {"Code": "522702","Name": "福泉市","sort": 2},    
                      {"Code": "522722","Name": "荔波县","sort": 3},    
                      {"Code": "522723","Name": "贵定县","sort": 4},    
                      {"Code": "522725","Name": "瓮安县","sort": 5},    
                      {"Code": "522726","Name": "独山县","sort": 6},    
                      {"Code": "522727","Name": "平塘县","sort": 7},    
                      {"Code": "522728","Name": "罗甸县","sort": 8},    
                      {"Code": "522729","Name": "长顺县","sort": 9},    
                      {"Code": "522730","Name": "龙里县","sort": 10},    
                      {"Code": "522731","Name": "惠水县","sort": 11},    
                      {"Code": "522732","Name": "三都水族自治县","sort": 12}
              ]}     
          ]
    },
    {
          "Code": "530000",
          "Name": "云南省",
          "level": [
              {"Code": "530100","Name": "昆明市","sort": 1,"level": [
                      {"Code": "530101","Name": "市辖区","sort": 1},    
                      {"Code": "530102","Name": "五华区","sort": 2},    
                      {"Code": "530103","Name": "盘龙区","sort": 3},    
                      {"Code": "530111","Name": "官渡区","sort": 4},    
                      {"Code": "530112","Name": "西山区","sort": 5},    
                      {"Code": "530113","Name": "东川区","sort": 6},    
                      {"Code": "530114","Name": "呈贡区","sort": 7},    
                      {"Code": "530122","Name": "晋宁县","sort": 8},    
                      {"Code": "530124","Name": "富民县","sort": 9},    
                      {"Code": "530125","Name": "宜良县","sort": 10},    
                      {"Code": "530126","Name": "石林彝族自治县","sort": 11},    
                      {"Code": "530127","Name": "嵩明县","sort": 12},    
                      {"Code": "530128","Name": "禄劝彝族苗族自治县","sort": 13},    
                      {"Code": "530129","Name": "寻甸回族彝族自治县","sort": 14},    
                      {"Code": "530181","Name": "安宁市","sort": 15}
              ]},
              {"Code": "530300","Name": "曲靖市","sort": 2,"level": [
                      {"Code": "530301","Name": "市辖区","sort": 1},    
                      {"Code": "530302","Name": "麒麟区","sort": 2},    
                      {"Code": "530303","Name": "沾益区","sort": 3},    
                      {"Code": "530321","Name": "马龙县","sort": 4},    
                      {"Code": "530322","Name": "陆良县","sort": 5},    
                      {"Code": "530323","Name": "师宗县","sort": 6},    
                      {"Code": "530324","Name": "罗平县","sort": 7},    
                      {"Code": "530325","Name": "富源县","sort": 8},    
                      {"Code": "530326","Name": "会泽县","sort": 9},    
                      {"Code": "530381","Name": "宣威市","sort": 10}
              ]},
              {"Code": "530400","Name": "玉溪市","sort": 3,"level": [
                      {"Code": "530401","Name": "市辖区","sort": 1},    
                      {"Code": "530402","Name": "红塔区","sort": 2},    
                      {"Code": "530403","Name": "江川区","sort": 3},    
                      {"Code": "530422","Name": "澄江县","sort": 4},    
                      {"Code": "530423","Name": "通海县","sort": 5},   
                      {"Code": "530424","Name": "华宁县","sort": 6},   
                      {"Code": "530425","Name": "易门县","sort": 7},   
                      {"Code": "530426","Name": "峨山彝族自治县","sort": 8},   
                      {"Code": "530427","Name": "新平彝族傣族自治县","sort": 9},   
                      {"Code": "530428","Name": "元江哈尼族彝族傣族自治县","sort": 10}
              ]},  
              {"Code": "530500","Name": "保山市","sort": 4,"level": [
                      {"Code": "530501","Name": "市辖区","sort": 1},   
                      {"Code": "530502","Name": "隆阳区","sort": 2},   
                      {"Code": "530521","Name": "施甸县","sort": 3},   
                      {"Code": "530523","Name": "龙陵县","sort": 4},   
                      {"Code": "530524","Name": "昌宁县","sort": 5},   
                      {"Code": "530581","Name": "腾冲市","sort": 6}
              ]},  
              {"Code": "530600","Name": "昭通市","sort": 5,"level": [
                      {"Code": "530601","Name": "市辖区","sort": 1},   
                      {"Code": "530602","Name": "昭阳区","sort": 2},   
                      {"Code": "530621","Name": "鲁甸县","sort": 3},   
                      {"Code": "530622","Name": "巧家县","sort": 4},   
                      {"Code": "530623","Name": "盐津县","sort": 5},   
                      {"Code": "530624","Name": "大关县","sort": 6},   
                      {"Code": "530625","Name": "永善县","sort": 7},   
                      {"Code": "530626","Name": "绥江县","sort": 8},   
                      {"Code": "530627","Name": "镇雄县","sort": 9},   
                      {"Code": "530628","Name": "彝良县","sort": 10},   
                      {"Code": "530629","Name": "威信县","sort": 11},   
                      {"Code": "530630","Name": "水富县","sort": 12}
              ]},  
              {"Code": "530700","Name": "丽江市","sort": 6,"level": [
                      {"Code": "530701","Name": "市辖区","sort": 1},   
                      {"Code": "530702","Name": "古城区","sort": 2},   
                      {"Code": "530721","Name": "玉龙纳西族自治县","sort": 3},   
                      {"Code": "530722","Name": "永胜县","sort": 4},   
                      {"Code": "530723","Name": "华坪县","sort": 5},   
                      {"Code": "530724","Name": "宁蒗彝族自治县","sort": 6},
              ]},  
              {"Code": "530800","Name": "普洱市","sort": 7,"level": [
                      {"Code": "530801","Name": "市辖区","sort": 1},   
                      {"Code": "530802","Name": "思茅区","sort": 2},   
                      {"Code": "530821","Name": "宁洱哈尼族彝族自治县","sort": 3},   
                      {"Code": "530822","Name": "墨江哈尼族自治县","sort": 4},   
                      {"Code": "530823","Name": "景东彝族自治县","sort": 5},   
                      {"Code": "530824","Name": "景谷傣族彝族自治县","sort": 6},   
                      {"Code": "530825","Name": "镇沅彝族哈尼族拉祜族自治县","sort": 7},   
                      {"Code": "530826","Name": "江城哈尼族彝族自治县","sort": 8},   
                      {"Code": "530827","Name": "孟连傣族拉祜族佤族自治县 ","sort": 9},   
                      {"Code": "530828","Name": "澜沧拉祜族自治县","sort": 10},   
                      {"Code": "530829","Name": "西盟佤族自治县","sort": 11}
              ]},  
              {"Code": "530900","Name": "临沧市","sort": 8,"level": [
                      {"Code": "530901","Name": "市辖区","sort": 1},   
                      {"Code": "530902","Name": "临翔区","sort": 2},   
                      {"Code": "530921","Name": "凤庆县","sort": 3},   
                      {"Code": "530922","Name": "云县","sort": 4},   
                      {"Code": "530923","Name": "永德县","sort": 5},   
                      {"Code": "530924","Name": "镇康县","sort": 6},   
                      {"Code": "530925","Name": "双江拉祜族佤族布朗族傣族自治县","sort": 7},   
                      {"Code": "530926","Name": "耿马傣族佤族自治县","sort": 8},   
                      {"Code": "530927","Name": "沧源佤族自治县","sort": 9}
              ]},  
              {"Code": "532300","Name": "楚雄彝族自治州","sort": 9,"level": [
                      {"Code": "532301","Name": "楚雄市","sort": 1},   
                      {"Code": "532322","Name": "双柏县","sort": 2},   
                      {"Code": "532323","Name": "牟定县","sort": 3},   
                      {"Code": "532324","Name": "南华县","sort": 4},   
                      {"Code": "532325","Name": "姚安县","sort": 5},   
                      {"Code": "532326","Name": "大姚县","sort": 6},   
                      {"Code": "532327","Name": "永仁县","sort": 7},   
                      {"Code": "532328","Name": "元谋县","sort": 8},   
                      {"Code": "532329","Name": "武定县","sort": 9},   
                      {"Code": "532331","Name": "禄丰县","sort": 10},
              ]},                                            
              {"Code": "532500","Name": "红河哈尼族彝族自治州","sort": 10,"level": [
                      {"Code": "532501","Name": "个旧市","sort": 1},   
                      {"Code": "532502","Name": "开远市","sort": 2},   
                      {"Code": "532503","Name": "蒙自市","sort": 3},   
                      {"Code": "532504","Name": "弥勒市","sort": 4},   
                      {"Code": "532523","Name": "屏边苗族自治县","sort": 5},  
                      {"Code": "532524","Name": "建水县","sort": 6},   
                      {"Code": "532525","Name": "石屏县","sort": 7},   
                      {"Code": "532527","Name": "泸西县","sort": 8},   
                      {"Code": "532528","Name": "元阳县","sort": 9},   
                      {"Code": "532529","Name": "红河县","sort": 10},  
                      {"Code": "532530","Name": "金平苗族瑶族傣族自治县","sort": 11},  
                      {"Code": "532531","Name": "绿春县","sort": 12},  
                      {"Code": "532532","Name": "河口瑶族自治县","sort": 13}
              ]},  
              {"Code": "532600","Name": "文山壮族苗族自治州 ","sort": 11,"level": [
                      {"Code": "532601","Name": "文山市","sort": 1}, 
                      {"Code": "532622","Name": "砚山县","sort": 2}, 
                      {"Code": "532623","Name": "西畴县","sort": 3}, 
                      {"Code": "532624","Name": "麻栗坡县","sort": 4}, 
                      {"Code": "532625","Name": "马关县","sort": 5},  
                      {"Code": "532626","Name": "丘北县","sort": 6},  
                      {"Code": "532627","Name": "广南县","sort": 7},  
                      {"Code": "532628","Name": "富宁县","sort": 8}
              ]},
              {"Code": "532800","Name": "西双版纳傣族自治州 ","sort": 12,"level": [
                      {"Code": "532801","Name": "景洪市","sort": 1},  
                      {"Code": "532822","Name": "勐海县","sort": 2},
                      {"Code": "532823","Name": "勐腊县","sort": 3}
              ]},
              {"Code": "532900","Name": "大理白族自治州","sort": 13,"level": [
                      {"Code": "532901","Name": "大理市","sort": 1},  
                      {"Code": "532922","Name": "漾濞彝族自治县","sort": 2},  
                      {"Code": "532923","Name": "祥云县","sort": 3},  
                      {"Code": "532924","Name": "宾川县","sort": 4},  
                      {"Code": "532925","Name": "弥渡县","sort": 5},  
                      {"Code": "532926","Name": "南涧彝族自治县","sort": 6},  
                      {"Code": "532927","Name": "巍山彝族回族自治县","sort": 7},  
                      {"Code": "532928","Name": "永平县","sort": 8},  
                      {"Code": "532929","Name": "云龙县","sort": 9},  
                      {"Code": "532930","Name": "洱源县","sort": 10},  
                      {"Code": "532931","Name": "剑川县","sort": 11},  
                      {"Code": "532932","Name": "鹤庆县","sort": 12}
              ]}, 
              {"Code": "533100","Name": "德宏傣族景颇族自治州","sort": 14,"level": [
                      {"Code": "533102","Name": "瑞丽市","sort": 1},  
                      {"Code": "533103","Name": "芒市","sort": 2},  
                      {"Code": "533122","Name": "梁河县","sort": 3},  
                      {"Code": "533123","Name": "盈江县","sort": 4},  
                      {"Code": "533124","Name": "陇川县","sort": 5}
              ]},
              {"Code": "533300","Name": "怒江傈僳族自治州","sort": 15,"level": [
                      {"Code": "533301","Name": "泸水市","sort": 1},  
                      {"Code": "533323","Name": "福贡县","sort": 2},  
                      {"Code": "533324","Name": "贡山独龙族怒族自治县","sort": 3},  
                      {"Code": "533325","Name": "兰坪白族普米族自治县","sort": 4}
              ]}, 
              {"Code": "533400","Name": "迪庆藏族自治州","sort": 16,"level": [
                      {"Code": "533401","Name": "香格里拉市","sort": 1},  
                      {"Code": "533422","Name": "德钦县","sort": 2},  
                      {"Code": "533423","Name": "维西傈僳族自治县","sort": 3}
              ]}
          ]
    },
    {
          "Code": "540000",
          "Name": "西藏自治区",
          "level": [
              {"Code": "540100","Name": "拉萨市","sort": 1,"level": [
                      {"Code": "540101","Name": "市辖区","sort": 1},  
                      {"Code": "540102","Name": "城关区","sort": 2},  
                      {"Code": "540103","Name": "堆龙德庆区","sort": 3},  
                      {"Code": "540121","Name": "林周县","sort": 4},  
                      {"Code": "540122","Name": "当雄县","sort": 5},  
                      {"Code": "540123","Name": "尼木县","sort": 6},  
                      {"Code": "540124","Name": "曲水县","sort": 7},  
                      {"Code": "540126","Name": "达孜县","sort": 8},  
                      {"Code": "540127","Name": "墨竹工卡县","sort": 9}
              ]},
              {"Code": "542100","Name": "日喀则市","sort": 2,"level": [
                      {"Code": "540202","Name": "桑珠孜区","sort": 1},  
                      {"Code": "540221","Name": "南木林县","sort": 2},  
                      {"Code": "540222","Name": "江孜县","sort": 3},  
                      {"Code": "540223","Name": "定日县","sort": 4},  
                      {"Code": "540224","Name": "萨迦县","sort": 5},  
                      {"Code": "540225","Name": "拉孜县","sort": 6},  
                      {"Code": "540226","Name": "昂仁县","sort": 7},  
                      {"Code": "540227","Name": "谢通门县","sort": 8},  
                      {"Code": "540228","Name": "白朗县","sort": 9},  
                      {"Code": "540229","Name": "仁布县","sort": 10},  
                      {"Code": "540230","Name": "康马县","sort": 11},  
                      {"Code": "540231","Name": "定结县","sort": 12}, 
                      {"Code": "540232","Name": "仲巴县","sort": 13}, 
                      {"Code": "540233","Name": "亚东县","sort": 14}, 
                      {"Code": "540234","Name": "吉隆县","sort": 15}, 
                      {"Code": "540235","Name": "聂拉木县","sort": 16}, 
                      {"Code": "540236","Name": "萨嘎县","sort": 17}, 
                      {"Code": "540237","Name": "岗巴县","sort": 18}
              ]},
              {"Code": "542200","Name": "昌都市","sort": 3,"level": [
                      {"Code": "540302","Name": "卡若区","sort": 1}, 
                      {"Code": "540321","Name": "江达县","sort": 2}, 
                      {"Code": "540322","Name": "贡觉县","sort": 3}, 
                      {"Code": "540323","Name": "类乌齐县","sort": 4}, 
                      {"Code": "540324","Name": "丁青县","sort": 5}, 
                      {"Code": "540325","Name": "察雅县","sort": 6}, 
                      {"Code": "540326","Name": "八宿县","sort": 7}, 
                      {"Code": "540327","Name": "左贡县","sort": 8}, 
                      {"Code": "540328","Name": "芒康县","sort": 9}, 
                      {"Code": "540329","Name": "洛隆县","sort": 10}, 
                      {"Code": "540330","Name": "边坝县","sort": 11}
              ]},  
              {"Code": "542300","Name": "林芝市","sort": 4,"level": [
                      {"Code": "540402","Name": "巴宜区","sort": 1}, 
                      {"Code": "540421","Name": "工布江达县","sort": 2}, 
                      {"Code": "540422","Name": "米林县","sort": 3}, 
                      {"Code": "540423","Name": "墨脱县","sort": 4}, 
                      {"Code": "540424","Name": "波密县","sort": 5}, 
                      {"Code": "540425","Name": "察隅县","sort": 6}, 
                      {"Code": "540426","Name": "朗县","sort": 7}
              ]},  
              {"Code": "542400","Name": "山南市","sort": 5,"level": [
                      {"Code": "540501","Name": "市辖区","sort": 1}, 
                      {"Code": "540502","Name": "乃东区","sort": 2},  
                      {"Code": "540521","Name": "扎囊县","sort": 3},  
                      {"Code": "540522","Name": "贡嘎县","sort": 4},  
                      {"Code": "540523","Name": "桑日县","sort": 5},  
                      {"Code": "540524","Name": "琼结县","sort": 6},  
                      {"Code": "540525","Name": "曲松县","sort": 7},  
                      {"Code": "540526","Name": "措美县","sort": 8},  
                      {"Code": "540527","Name": "洛扎县","sort": 9}, 
                      {"Code": "540528","Name": "加查县","sort": 10}, 
                      {"Code": "540529","Name": "隆子县","sort": 11}, 
                      {"Code": "540530","Name": "错那县","sort": 12}, 
                      {"Code": "540531","Name": "浪卡子县","sort": 13}
              ]},  
              {"Code": "542500","Name": "那曲地区","sort": 6,"level": [
                      {"Code": "542421","Name": "那曲县","sort": 1}, 
                      {"Code": "542422","Name": "嘉黎县","sort": 2}, 
                      {"Code": "542423","Name": "比如县","sort": 3}, 
                      {"Code": "542424","Name": "聂荣县","sort": 4}, 
                      {"Code": "542425","Name": "安多县","sort": 5}, 
                      {"Code": "542426","Name": "申扎县","sort": 6}, 
                      {"Code": "542427","Name": "索县","sort": 7}, 
                      {"Code": "542428","Name": "班戈县","sort": 8}, 
                      {"Code": "542429","Name": "巴青县","sort": 9}, 
                      {"Code": "542430","Name": "尼玛县","sort": 10}, 
                      {"Code": "542431","Name": "双湖县","sort": 11}
              ]},  
              {"Code": "542600","Name": "阿里地区","sort": 7,"level": [
                      {"Code": "542521","Name": "普兰县","sort": 1}, 
                      {"Code": "542522","Name": "札达县","sort": 2},  
                      {"Code": "542523","Name": "噶尔县","sort": 3},  
                      {"Code": "542524","Name": "日土县","sort": 4},  
                      {"Code": "542525","Name": "革吉县","sort": 5},  
                      {"Code": "542526","Name": "改则县","sort": 6},  
                      {"Code": "542527","Name": "措勤县","sort": 7} 
              ]}  
          ]
    },
    {
          "Code": "610000",
          "Name": "陕西省",
          "level": [
              {"Code": "610100","Name": "西安市","sort": 1,"level": [
                      {"Code": "610101","Name": "市辖区","sort": 1}, 
                      {"Code": "610102","Name": "新城区","sort": 2}, 
                      {"Code": "610103","Name": "碑林区","sort": 3}, 
                      {"Code": "610104","Name": "莲湖区","sort": 4}, 
                      {"Code": "610111","Name": "灞桥区","sort": 5}, 
                      {"Code": "610112","Name": "未央区","sort": 6}, 
                      {"Code": "610113","Name": "雁塔区","sort": 7}, 
                      {"Code": "610114","Name": "阎良区","sort": 8}, 
                      {"Code": "610115","Name": "临潼区","sort": 9},
                      {"Code": "610116","Name": "长安区","sort": 10},
                      {"Code": "610117","Name": "高陵区","sort": 11},
                      {"Code": "610122","Name": "蓝田县","sort": 12},
                      {"Code": "610124","Name": "周至县","sort": 13},
                      {"Code": "610125","Name": "户县","sort": 14}
              ]},
              {"Code": "610200","Name": "铜川市","sort": 2,"level": [
                      {"Code": "610201","Name": "市辖区区","sort": 1}, 
                      {"Code": "610202","Name": "王益区","sort": 2}, 
                      {"Code": "610203","Name": "印台区","sort": 3}, 
                      {"Code": "610204","Name": "耀州区","sort": 4}, 
                      {"Code": "610222","Name": "宜君县","sort": 5}, 
              ]},
              {"Code": "610300","Name": "宝鸡市","sort": 3,"level": [
                      {"Code": "610201","Name": "市辖区","sort": 1},
                      {"Code": "610202","Name": "王益区","sort": 2},
                      {"Code": "610203","Name": "印台区","sort": 3},
                      {"Code": "610204","Name": "耀州区","sort": 4},
                      {"Code": "610222","Name": "宜君县","sort": 5},
                      {"Code": "610301","Name": "市辖区","sort": 6},
                      {"Code": "610302","Name": "渭滨区","sort": 7},
                      {"Code": "610303","Name": "金台区","sort": 8},
                      {"Code": "610304","Name": "陈仓区","sort": 9},
                      {"Code": "610322","Name": "凤翔县","sort": 10},
                      {"Code": "610323","Name": "岐山县","sort": 11},      
                      {"Code": "610324","Name": "扶风县","sort": 12},      
                      {"Code": "610326","Name": "眉县","sort": 13},      
                      {"Code": "610327","Name": "陇县","sort": 14},      
                      {"Code": "610328","Name": "千阳县","sort": 15},      
                      {"Code": "610329","Name": "麟游县","sort": 16},      
                      {"Code": "610330","Name": "凤县","sort": 17},      
                      {"Code": "610331","Name": "太白县","sort": 18}
              ]},  
              {"Code": "610400","Name": "咸阳市","sort": 4,"level": [
                      {"Code": "610401","Name": "市辖区","sort": 1},      
                      {"Code": "610402","Name": "秦都区","sort": 2},      
                      {"Code": "610403","Name": "杨陵区","sort": 3},      
                      {"Code": "610404","Name": "渭城区","sort": 4},      
                      {"Code": "610422","Name": "三原县","sort": 5},      
                      {"Code": "610423","Name": "泾阳县","sort": 6},      
                      {"Code": "610424","Name": "乾县","sort": 7},      
                      {"Code": "610425","Name": "礼泉县","sort": 8},      
                      {"Code": "610426","Name": "永寿县","sort": 9},      
                      {"Code": "610427","Name": "彬县","sort": 10},      
                      {"Code": "610428","Name": "长武县","sort": 11},      
                      {"Code": "610429","Name": "旬邑县","sort": 12},      
                      {"Code": "610430","Name": "淳化县","sort": 13},      
                      {"Code": "610431","Name": "武功县","sort": 14},      
                      {"Code": "610481","Name": "兴平市","sort": 15}
              ]},  
              {"Code": "610500","Name": "渭南市","sort": 5,"level": [
                      {"Code": "610501","Name": "市辖区","sort": 1},       
                      {"Code": "610502","Name": "临渭区","sort": 2},       
                      {"Code": "610503","Name": "华州区","sort": 3},       
                      {"Code": "610522","Name": "潼关县","sort": 4},       
                      {"Code": "610523","Name": "大荔县","sort": 5},       
                      {"Code": "610524","Name": "合阳县","sort": 6},       
                      {"Code": "610525","Name": "澄城县","sort": 7},       
                      {"Code": "610526","Name": "蒲城县","sort": 8},       
                      {"Code": "610527","Name": "白水县","sort": 9},      
                      {"Code": "610528","Name": "富平县","sort": 10},     
                      {"Code": "610581","Name": "韩城市","sort": 11},     
                      {"Code": "610582","Name": "华阴市","sort": 12}
              ]},  
              {"Code": "610600","Name": "延安市","sort": 6,"level": [
                      {"Code": "610601","Name": "市辖区","sort": 1},      
                      {"Code": "610602","Name": "宝塔区","sort": 2},      
                      {"Code": "610603","Name": "安塞区","sort": 3},      
                      {"Code": "610621","Name": "延长县","sort": 4},      
                      {"Code": "610622","Name": "延川县","sort": 5},      
                      {"Code": "610623","Name": "子长县","sort": 6},      
                      {"Code": "610625","Name": "志丹县","sort": 7},      
                      {"Code": "610626","Name": "吴起县","sort": 8},      
                      {"Code": "610627","Name": "甘泉县","sort": 9},      
                      {"Code": "610628","Name": "富县","sort":10},     
                      {"Code": "610629","Name": "洛川县","sort": 11},     
                      {"Code": "610630","Name": "宜川县","sort": 12},      
                      {"Code": "610631","Name": "黄龙县","sort": 13},     
                      {"Code": "610632","Name": "黄陵县","sort": 14}
              ]},  
              {"Code": "610700","Name": "汉中市","sort": 7,"level": [
                      {"Code": "610701","Name": "市辖区","sort": 1},     
                      {"Code": "610702","Name": "汉台区","sort": 2},     
                      {"Code": "610721","Name": "南郑县","sort": 3},     
                      {"Code": "610722","Name": "城固县","sort": 4},     
                      {"Code": "610723","Name": "洋县","sort": 5},     
                      {"Code": "610724","Name": "西乡县","sort": 6},     
                      {"Code": "610725","Name": "勉县","sort": 7},     
                      {"Code": "610726","Name": "宁强县","sort": 8},     
                      {"Code": "610727","Name": "略阳县","sort": 9},     
                      {"Code": "610728","Name": "镇巴县","sort": 10},     
                      {"Code": "610729","Name": "留坝县","sort": 11},     
                      {"Code": "610730","Name": "佛坪县","sort": 12}
              ]},                                              
              {"Code": "610800","Name": "榆林市","sort": 8,"level": [
                      {"Code": "610801","Name": "市辖区","sort": 1},      
                      {"Code": "610802","Name": "榆阳区","sort": 2},      
                      {"Code": "610803","Name": "横山区","sort": 3},      
                      {"Code": "610821","Name": "神木县","sort": 4},      
                      {"Code": "610822","Name": "府谷县","sort": 5},      
                      {"Code": "610824","Name": "靖边县","sort": 6},      
                      {"Code": "610825","Name": "定边县","sort": 7},      
                      {"Code": "610826","Name": "绥德县","sort": 8},      
                      {"Code": "610827","Name": "米脂县","sort": 9},      
                      {"Code": "610828","Name": "佳县","sort": 10},       
                      {"Code": "610829","Name": "吴堡县","sort": 11},     
                      {"Code": "610830","Name": "清涧县","sort": 12},     
                      {"Code": "610831","Name": "子洲县","sort": 13} 
              ]},  
              {"Code": "610900","Name": "安康市","sort": 9,"level": [
                      {"Code": "610901","Name": "市辖区","sort": 1},      
                      {"Code": "610902","Name": "汉滨区","sort": 2},      
                      {"Code": "610921","Name": "汉阴县","sort": 3},      
                      {"Code": "610922","Name": "石泉县","sort": 4},      
                      {"Code": "610923","Name": "宁陕县","sort": 5},      
                      {"Code": "610924","Name": "紫阳县","sort": 6},     
                      {"Code": "610925","Name": "岚皋县","sort": 7},     
                      {"Code": "610926","Name": "平利县","sort": 8},     
                      {"Code": "610927","Name": "镇坪县","sort": 9},     
                      {"Code": "610928","Name": "旬阳县","sort": 10},     
                      {"Code": "610929","Name": "白河县","sort": 11}
              ]},  
              {"Code": "611000","Name": "商洛市","sort": 10,"level": [
                      {"Code": "611001","Name": "市辖区","sort": 1},  
                      {"Code": "611002","Name": "商州区","sort": 2},  
                      {"Code": "611021","Name": "洛南县","sort": 3},  
                      {"Code": "611022","Name": "丹凤县","sort": 4},  
                      {"Code": "611023","Name": "商南县","sort": 5},  
                      {"Code": "611024","Name": "山阳县","sort": 6},  
                      {"Code": "611025","Name": "镇安县","sort": 7},  
                      {"Code": "611026","Name": "柞水县","sort": 8}   

              ]},     
          ]
    },
    {
          "Code": "620000",
          "Name": "甘肃省",
          "level": [
              {"Code": "620100","Name": "兰州市","sort": 1,"level": [
                      {"Code": "620101","Name": "市辖区","sort": 1},     
                      {"Code": "620102","Name": "城关区","sort": 2},     
                      {"Code": "620103","Name": "七里河区","sort": 3},     
                      {"Code": "620104","Name": "西固区","sort": 4},    
                      {"Code": "620105","Name": "安宁区","sort": 5},    
                      {"Code": "620111","Name": "红古区","sort": 6},    
                      {"Code": "620121","Name": "永登县","sort": 7},    
                      {"Code": "620122","Name": "皋兰县","sort": 8},    
                      {"Code": "620123","Name": "榆中县","sort": 9}
              ]},
              {"Code": "620200","Name": "嘉峪关市","sort": 2,"level": [
                      {"Code": "620201","Name": "市辖区","sort": 1}
              ]},
              {"Code": "620300","Name": "金昌市","sort": 3,"level": [
                      {"Code": "620301","Name": "市辖区","sort": 1},     
                      {"Code": "620302","Name": "金川区","sort": 2},     
                      {"Code": "620321","Name": "永昌县","sort": 3},     
              ]},  
              {"Code": "620400","Name": "白银市","sort": 4,"level": [
                      {"Code": "620401","Name": "市辖区","sort": 1},     
                      {"Code": "620402","Name": "白银区","sort": 2},     
                      {"Code": "620403","Name": "平川区","sort": 3},     
                      {"Code": "620421","Name": "靖远县","sort": 4},     
                      {"Code": "620422","Name": "会宁县","sort": 5},      
                      {"Code": "620423","Name": "景泰县","sort": 6}  
              ]},  
              {"Code": "620500","Name": "天水市","sort": 5,"level": [
                      {"Code": "620501","Name": "市辖区","sort": 1},    
                      {"Code": "620502","Name": "秦州区","sort": 2},    
                      {"Code": "620503","Name": "麦积区","sort": 3},    
                      {"Code": "620521","Name": "清水县","sort": 4},    
                      {"Code": "620522","Name": "秦安县","sort": 5},    
                      {"Code": "620523","Name": "甘谷县","sort": 6},    
                      {"Code": "620524","Name": "武山县","sort": 7}, 
                      {"Code": "620525","Name": "张家川回族自治县","sort": 8}
              ]},  
              {"Code": "620600","Name": "武威市","sort": 6,"level": [
                      {"Code": "620601","Name": "市辖区","sort": 1},    
                      {"Code": "620602","Name": "凉州区","sort": 2},    
                      {"Code": "620621","Name": "民勤县","sort": 3},    
                      {"Code": "620622","Name": "古浪县","sort": 4},    
                      {"Code": "620623","Name": "天祝藏族自治县","sort": 5}
              ]},  
              {"Code": "620700","Name": "张掖市","sort": 7,"level": [
                      {"Code": "620701","Name": "市辖区","sort": 1},    
                      {"Code": "620702","Name": "甘州区","sort": 2},    
                      {"Code": "620721","Name": "肃南裕固族自治县","sort": 3},   
                      {"Code": "620722","Name": "民乐县","sort": 4},    
                      {"Code": "620723","Name": "临泽县","sort": 5},    
                      {"Code": "620724","Name": "高台县","sort": 6},    
                      {"Code": "620725","Name": "山丹县","sort": 7}
              ]},  
              {"Code": "620800","Name": "平凉市","sort": 8,"level": [
                      {"Code": "620801","Name": "市辖区","sort": 1},    
                      {"Code": "620802","Name": "崆峒区","sort": 2},    
                      {"Code": "620821","Name": "泾川县","sort": 3},    
                      {"Code": "620822","Name": "灵台县","sort": 4},    
                      {"Code": "620823","Name": "崇信县","sort": 5},    
                      {"Code": "620824","Name": "华亭县","sort": 6},    
                      {"Code": "620825","Name": "庄浪县","sort": 7},    
                      {"Code": "620826","Name": "静宁县","sort": 8}
              ]},  
              {"Code": "620900","Name": "酒泉市","sort": 9,"level": [
                      {"Code": "620901","Name": "市辖区","sort": 1},    
                      {"Code": "620902","Name": "肃州区","sort": 2},    
                      {"Code": "620921","Name": "金塔县","sort": 3},    
                      {"Code": "620922","Name": "瓜州县","sort": 4},    
                      {"Code": "620923","Name": "肃北蒙古族自治县","sort": 5},   
                      {"Code": "620924","Name": "阿克塞哈萨克族自治县","sort": 6},  
                      {"Code": "620981","Name": "玉门市","sort": 7},    
                      {"Code": "620982","Name": "敦煌市","sort": 8}  
              ]},  
              {"Code": "621000","Name": "庆阳市","sort": 10,"level": [
                      {"Code": "621001","Name": "市辖区","sort": 1},    
                      {"Code": "621002","Name": "西峰区","sort": 2},    
                      {"Code": "621021","Name": "庆城县","sort": 3},    
                      {"Code": "621022","Name": "环县","sort": 4},    
                      {"Code": "621023","Name": "华池县","sort": 5},    
                      {"Code": "621024","Name": "合水县","sort": 6},    
                      {"Code": "621025","Name": "正宁县","sort": 7},    
                      {"Code": "621026","Name": "宁县","sort": 8},    
                      {"Code": "621027","Name": "镇原县","sort": 9},
              ]},  
              {"Code": "621100","Name": "定西市","sort": 11,"level": [
                      {"Code": "621101","Name": "市辖区","sort": 1},    
                      {"Code": "621102","Name": "安定区","sort": 2},    
                      {"Code": "621121","Name": "通渭县","sort": 3},    
                      {"Code": "621122","Name": "陇西县","sort": 4},   
                      {"Code": "621123","Name": "渭源县","sort": 5},   
                      {"Code": "621124","Name": "临洮县","sort": 6},   
                      {"Code": "621125","Name": "漳县","sort": 7},   
                      {"Code": "621126","Name": "岷县","sort": 8}
              ]},
              {"Code": "621200","Name": "陇南市","sort": 12,"level": [
                      {"Code": "621201","Name": "市辖区","sort": 1},   
                      {"Code": "621202","Name": "武都区","sort": 2},   
                      {"Code": "621221","Name": "成县","sort": 3},   
                      {"Code": "621222","Name": "文县","sort": 4},   
                      {"Code": "621223","Name": "宕昌县","sort": 5},   
                      {"Code": "621224","Name": "康县","sort": 6},   
                      {"Code": "621225","Name": "西和县","sort": 7},   
                      {"Code": "621226","Name": "礼县","sort": 8},   
                      {"Code": "621227","Name": "徽县","sort": 9},   
                      {"Code": "621228","Name": "两当县","sort": 10}
              ]},
              {"Code": "622900","Name": "临夏回族自治州","sort": 13,"level": [
                      {"Code": "622901","Name": "临夏市","sort": 1},   
                      {"Code": "622921","Name": "临夏县","sort": 2},   
                      {"Code": "622922","Name": "康乐县","sort": 3},   
                      {"Code": "622923","Name": "永靖县","sort": 4},   
                      {"Code": "622924","Name": "广河县","sort": 5},   
                      {"Code": "622925","Name": "和政县","sort": 6},   
                      {"Code": "622926","Name": "东乡族自治县","sort": 7},   
                      {"Code": "622927","Name": "积石山保安族东乡族撒拉族自治县","sort": 8}
              ]}, 
              {"Code": "623000","Name": "甘南藏族自治州","sort": 14,"level": [
                      {"Code": "623001","Name": "合作市","sort": 1},   
                      {"Code": "623021","Name": "临潭县","sort": 2},   
                      {"Code": "623022","Name": "卓尼县","sort": 3},   
                      {"Code": "623023","Name": "舟曲县","sort": 4},   
                      {"Code": "623024","Name": "迭部县","sort": 5},   
                      {"Code": "623025","Name": "玛曲县","sort": 6},   
                      {"Code": "623026","Name": "碌曲县","sort": 7},   
                      {"Code": "623027","Name": "夏河县","sort": 8}
              ]},      
          ]
    },
    {
          "Code": "630000",
          "Name": "青海省",
          "level": [
              {"Code": "630100","Name": "西宁市","sort": 1,"level": [
                      {"Code": "630101","Name": "市辖区","sort": 1},   
                      {"Code": "630102","Name": "城东区","sort": 2},   
                      {"Code": "630103","Name": "城中区","sort": 3},   
                      {"Code": "630104","Name": "城西区","sort": 4},   
                      {"Code": "630105","Name": "城北区","sort": 5},   
                      {"Code": "630121","Name": "大通回族土族自治县","sort": 6},  
                      {"Code": "630122","Name": "湟中县","sort": 7},   
                      {"Code": "630123","Name": "湟源县","sort": 8}
              ]},
              {"Code": "632100","Name": "海东市","sort": 2,"level": [
                      {"Code": "630202","Name": "乐都区","sort": 1},   
                      {"Code": "630203","Name": "平安区","sort": 2},   
                      {"Code": "630222","Name": "民和回族土族自治县","sort": 3},  
                      {"Code": "630223","Name": "互助土族自治县","sort": 4},   
                      {"Code": "630224","Name": "化隆回族自治县","sort": 5},   
                      {"Code": "630225","Name": "循化撒拉族自治县","sort": 6}
              ]},
              {"Code": "632200","Name": "海北藏族自治州","sort": 3,"level": [
                      {"Code": "632221","Name": "门源回族自治县","sort": 1},   
                      {"Code": "632222","Name": "祁连县","sort": 2},   
                      {"Code": "632223","Name": "海晏县","sort": 3},   
                      {"Code": "632224","Name": "刚察县","sort": 4}
              ]},  
              {"Code": "632300","Name": "黄南藏族自治州","sort": 4,"level": [
                       {"Code": "632321","Name": "同仁县","sort": 1},   
                      {"Code": "632322","Name": "尖扎县","sort": 2},   
                      {"Code": "632323","Name": "泽库县","sort": 3},   
                      {"Code": "632324","Name": "河南蒙古族自治县","sort": 4}
              ]},  
              {"Code": "632500","Name": "海南藏族自治州","sort": 5,"level": [
                      {"Code": "632521","Name": "共和县","sort": 1},   
                      {"Code": "632522","Name": "同德县","sort": 2},   
                      {"Code": "632523","Name": "贵德县","sort": 3},   
                      {"Code": "632524","Name": "兴海县","sort": 4},   
                      {"Code": "632525","Name": "贵南县","sort": 5}
              ]},  
              {"Code": "632600","Name": "果洛藏族自治州","sort": 6,"level": [
                      {"Code": "632621","Name": "玛沁县","sort": 1},   
                      {"Code": "632622","Name": "班玛县","sort": 2},   
                      {"Code": "632623","Name": "甘德县","sort": 3},   
                      {"Code": "632624","Name": "达日县","sort": 4},   
                      {"Code": "632625","Name": "久治县","sort": 5},   
                      {"Code": "632626","Name": "玛多县","sort": 6}
              ]},  
              {"Code": "632700","Name": "玉树藏族自治州","sort": 7,"level": [
                      {"Code": "632701","Name": "玉树市","sort": 1},  
                      {"Code": "632722","Name": "杂多县","sort": 2},  
                      {"Code": "632723","Name": "称多县","sort": 3},  
                      {"Code": "632724","Name": "治多县","sort": 4},  
                      {"Code": "632725","Name": "囊谦县","sort": 5},  
                      {"Code": "632726","Name": "曲麻莱县","sort": 6}
              ]},  
              {"Code": "632800","Name": "海西蒙古族藏族自治州","sort": 8,"level": [
                      {"Code": "632801","Name": "格尔木市","sort": 1},  
                      {"Code": "632802","Name": "德令哈市","sort": 2},  
                      {"Code": "632821","Name": "乌兰县","sort": 3},  
                      {"Code": "632822","Name": "都兰县","sort": 4},  
                      {"Code": "632823","Name": "天峻县","sort": 5}
              ]},    
          ]
    },
    {
          "Code": "640000",
          "Name": "宁夏回族自治区",
          "level": [
              {"Code": "640100","Name": "银川市 ","sort": 1,"level": [
                      {"Code": "640101","Name": "市辖区","sort": 1},  
                      {"Code": "640104","Name": "兴庆区","sort": 2},  
                      {"Code": "640105","Name": "西夏区","sort": 3},  
                      {"Code": "640106","Name": "金凤区","sort": 4},  
                      {"Code": "640121","Name": "永宁县","sort": 5},  
                      {"Code": "640122","Name": "贺兰县","sort": 6},  
                      {"Code": "640181","Name": "灵武市","sort": 7}
              ]},
              {"Code": "640200","Name": "石嘴山市","sort": 2,"level": [
                      {"Code": "640201","Name": "市辖区","sort": 1},  
                      {"Code": "640202","Name": "大武口区","sort": 2},  
                      {"Code": "640205","Name": "惠农区","sort": 3},  
                      {"Code": "640221","Name": "平罗县","sort": 4}
              ]},
              {"Code": "640300","Name": "吴忠市 ","sort": 3,"level": [
                      {"Code": "640301","Name": "市辖区","sort": 1},  
                      {"Code": "640302","Name": "利通区","sort": 2},  
                      {"Code": "640303","Name": "红寺堡区","sort": 3},  
                      {"Code": "640323","Name": "盐池县","sort": 4},  
                      {"Code": "640324","Name": "同心县","sort": 5},  
                      {"Code": "640381","Name": "青铜峡市","sort": 6}
              ]},  
              {"Code": "640400","Name": "固原市 ","sort": 4,"level": [
                      {"Code": "640401","Name": "市辖区","sort": 1},  
                      {"Code": "640402","Name": "原州区","sort": 2},  
                      {"Code": "640422","Name": "西吉县","sort": 3},  
                      {"Code": "640423","Name": "隆德县","sort": 4},  
                      {"Code": "640424","Name": "泾源县","sort": 5},  
                      {"Code": "640425","Name": "彭阳县","sort": 6}
              ]},  
              {"Code": "640500","Name": "中卫市 ","sort": 5,"level": [
                      {"Code": "640501","Name": "市辖区","sort": 1},  
                      {"Code": "640502","Name": "沙坡头区","sort": 2},  
                      {"Code": "640521","Name": "中宁县","sort": 3},  
                      {"Code": "640522","Name": "海原县","sort": 4}
              ]},      
          ]
    },
    {
          "Code": "650000",
          "Name": "新疆维吾尔自治区",
          "level": [
              {"Code": "650100","Name": "乌鲁木齐市","sort": 1,"level": [
                      {"Code": "650101","Name": "市辖区","sort": 1},  
                      {"Code": "650102","Name": "天山区","sort": 2},  
                      {"Code": "650103","Name": "沙依巴克区","sort": 3},  
                      {"Code": "650104","Name": "新市区","sort": 4},  
                      {"Code": "650105","Name": "水磨沟区","sort": 5},  
                      {"Code": "650106","Name": "头屯河区","sort": 6},  
                      {"Code": "650107","Name": "达坂城区","sort": 7},  
                      {"Code": "650109","Name": "米东区","sort": 8},  
                      {"Code": "650121","Name": "乌鲁木齐县","sort": 9}
              ]},
              {"Code": "650200","Name": "克拉玛依市","sort": 2,"level": [
                      {"Code": "650201","Name": "市辖区","sort": 1},  
                      {"Code": "650202","Name": "独山子区","sort": 2},  
                      {"Code": "650203","Name": "克拉玛依区","sort": 3},  
                      {"Code": "650204","Name": "白碱滩区","sort": 4},  
                      {"Code": "650205","Name": "乌尔禾区","sort": 5}
              ]},
              {"Code": "652100","Name": "吐鲁番市","sort": 3,"level": [
                      {"Code": "650402","Name": "高昌区","sort": 1},  
                      {"Code": "650421","Name": "鄯善县","sort": 2},  
                      {"Code": "650422","Name": "托克逊县","sort": 3}
              ]},  
              {"Code": "652200","Name": "哈密市","sort": 4,"level": [
                      {"Code": "650502","Name": "伊州区","sort": 1},  
                      {"Code": "650521","Name": "巴里坤哈萨克自治县","sort": 2}, 
                      {"Code": "650522","Name": "伊吾县","sort": 3}
              ]},  
              {"Code": "652300","Name": "昌吉回族自治州","sort": 5,"level": [
                      {"Code": "652301","Name": "昌吉市","sort": 1},  
                      {"Code": "652302","Name": "阜康市","sort": 2},  
                      {"Code": "652323","Name": "呼图壁县","sort": 3},  
                      {"Code": "652324","Name": "玛纳斯县","sort": 4},  
                      {"Code": "652325","Name": "奇台县","sort": 5},  
                      {"Code": "652327","Name": "吉木萨尔县","sort": 6},  
                      {"Code": "652328","Name": "木垒哈萨克自治县","sort": 7}
              ]},  
              {"Code": "652700","Name": "博尔塔拉蒙古自治州","sort": 6,"level": [
                      {"Code": "652701","Name": "博乐市","sort": 1}, 
                      {"Code": "652702","Name": "阿拉山口市","sort": 2}, 
                      {"Code": "652722","Name": "精河县","sort": 3}, 
                      {"Code": "652723","Name": "温泉县","sort": 4}
              ]},  
              {"Code": "652800","Name": "巴音郭楞蒙古自治州","sort": 7,"level": [
                      {"Code": "652801","Name": "库尔勒市","sort": 1}, 
                      {"Code": "652822","Name": "轮台县","sort": 2}, 
                      {"Code": "652823","Name": "尉犁县","sort": 3}, 
                      {"Code": "652824","Name": "若羌县","sort": 4}, 
                      {"Code": "652825","Name": "且末县","sort": 5}, 
                      {"Code": "652826","Name": "焉耆回族自治县","sort": 6}, 
                      {"Code": "652827","Name": "和静县","sort": 7}, 
                      {"Code": "652828","Name": "和硕县","sort": 8}, 
                      {"Code": "652829","Name": "博湖县","sort": 9}
              ]},  
              {"Code": "652900","Name": "阿克苏地区","sort": 8,"level": [
                      {"Code": "652901","Name": "阿克苏市","sort": 1}, 
                      {"Code": "652922","Name": "温宿县","sort": 2}, 
                      {"Code": "652923","Name": "库车县","sort": 3}, 
                      {"Code": "652924","Name": "沙雅县","sort": 4}, 
                      {"Code": "652925","Name": "新和县","sort": 5}, 
                      {"Code": "652926","Name": "拜城县","sort": 6}, 
                      {"Code": "652927","Name": "乌什县","sort": 7}, 
                      {"Code": "652928","Name": "阿瓦提县","sort": 8}, 
                      {"Code": "652929","Name": "柯坪县","sort": 9}
              ]},  
              {"Code": "653000","Name": "克孜勒苏柯尔克孜自治州","sort": 9,"level": [
                      {"Code": "653001","Name": "阿图什市","sort": 1}, 
                      {"Code": "653022","Name": "阿克陶县","sort": 2}, 
                      {"Code": "653023","Name": "阿合奇县","sort": 3}, 
                      {"Code": "653024","Name": "乌恰县","sort": 4}
              ]},  
              {"Code": "653100","Name": "喀什地区","sort": 10,"level": [
                      {"Code": "653101","Name": "喀什市","sort": 1}, 
                      {"Code": "653121","Name": "疏附县","sort": 2}, 
                      {"Code": "653122","Name": "疏勒县","sort": 3}, 
                      {"Code": "653123","Name": "英吉沙县","sort": 4}, 
                      {"Code": "653124","Name": "泽普县","sort": 5}, 
                      {"Code": "653125","Name": "莎车县","sort": 6}, 
                      {"Code": "653126","Name": "叶城县","sort": 7}, 
                      {"Code": "653127","Name": "麦盖提县","sort": 8}, 
                      {"Code": "653128","Name": "岳普湖县","sort": 9}, 
                      {"Code": "653129","Name": "伽师县","sort": 10}, 
                      {"Code": "653130","Name": "巴楚县","sort": 11}, 
                      {"Code": "653131","Name": "塔什库尔干塔吉克自治县","sort": 12}
              ]},  
              {"Code": "653200","Name": "和田地区","sort": 11,"level": [
                      {"Code": "653201","Name": "和田市","sort": 1}, 
                      {"Code": "653221","Name": "和田县","sort": 2}, 
                      {"Code": "653222","Name": "墨玉县","sort": 3}, 
                      {"Code": "653223","Name": "皮山县","sort": 4}, 
                      {"Code": "653224","Name": "洛浦县","sort": 5}, 
                      {"Code": "653225","Name": "策勒县","sort": 6}, 
                      {"Code": "653226","Name": "于田县","sort": 7}, 
                      {"Code": "653227","Name": "民丰县","sort": 8}
              ]},
              {"Code": "654000","Name": "伊犁哈萨克自治州","sort": 12,"level": [
                      {"Code": "654002","Name": "伊宁市","sort": 1}, 
                      {"Code": "654003","Name": "奎屯市","sort": 2}, 
                      {"Code": "654004","Name": "霍尔果斯市","sort": 3}, 
                      {"Code": "654021","Name": "伊宁县","sort": 4}, 
                      {"Code": "654022","Name": "察布查尔锡伯自治县","sort": 5}, 
                      {"Code": "654023","Name": "霍城县","sort": 6}, 
                      {"Code": "654024","Name": "巩留县","sort": 7}, 
                      {"Code": "654025","Name": "新源县","sort": 8}, 
                      {"Code": "654026","Name": "昭苏县","sort": 9}, 
                      {"Code": "654027","Name": "特克斯县","sort": 10}, 
                      {"Code": "654028","Name": "尼勒克县","sort": 11}
              ]},
              {"Code": "654200","Name": "塔城地区","sort": 13,"level": [
                      {"Code": "654201","Name": "塔城市","sort": 1}, 
                      {"Code": "654202","Name": "乌苏市","sort": 2}, 
                      {"Code": "654221","Name": "额敏县","sort": 3}, 
                      {"Code": "654223","Name": "沙湾县","sort": 4}, 
                      {"Code": "654224","Name": "托里县","sort": 5}, 
                      {"Code": "654225","Name": "裕民县","sort": 6}, 
                      {"Code": "654226","Name": "和布克赛尔蒙古自治县","sort": 7}
              ]}, 
              {"Code": "654300","Name": "阿勒泰地区泰地区","sort": 14,"level": [
                      {"Code": "654301","Name": "阿勒泰市","sort": 1},
                      {"Code": "654321","Name": "布尔津县","sort": 2},
                      {"Code": "654322","Name": "富蕴县","sort": 3},
                      {"Code": "654323","Name": "福海县","sort": 4},
                      {"Code": "654324","Name": "哈巴河县","sort": 5},
                      {"Code": "654325","Name": "青河县","sort": 6},
                      {"Code": "654326","Name": "吉木乃县","sort": 7}
              ]}, 
              {"Code": "659000","Name": "自治区直辖县","sort": 15,"level": [
                      {"Code": "659001","Name": "石河子市","sort": 1},
                      {"Code": "659002","Name": "阿拉尔市","sort": 2},
                      {"Code": "659003","Name": "图木舒克市","sort": 3},
                      {"Code": "659004","Name": "五家渠市","sort": 4},
                      {"Code": "659006","Name": "铁门关市","sort": 5}
              ]
			  }         
          ]
    }
];

    if ( typeof module != 'undefined' && module.exports ) {
        module.exports = cityData;
    } else {
        window.cityData = cityData;
    }

})(window, document, Math);