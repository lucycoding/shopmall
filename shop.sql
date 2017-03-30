/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50622
Source Host           : 127.0.0.1:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-03-30 21:36:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `AdminType` int(11) DEFAULT NULL,
  `AdminName` varchar(50) DEFAULT NULL,
  `LoginName` varchar(12) DEFAULT NULL,
  `LoginPwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AdminType` (`AdminType`),
  CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`AdminType`) REFERENCES `tb_admintype` (`adminTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '1', '商品主管', 'goodsadmin', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `tb_admin` VALUES ('2', '2', '订单主管', 'ordersadmin', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `tb_admin` VALUES ('3', '3', '用户主管', 'usersadmin', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `tb_admin` VALUES ('4', '4', '超管1', 'admin', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `tb_admin` VALUES ('6', '4', '超管2', 'root', 'db84f1a8d5445f9ac615c57762ac6193');

-- ----------------------------
-- Table structure for `tb_admintype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admintype`;
CREATE TABLE `tb_admintype` (
  `adminTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `adminTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admintype
-- ----------------------------
INSERT INTO `tb_admintype` VALUES ('1', '商品管理员');
INSERT INTO `tb_admintype` VALUES ('2', '订单管理员');
INSERT INTO `tb_admintype` VALUES ('3', '用户管理员');
INSERT INTO `tb_admintype` VALUES ('4', '系统管理员');

-- ----------------------------
-- Table structure for `tb_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `superTypeId` int(11) DEFAULT NULL,
  `goodsName` varchar(200) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `introduce` text,
  `price` float DEFAULT NULL,
  `nowPrice` float DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `produceDate` varchar(20) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `inTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `newgoods` int(11) DEFAULT NULL,
  `salegoods` int(11) DEFAULT NULL,
  `hostgoods` int(11) DEFAULT NULL,
  `specialgoods` int(11) DEFAULT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `superTypeId` (`superTypeId`),
  CONSTRAINT `tb_goods_ibfk_2` FOREIGN KEY (`superTypeId`) REFERENCES `tb_supertype` (`superTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('113', '38', 'Sony/索尼 DSC-W730数码相机 1600万 8倍变焦 正品特价 送自拍镜 ', 'sony', '索尼W730采用了1610万像素的CCD传感器，搭配了25-200mm的8倍变焦镜头，需要注意的是这枚镜头与WX80为卡尔蔡司级别的产品，可以满足绝大普通用户的需求。', '550', '435', 'upload/SonyDSC-W730.jpg', '2014/02/24', '中国', '索尼/sony', '2015-05-05 12:25:11', '0', '0', '0', '1', '1110');
INSERT INTO `tb_goods` VALUES ('114', '38', 'Razer雷蛇 Ouroboros奥罗波若蛇 有线/无线双模式游戏鼠标 顺丰 ', 'razer', '完全可自定义人体工程学设计，适合所有手掌大小以及抓握方式，8200dpi 4G激光传感器，1毫秒游戏级无线技术。掌控无限，鼠标中的艺术品！ ', '899', '799', 'upload/RazerOuroboros.jpg', '2014/02/24', '中国上海', '雷蛇/razer', '2015-05-05 12:25:01', '1', '0', '0', '0', '789');
INSERT INTO `tb_goods` VALUES ('115', '39', 'Lenovo/联想Y510p-ISE(H)4代i7 15寸游戏笔记本电脑独显2G高清屏 ', 'lenovo', '强悍的小Y,联想高端游戏本，2014年顶级显卡，1920*1080P超清屏，最高配置i7四核八线程处理，多任务处理，得心应手，大型游戏，游刃有余。(秒杀目前市面上98%以上的游戏特效全开），更有B5400性能超强，高性价比，超值强悍，值得抢购 ', '3347', '2598', 'upload/LenovoY510p-ISE(H)4.jpg', '2014/02/24', '中国北京', '联想/lenovo', '2015-05-29 07:54:56', '0', '0', '1', '0', '452');
INSERT INTO `tb_goods` VALUES ('116', '39', '联想一体机电脑 C5030 3558U 4G 1T 2G独显 23寸黑白色 C560升级', 'lenovo', '特价提前上市，电商欢乐大派送，有买有送，精美礼品用心配，冰点价，零利润率，C5030，,4G内存、2G独显、1T大硬盘、23英寸全高清大屏，内置高保真多媒体音响、高清摄像头、麦克、无线网卡、满足日常办公 家用。', '3599', '3599', 'upload/LenovoC5030.jpg', '2014/02/24', '中国', '联想/lenovo', '2015-05-05 12:24:52', '0', '0', '0', '1', '5999');
INSERT INTO `tb_goods` VALUES ('117', '39', '华硕台式机 K31AN 四核J2900 4G 500GB GT720 2G 独显 Win8.1 黑 ', 'asus', '华硕台式机（ASUS）K31AN 台式电脑 （四核J2900 4G内存 500GB硬盘 GT720 2G独显 Win8.1 黑色）带21.5寸显示器 显示器型号:VS228DE 正品 顺风包邮 ', '3299', '3199', 'upload/asusK31AN.jpg', '2014/02/24', '中国北京', '华硕/asus', '2015-05-05 12:24:47', '1', '0', '0', '0', '1231');
INSERT INTO `tb_goods` VALUES ('118', '40', 'SMARTISAN/锤子T1（4G）锤子手机 ', 'smartisan', '情怀手机！Smartisan T1 配备骁龙801 系列的 8x74 AC 四核处理器，单核速度可高达 2.5 GHz。 采用索尼 IMX214 第二代 1278 万有效像素。 ', '2450', '2450', 'upload/smartisan.jpg', '2014/02/24', '中国', '锤子科技/smartisan', '2015-05-05 12:24:41', '0', '1', '0', '1', '12310');
INSERT INTO `tb_goods` VALUES ('119', '40', 'Green Orange/青橙 V1超高配置八核三防智能手机 移动联通双4G ', 'greenorange', '三防智能卫星手机 移动联通双4G 户外运动手机 双卡双待 8核64位 1600万 16种特色功能双4G ', '3999', '3999', 'upload/orangeV1.jpg', '2014/02/24', '中国', '青橙/greenorange', '2015-05-05 12:24:28', '0', '0', '0', '1', '4212');
INSERT INTO `tb_goods` VALUES ('120', '40', 'Meitu/美图MK260 (M2) 美图手机2 美图秀秀 自拍神器 美图M2 ', 'meitu', '女神必备--独特外形+全新MEIOS系统|\r\n自拍神器--1600万像素2.0大光圈摄像头--富士通最新Milbeaut图像处理器|\r\n一手掌握--5英寸高清屏|\r\n流畅体验--八核CPU+2G运行内存--绝无卡顿|\r\n暗拍利器--5级美颜 美白 美瞳 瘦脸', '4100', '2599', 'upload/meituM2.png', '2014/02/24', '中国', '美图秀秀/meitu', '2015-05-05 12:24:12', '0', '0', '1', '0', '1212');
INSERT INTO `tb_goods` VALUES ('121', '40', 'Huawei/华为 H60-L01 02 荣耀6手机 移动 联通4G  ', 'huawei', '华为荣耀6手机 移动 联通4G。 纤薄机身，时尚新宠，全球领先的超薄手机.联保1年，店保3年，四核智能手机。 亲们，如果买了货不对版，支持7天无理由退货，买了不满意一样可以退货，总之一句话你不满意就退货，给亲最好的保障。让亲享受购物的愉快！限购一台哦。', '2399', '1400', 'upload/huawei6.jpg', '2014/02/24', '中国深圳', '华为/huawei', '2015-05-05 12:24:07', '0', '0', '1', '0', '567');
INSERT INTO `tb_goods` VALUES ('122', '41', '正品MIUI/小米 小米电视2代49寸高清4K智能3D液晶平板电视机 ', 'xiaomi', '【小米电视2荣获2014红星奖】小米电视2不仅有出色的4K屏幕、精心调校的画质，\r\n还有超越以往电视的8+1高品质扬声器的外置音响,\r\n采用4K电视超强MStar四核1.45GHz 智能电视处理器，\r\nMali-450MP4图形处理器，无论超高清视频还是3D游戏都更加流畅 ', '3999', '3999', 'upload/xiaomiTV2.png', '2014/02/24', '中国北京', '小米/xiaomi', '2015-05-05 12:24:03', '1', '0', '0', '0', '449');
INSERT INTO `tb_goods` VALUES ('123', '41', 'Midea/美的 BCD-515WKM(E)对开门无霜电冰箱 多门节能风冷冰箱', 'midea', '产品参数：\r\n\r\n    产品名称：Midea/美的 BCD-515WKM(...\r\n    美的冰箱型号: BCD-515WKM(E)\r\n    冰箱冷柜机型: 冷藏冷冻冰箱\r\n    制冷方式: 风冷\r\n    箱门结构: 对开双门式\r\n    能效等级: 一级\r\n    总容量: 515L\r\n    尺寸: 922×684×1751mm', '5999', '4999', 'upload/mideaBCD-515.jpg', '2014/02/24', '中国', '美的/midea', '2015-05-05 12:24:00', '1', '0', '0', '0', '2133');
INSERT INTO `tb_goods` VALUES ('124', '41', '西门子洗衣机XQG80-WM10P1601W BLDC无刷电机 ', 'siemens', '大容量，BLDC无刷电机，可洗羽绒服，除菌护肤程序，3大减噪设计 ', '6669', '4199', 'upload/SIEMENS.jpg', '2014/02/24', '中国', '西门子/siemens', '2015-05-05 12:23:54', '1', '0', '0', '0', '4521');
INSERT INTO `tb_goods` VALUES ('125', '41', 'AUX/奥克斯 KFR-35GW/BpHRB+3大1.5P新APF变频挂式智能云空调 ', 'aux', 'AUX/奥克斯 KFR-35GW/BpHRB+3大1.5P新APF变频挂式高端智能云空调 ', '5999', '2799', 'upload/auxKFR-35GW.jpg', '2014/02/24', '中国', '奥克斯/aux', '2015-05-05 12:23:48', '1', '0', '0', '0', '933');
INSERT INTO `tb_goods` VALUES ('126', '41', 'Joyoung/九阳 DJ13B-C630SG 九阳全自动免滤豆浆机', 'Joyoung', '【磨的细】超微劲磨、精钢波浪刀粉碎细腻，研磨充分。豆浆无需再过滤,直接喝！\r\n【磨的香】环绕立体加热，5步营养熬煮，充分的释放大豆营养，豆浆更香浓！\r\n【磨的快】超快制浆，快速制浆仅需17分钟，好用更方便！', '799', '499', 'upload/joyoungDJ13B-C630SG.jpg', '2014/02/24', '中国上海', '九阳/joyoung', '2015-05-05 12:23:42', '0', '1', '0', '1', '323');
INSERT INTO `tb_goods` VALUES ('127', '41', 'SUPOR/苏泊尔CFXB40FC832-75球釜4L正品电饭煲饭锅', 'supor', '①球形厚釜内胆\r\n②三维立体加热配合上盖同步加热，米饭更香甜\r\n③精控智能探头，温度压力精确双控制\r\n④拉丝不锈钢巧克力色外观\r\n⑤不锈钢微压阀，可拆洗内盖，细节决定成败\r\n⑥10大烹饪菜单，4种米饭，4种口感，特设煲仔饭 ', '899', '399', 'upload/supor.jpg', '2014/02/24', '中国北京', '苏泊尔/supor', '2015-05-05 12:23:32', '1', '0', '0', '0', '123');
INSERT INTO `tb_goods` VALUES ('128', '41', 'LFCare正品发廊大功率吹风机理发店负离子电吹风筒家用', 'lfcare', 'LFCare莱弗凯品牌自产自销！至尊配置：【德国发廊超级龙卷风】—【莱弗凯原厂纯铜交流大电机】—【蓝光负离子护发】—【柠檬喷香】—【专利冷风技术夏天吹出冰冷清凉风~】—【创新Turbo涡轮科技风力暴增】', '258', '68', 'upload/lfcare.jpg', '2014/02/24', '中国', '莱弗凯/ifcare', '2015-05-05 12:23:27', '0', '1', '1', '0', '789');
INSERT INTO `tb_goods` VALUES ('129', '41', 'Galanz/格兰仕 G70F20CN1L-DG(B1)微波炉平板光波20L家用镜面', 'gelanz', '第一品牌 烧烤炖煮全能，性价比之王！\r\n配备格兰仕独创智能搅波技术，微波发射更全面无死角！\r\n进口美国戴森微晶平板，效率提高90%以上！\r\n12种预设菜单键，美味一键直达，省时省力省心！\r\n宝贝三围（高271*宽457*深395）二级能效 ', '899', '499', 'upload/galanz.jpg', '2014/02/24', '中国', '格兰仕/gelanz', '2015-05-05 12:23:22', '0', '0', '1', '0', '213');
INSERT INTO `tb_goods` VALUES ('130', '42', '程序员夏装 HTML5 短袖T恤', 'other', '电脑IT夏装 HTML5 超文本语言 纯棉程序员短袖T恤', '45', '45', 'upload/html5.jpg', '2014/02/24', '中国', '其他', '2015-05-05 12:21:11', '0', '0', '1', '0', '789');
INSERT INTO `tb_goods` VALUES ('131', '42', '2015春夏季新款女装沙滩长裙韩版修身气质雪纺波西米亚连衣裙', 'other', '高端、奢华，选用的是韩国进口高档雪纺，质感柔软舒适，垂感超级好，拿到后真的是爱不释手，到手都舍不得穿，奢华的品质，只适合高贵的你，这绝对是奢侈品的品质，女神必备的长裙，出入高档会所、宴会，婚礼礼服，出游度假，海边沙滩最适合的长裙', '228', '138', 'upload/nvzhuang.jpg', '2014/02/24', '中国', '其他', '2015-04-30 18:21:22', '0', '0', '1', '0', '666');
INSERT INTO `tb_goods` VALUES ('132', '42', '迪士尼童装2015夏装新款女童公主针织套装', 'disney', '弹力面料，不易变形，贴身穿着舒适柔软。\r\n精美绣印花，高贵大牌。 高品质蕾丝，网纱，梦幻公主风。', '157', '123', 'upload/disney.jpg', '2014/02/25', '中国上海', '迪士尼/disney', '2015-05-05 12:23:14', '0', '0', '1', '0', '1233');
INSERT INTO `tb_goods` VALUES ('133', '43', 'JavaScript高级程序设计(第3版) 网络编程 软件计算机书', 'other', '《JavaScript高级程序设计(第3版)》是JavaScript超级畅销书的最新版。ECMAScript5和HTML5在标准之争中双双胜出，使大量专有实现和客户端扩展正式进入规范，同时也为JavaScript 增添了很多适应未来发展的新特性。\r\n本书这一版除增加5章全新内容外，其他章节也有较大幅度的增补和修订，新内容篇幅约占三分之一。\r\n全书从JavaScript语言实现的各个组成部分——语言核心、DOM、BOM、事件模型讲起，深入浅出地探讨了面向对象编程、Ajax与Comet服务器端通信，HTML5表单、媒体、Canvas（包括WebGL）及Web Workers、地理定位、跨文档传递消息、客户端存储（包括IndexedDB）等新API，还介绍了离线应用和与维护、性能、部署相关的最佳开发实践。\r\n本书附录展望了未来的 API 和 ECMAScript Harmony 规范。', '75', '74.25', 'upload/javascript.jpg', '2014/02/18', '中国北京', '人民邮电出版社', '2015-05-05 12:23:02', '0', '0', '1', '0', '2222');
INSERT INTO `tb_goods` VALUES ('134', '44', '丸美组合 三肽胶原紧致五件套装 抗皱 保湿 提拉紧致 正品 化妆品', 'marubi', '1.丸美三肽胶原紧致洁面精华120g\r\n2.丸美三肽胶原紧致精华润养蜜露100ML\r\n3.丸美三肽胶原紧致日夜精华10ML+10ML\r\n4.丸美三肽胶原紧致精华日霜50G\r\n5.丸美三肽胶原紧致精华乳液80g', '2000', '2000', 'upload/wanmei.png', '2014/02/12', '日本', '丸美/marubi', '2015-05-05 12:22:53', '0', '0', '0', '1', '1221');
INSERT INTO `tb_goods` VALUES ('135', '44', '正品韩国新生活化妆品美之娇盈润修护乳CC霜防晒隔离舒缓遮瑕底霜', 'mizcho', '规格：40g 内赠7g遮瑕霜\r\n美之娇盈润修护乳以基础护肤科学为基础，融合了彩妆的修饰功能，多方位呵护肌肤健康。\r\n产品不仅可为肌肤补水、保湿，同时改善肌肤问题，长期使用皮肤将变得更加明亮、紧致有活力。', '260', '228', 'upload/mizcho.jpg', '2014/03/03', '韩国', '新生活/mizcho', '2015-05-05 12:22:47', '0', '1', '0', '0', '2122');
INSERT INTO `tb_goods` VALUES ('136', '44', '进口NIVEA妮维雅Q10Plus抗皱活肤修护晚霜祛斑抗衰老面霜50ml', 'nivea', '特有天然辅酵素Q10，于晚间皮肤更新最佳时机，对抗皱纹同时收细毛孔，令肌肤时显变得细嫩细滑。 \r\n*有效防止及减淡皱纹出现，保持肌肤紧致的弹性。 \r\n*于夜间启动肌肤再生，重拾紧致。', '200', '155', 'upload/nivea.jpg', '2014/02/11', '德国', '妮维雅/nivea', '2015-05-05 12:22:36', '1', '0', '0', '0', '996');
INSERT INTO `tb_goods` VALUES ('137', '44', '正品Olay玉兰油Pro-X专业纯焕方程式弹力紧致霜48g清爽补水面霜', 'olay', '产品功效：清爽不油腻,保护肌肤改善老化,帮助优化肌肤弹性紧致有效强化肌肤保湿屏障,对抗老化松弛,短短数天,肌肤弹力度立即提升,持续使用,锁水能力显著改善,提升肌肤紧致弹力。\r\n科技配方 根源改善：蕴含专业抗皱成分Pal-KT，能渗透至深层，将老化的肌肤修复信号重新启动，改善肤质，全面修护面部细纹、法令纹及鼻翼两侧毛孔变形，让肌肤重现光滑紧致的年轻状态。', '400', '370', 'upload/olay.jpg', '2014/02/02', '中国', '玉兰油/olay', '2015-05-05 12:22:29', '1', '0', '0', '0', '455');
INSERT INTO `tb_goods` VALUES ('138', '44', 'Chanel香奈儿炫亮魅力/丝绒哑光雾面绝版口红 唇膏', 'chanel', '唇膏中的明星！\r\n香奈儿独有的柔润复合物，结合了白芒花籽油衍生物、天然脂与植物保湿因子，赋予双唇理想的润泽效果，白芒花油衍生物能令妆效持久，能在唇部肌肤表面形成保护屏障，防止水份的流失，有效维持8小时的唇部润泽。', '622', '580', 'upload/chanel.jpg', '2014/02/28', '法国', '香奈儿/chanel', '2015-05-05 12:22:24', '1', '0', '0', '0', '779');
INSERT INTO `tb_goods` VALUES ('159', '45', '营养速食早餐扬州特产手工名点月子餐五亭包子鲜肉包子6只/袋 ', 'wuting', '速冻包子类，四袋起售，不限品种哦。\r\n五亭手工包子，健康美味，老人，孩子，上班族的早餐必备品哦，亲们可以放心选用健康卫生的五亭食品，散装包点我们都用专业泡沫保温箱加冰袋严格打包，不会坏哦，所以亲放心哦，不必纠结会不会融化，相信五亭，您的早餐，好吃又简单！', '20', '13.5', 'upload/wutingbaozi.png', '2015/03/19', '中国扬州', '五亭包子', '2015-05-05 14:45:39', '1', '0', '0', '1', '1');
INSERT INTO `tb_goods` VALUES ('160', '45', '湾仔码头三鲜手工水饺 720g 速冻水饺36只装', 'wanzai', '皮薄，馅足，汁多，来自妈妈一样用心的美味\r\n整块前腿猪肉绞制成肉馅；全天然小麦面粉，不含人工添加物，皮薄Q弹；严选在地蔬菜，整颗新鲜入场，完整保留原味。\r\n免加冷水独门煮法：一般的冷冻水饺会在高温下饺皮变得软烂，需要在煮滚后多加三次冷水降温。\r\n湾仔码头水饺筋度足，因此只需在沸水中放入水饺 ', '35', '28.8', 'upload/wanzaimatou.png', '2015/03/19', '中国上海', '湾仔码头', '2015-05-05 12:17:50', '1', '1', '0', '1', '1234');
INSERT INTO `tb_goods` VALUES ('161', '40', 'Apple/苹果 iPhone6 港版手机 苹果全新正品 苹果6 4.7英寸包邮 ', 'apple', '产品名称: Apple/苹果iPhone6       品牌: Apple/苹果\r\n型号: iPhone6            上市时间: 2014年10月\r\n网络类型: 无需合约版         网络类型: TD-LTE/FDD-LTE/TD-SCDMA/WCDMA\r\n款式: 直板                尺寸: 4.7英寸\r\n机身颜色: 金色 白色 黑色      套餐类型: 官方标配\r\n后置摄像头: 800万          操作系统: iOS\r\n附加功能: 不详            宝贝成色: 全新\r\n售后服务: 店铺三包         触摸屏类型: 电容屏\r\n运行内存RAM: 1G          机身内存: 16GB 64GB 128GB\r\n键盘类型: 美式键盘            厚度: 6.9mm\r\n分辨率: 1334×750          手机类型: 智能手机\r\n电池类型: 不可拆卸式电池      摄像头类型: 双摄像头（前后）\r\n视频显示格式: 720P(逐行高清D4)    网络模式: 单卡多模\r\n核心数: 双核             版本类型: 港澳台\r\n', '5288', '5200', 'upload/iphone6.png', '2015/03/19', '中国', '苹果/apple', '2015-05-05 12:21:56', '1', '1', '1', '1', '4444');
INSERT INTO `tb_goods` VALUES ('162', '40', '港行国行手机现货SAMSUNG/三星 S6 G9200全网通4G ', 'samsung', '港行【国行】全网首发现货，赶紧抢购吧！新款机器首批价格可能不稳定，可能存在降价的趋势，下单的亲们请谨慎，发货后一律不接受任何退差价之说（这个是尝鲜哟，早买早享受，早买早炫耀） ', '4539', '4479', 'upload/samsungS6.jpg', '2015/03/15', '韩国', '三星/samsung', '2015-05-05 12:22:02', '1', '1', '0', '1', '100');
INSERT INTO `tb_goods` VALUES ('163', '40', 'Letv乐视手机 乐1 5.5寸大屏 乐视超级手机 ', 'letv', '现在预定就送：高品质耳机+专用剪卡器+手机支架 ；大屏无边就是自由自在，金属边框倍有范，DTS+杜比 让你随时置身顶级影音世界，安卓5.0+蓝牙4.0+3G运行+16G内存配置运行毫无压力 ', '2499', '2499', 'upload/letvPhone.jpg', '2015/03/15', '中国北京', '乐视/letv', '2015-05-05 12:22:06', '1', '0', '0', '1', '110');
INSERT INTO `tb_goods` VALUES ('164', '40', 'MIUI/小米 小米手机4 联通/电信/移动版 骁龙四核2.5GHz处理器 ', 'xiaomi', '该宝贝为 小米手机4 移动4G版，支持移动4G、3G网络；移动和联通2G网络！\r\n【官方标配】=2G内存+16G高速闪存\r\n【套餐一】=3G内存+16G高速闪存！ ', '1799', '1799', 'upload/xiaomi4.jpg', '2015/03/15', '中国北京', '小米/xiaomi', '2015-05-05 12:22:11', '1', '0', '0', '1', '100');
INSERT INTO `tb_goods` VALUES ('165', '40', 'OPPO 6607 U3 原装正品4G智能旗舰手机5.9寸大屏', 'oppo', '其配备了OPPO自家特色的VOOC快速充电技术，理论上30分钟可以充电75%，除此之外该机还以大屏影音功能作为卖点，拥有独立的AK4961音频处理芯片、5.9英寸全高清屏幕、1.7GHz八核处理器与IMX214千万像素摄像头 ', '2499', '2499', 'upload/oppoU3.jpg', '2015/03/15', '中国北京', 'oppo', '2015-05-05 12:17:41', '1', '0', '0', '0', '1234');

-- ----------------------------
-- Table structure for `tb_inform`
-- ----------------------------
DROP TABLE IF EXISTS `tb_inform`;
CREATE TABLE `tb_inform` (
  `informId` int(11) NOT NULL AUTO_INCREMENT,
  `informTitle` varchar(30) DEFAULT NULL,
  `informContent` varchar(30) DEFAULT NULL,
  `informTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`informId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_inform
-- ----------------------------
INSERT INTO `tb_inform` VALUES ('2', '实力大回馈', '全场打折促销啦，走过路过千万不要错过！', '2015-03-31 00:27:47');
INSERT INTO `tb_inform` VALUES ('3', '热烈庆祝网上商城上线', '公告：为庆祝网上商城上线，即日起所有商品一律打折，欢迎选购！', '2015-04-19 13:56:08');
INSERT INTO `tb_inform` VALUES ('4', '迎五一疯狂大促销！', '即日起注册网上商城会员，即可享受打折优惠！', '2015-04-30 14:01:25');
INSERT INTO `tb_inform` VALUES ('5', '疯狂开学季，疯狂大回馈！', '公告：迎开学，全场大酬宾！', '2015-05-19 14:04:23');

-- ----------------------------
-- Table structure for `tb_note`
-- ----------------------------
DROP TABLE IF EXISTS `tb_note`;
CREATE TABLE `tb_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `content` varchar(50) NOT NULL,
  `ly_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_note
-- ----------------------------
INSERT INTO `tb_note` VALUES ('9', '你好', 'xiaolu', '你好', '2015-04-20 17:03:44');
INSERT INTO `tb_note` VALUES ('10', '刚买的手机', 'xiaolu', '哇，收到货啦，刚在商城买的小米手机2天就到货啦！', '2015-05-07 22:56:50');
INSERT INTO `tb_note` VALUES ('11', '脏话过滤测试', 'xiaolu', '**，什么人啊这是，*！', '2015-05-14 17:48:08');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `recvName` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('23', 'hellokitty', 'hellokitty', '上海', '111222', '13513513555', '2015-05-04 14:36:36', '1');
INSERT INTO `tb_order` VALUES ('24', 'hellokitty', 'hellokitty', '上海', '111222', '13513513555', '2015-05-04 14:36:37', '2');
INSERT INTO `tb_order` VALUES ('25', 'aaa2014', 'aaa2014', '中国', '111111', '15214623737', '2015-05-04 14:36:56', '1');
INSERT INTO `tb_order` VALUES ('26', 'hellokitty', 'hellokitty', '上海', '111222', '13513513555', '2015-05-04 14:36:39', '0');
INSERT INTO `tb_order` VALUES ('27', 'xiaolu', '小陆', '南京秦淮区', '210000', '13951755555', '2015-05-04 14:35:54', '1');
INSERT INTO `tb_order` VALUES ('28', 'xiaolu', '小明', '南京秦淮区应天大街', '210000', '12345624654', '2015-05-04 14:36:59', '0');
INSERT INTO `tb_order` VALUES ('29', 'xiaolu', '小陆', '南京秦淮区', '210000', '13951755555', '2015-05-04 14:35:49', '0');
INSERT INTO `tb_order` VALUES ('30', 'xiaolu', '陆晨阳', '南京秦淮区应天大街388号', '210000', '13951755555', '2015-05-05 14:45:57', '0');
INSERT INTO `tb_order` VALUES ('31', 'xiaolu', '老王', '南京秦淮区应天大街', '210000', '13951755555', '2015-05-09 22:55:35', '0');
INSERT INTO `tb_order` VALUES ('33', 'xiaolu', '老王', '南京', '210000', '13951755555', '2015-05-09 23:25:56', '0');
INSERT INTO `tb_order` VALUES ('34', 'xiaolu', '小陆', '南京秦淮区应天大街', '210000', '13951755555', '2015-05-28 21:21:03', '0');

-- ----------------------------
-- Table structure for `tb_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  `goodsName` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `orderId` (`orderId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `tb_orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `tb_order` (`orderId`),
  CONSTRAINT `tb_orderitem_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `tb_goods` (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_orderitem
-- ----------------------------
INSERT INTO `tb_orderitem` VALUES ('50', '23', '136', '水密码补水面霜', '88', '1');
INSERT INTO `tb_orderitem` VALUES ('51', '23', '118', '三星I9500(皓月白)', '4812', '1');
INSERT INTO `tb_orderitem` VALUES ('52', '23', '116', '联想一体机C560', '5988', '1');
INSERT INTO `tb_orderitem` VALUES ('53', '24', '136', '水密码补水面霜', '88', '1');
INSERT INTO `tb_orderitem` VALUES ('54', '24', '118', '三星I9500(皓月白)', '4812', '1');
INSERT INTO `tb_orderitem` VALUES ('55', '24', '116', '联想一体机C560', '5988', '1');
INSERT INTO `tb_orderitem` VALUES ('56', '24', '126', '九阳豆浆机', '499', '1');
INSERT INTO `tb_orderitem` VALUES ('57', '25', '118', '三星I9500(皓月白)', '4812', '1');
INSERT INTO `tb_orderitem` VALUES ('58', '25', '114', '罗技鼠标', '97', '1');
INSERT INTO `tb_orderitem` VALUES ('59', '25', '126', '九阳豆浆机', '499', '1');
INSERT INTO `tb_orderitem` VALUES ('60', '26', '114', '罗技鼠标', '291', '3');
INSERT INTO `tb_orderitem` VALUES ('61', '27', '118', '三星I9500(皓月白)', '4812', '1');
INSERT INTO `tb_orderitem` VALUES ('62', '27', '116', '联想一体机C560', '5988', '1');
INSERT INTO `tb_orderitem` VALUES ('63', '28', '119', '三星 GALAXY Note II N719', '3930', '1');
INSERT INTO `tb_orderitem` VALUES ('64', '29', '116', '联想一体机C560', '23952', '4');
INSERT INTO `tb_orderitem` VALUES ('65', '30', '159', '营养速食早餐扬州特产手工名点月子餐五亭包子鲜肉包子6只/袋 ', '54', '4');
INSERT INTO `tb_orderitem` VALUES ('66', '31', '118', 'SMARTISAN/锤子T1（4G）锤子手机 ', '2450', '1');
INSERT INTO `tb_orderitem` VALUES ('67', '31', '113', 'Sony/索尼 DSC-W730数码相机 1600万 8倍变焦 正品特价 送自拍镜 ', '435', '1');
INSERT INTO `tb_orderitem` VALUES ('69', '33', '118', 'SMARTISAN/锤子T1（4G）锤子手机 ', '2450', '1');
INSERT INTO `tb_orderitem` VALUES ('70', '34', '123', 'Midea/美的 BCD-515WKM(E)对开门无霜电冰箱 多门节能风冷冰箱', '9998', '2');
INSERT INTO `tb_orderitem` VALUES ('71', '34', '120', 'Meitu/美图MK260 (M2) 美图手机2 美图秀秀 自拍神器 美图M2 ', '12995', '5');

-- ----------------------------
-- Table structure for `tb_supertype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_supertype`;
CREATE TABLE `tb_supertype` (
  `superTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`superTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_supertype
-- ----------------------------
INSERT INTO `tb_supertype` VALUES ('38', '数码');
INSERT INTO `tb_supertype` VALUES ('39', '电脑');
INSERT INTO `tb_supertype` VALUES ('40', '手机');
INSERT INTO `tb_supertype` VALUES ('41', '家电');
INSERT INTO `tb_supertype` VALUES ('42', '服装');
INSERT INTO `tb_supertype` VALUES ('43', '图书');
INSERT INTO `tb_supertype` VALUES ('44', '化妆');
INSERT INTO `tb_supertype` VALUES ('45', '零食');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `trueName` varchar(40) NOT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `mphone` varchar(15) DEFAULT NULL,
  `question` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'hellokitty', 'e10adc3949ba59abbe56e057f20f883e', '1095080675@qq.com', '咔咔咔', '男', '1995-11-25', '上海', '111222', '021-55558888', '13513513555', '你最爱的人的名字叫什么', 'cat');
INSERT INTO `tb_user` VALUES ('2', 'go2013', 'e10adc3949ba59abbe56e057f20f883e', 'go13@qq.com', '李琦', '女', '1995-10-22', '中华人民共和国', '111111', '010-58694562', '13913813777', '你喜欢的业余爱好是什么', '乒乓球');
INSERT INTO `tb_user` VALUES ('3', 'hellokitty2', 'e10adc3949ba59abbe56e057f20f883e', 'ello@qq.com', '哇哈哈', '男', '1993-10-18', '上海市', '111111', '021-88885555', '13512510001', '你喜欢的业余爱好是什么', '行吗好');
INSERT INTO `tb_user` VALUES ('4', 'kitty14', 'e10adc3949ba59abbe56e057f20f883e', 'kitty@qq.com', '张三四', '男', '1995-11-11', '中国上海', '111111', '021-22221111', '13913813888', '你喜欢的业余爱好是什么', '打球');
INSERT INTO `tb_user` VALUES ('5', 'kitty15', 'e10adc3949ba59abbe56e057f20f883e', 'kitty@qq.com', '李四五', '男', '1993-09-08', '中国', '100100', '010-68688888', '13313313333', '你喜欢的业余爱好是什么', '看书');
INSERT INTO `tb_user` VALUES ('6', 'gogo2014', 'e10adc3949ba59abbe56e057f20f883e', 'gogo@qq.com', '前进', '男', '1995-10-10', '中国', '100100', '010-88889999', '13512512888', '你喜欢的业余爱好是什么', 'play');
INSERT INTO `tb_user` VALUES ('7', 'demo123', 'e10adc3949ba59abbe56e057f20f883e', 'demo@qq.com', '王二', '男', '1993-12-12', '中国', '100100', '010-68688888', '13913913999', '你喜欢的业余爱好是什么', '游泳');
INSERT INTO `tb_user` VALUES ('8', 'zhangyi', 'e10adc3949ba59abbe56e057f20f883e', 'zhang@qq.com', '张呵呵', '男', '1994-12-11', '中国', '100111', '010-68688888', '13913813888', '你喜欢的业余爱好是什么', '跑步');
INSERT INTO `tb_user` VALUES ('9', 'ha2222', 'e10adc3949ba59abbe56e057f20f883e', 'ha222@qq.com', '哈哈哈', '男', '1996-11-11', '中国', '111111', '88885555', '13813713888', '你喜欢的业余爱好是什么', '打球');
INSERT INTO `tb_user` VALUES ('11', 'xiaolu', 'c33367701511b4f6020ec61ded352059', '123456@qq.com', '小陆', '男', '1992-01-15', '南京秦淮区应天大街', '210000', '13951755555', '13951755555', '你最爱的人的名字叫什么', '哈哈');
INSERT INTO `tb_user` VALUES ('12', 'lucy123', 'e10adc3949ba59abbe56e057f20f883e', 'lucy123@qq.com', '露西', null, null, null, null, null, null, '你最爱的人的名字叫什么', '露西');
INSERT INTO `tb_user` VALUES ('13', 'xiaoming', 'e10adc3949ba59abbe56e057f20f883e', 'xiaoming@qq.com', '小明', null, null, null, null, null, null, '你最爱的人的名字叫什么', '小明');
INSERT INTO `tb_user` VALUES ('14', 'wsc123', 'e10adc3949ba59abbe56e057f20f883e', '111111@qq.com', '王思聪', null, null, null, null, null, null, '你最爱的人的名字叫什么', '陈乔恩');
INSERT INTO `tb_user` VALUES ('15', 'xiaomei', 'e10adc3949ba59abbe56e057f20f883e', '1234567@qq.com', '小美', null, null, null, null, null, null, '你最爱的人的名字叫什么', '小明');
INSERT INTO `tb_user` VALUES ('16', 'haha123', 'e10adc3949ba59abbe56e057f20f883e', '123456@qq.com', 'haha123', null, null, null, null, null, null, '你最爱的人的名字叫什么', 'haha123');
