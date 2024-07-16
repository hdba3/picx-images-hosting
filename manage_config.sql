-- 删除数据库如果已存在
DROP DATABASE IF EXISTS manage_config;

-- 创建数据库
CREATE DATABASE manage_config;

-- 使用数据库
USE manage_config;

-- 删除表如果已存在
DROP TABLE IF EXISTS config;

-- 创建配置表
CREATE TABLE config (
    id INT(10) NOT NULL AUTO_INCREMENT COMMENT '配置的唯一标识',
    name VARCHAR(20) NOT NULL DEFAULT '未命名表单' COMMENT '表单名称默认为未命名表单',
    role_id INT(10) NOT NULL COMMENT '所分配的角色 id',
    multiselect_id INT(10) DEFAULT NULL COMMENT '多选表的 id, 为空表示不启用',
    radio_id INT(10) DEFAULT NULL COMMENT '单选表的 id, 为空表示不启用',
    date_id INT(10) DEFAULT NULL COMMENT '日期表的 id, 为空表示不启用',
    serial_id INT(10) DEFAULT NULL COMMENT '编号表的id，为空表示不启用',
    single_id INT(10) DEFAULT NULL COMMENT '单行文本表的id，为空表示不启用',
    multi_id INT(10) DEFAULT NULL COMMENT '多行文本表的id，为空表示不启用',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (id)
) COMMENT = '此表用于存储各种配置信息及其相关联的表ID';

-- 删除表如果已存在
DROP TABLE IF EXISTS multiselect;

-- 创建多选表
CREATE TABLE multiselect(
    id INT(10) NOT NULL AUTO_INCREMENT COMMENT '多选的唯一标识',
    title VARCHAR(255) NOT NULL COMMENT '标题',
    description TEXT COMMENT '多选的描述信息',
    max_selections TINYINT(3) NOT NULL DEFAULT 3 COMMENT '最大可选数量，默认与总选数相同',
    num_options TINYINT(3) NOT NULL DEFAULT 3 COMMENT '多选列表中的总选项数，默认为3',
    required TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否为必填项（1表示是，0表示否）',
    option_content JSON COMMENT '存储选项内容的JSON格式数据',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (id)
) COMMENT = '此表用于管理多选的各项属性和内容';

-- 删除表如果已存在
DROP TABLE IF EXISTS radio;

-- 创建单选表
CREATE TABLE radio (
    id INT(10) NOT NULL AUTO_INCREMENT COMMENT '单选功能的唯一标识',
    title VARCHAR(255) NOT NULL COMMENT '标题',
    description TEXT COMMENT '单选的描述信息',
    num_options TINYINT(3) NOT NULL DEFAULT 3 COMMENT '单选列表中的总选项数，默认为3',
    required TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否为必填项（1表示是，0表示否）',
    option_content JSON COMMENT '存储选项内容的JSON格式数据，包含每个选项的描述和是否被选中状态',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (id)
) COMMENT = '单选表用于存储单选的各项属性和内容';

-- 删除表如果已存在
DROP TABLE IF EXISTS date;

-- 创建名为date的表，用于存储日期相关的信息
CREATE TABLE date (
    id INT(10) NOT NULL AUTO_INCREMENT COMMENT '日期功能的唯一标识', 
    title VARCHAR(255) NOT NULL COMMENT '标题', 
    description TEXT COMMENT '日期的描述信息', 
    prompt_text TEXT COMMENT '日期的提示文字', 
    date_type ENUM('type1', 'type2', 'type3') NOT NULL COMMENT '日期的类型', 
    default_value VARCHAR(255) COMMENT '日期的默认值', 
    selectable_days JSON COMMENT '可选星期', 
    earliest_select VARCHAR(255) COMMENT '最早可选时间', 
    latest_select VARCHAR(255) COMMENT '最晚可选时间',
    required TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否必填', 
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (id) -- 主键
) COMMENT = '此表用于管理各种日期相关的功能和设置';

-- 删除表如果已存在
DROP TABLE IF EXISTS serial;

-- 创建名为serial的表，用于存储编号配置
CREATE TABLE serial (
    id INT(10) NOT NULL AUTO_INCREMENT COMMENT '编号的唯一标识',
    title VARCHAR(255) NOT NULL COMMENT '标题',
    description TEXT COMMENT '编号的描述信息',
    num_serial INT(10) NOT NULL DEFAULT 5 COMMENT '编号的长度，默认为5',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (id) COMMENT '主键'
) COMMENT = '此表用于存储编号的配置';

-- 删除表如果已存在
DROP TABLE IF EXISTS single;

-- 创建名为single的表，用于存储单行文本数据
CREATE TABLE single (
    id INT(10) NOT NULL AUTO_INCREMENT COMMENT '单行的唯一标识',
    title VARCHAR(255) NOT NULL COMMENT '标题',
    description TEXT COMMENT '单行的描述信息',
    default_value VARCHAR(255) COMMENT '单行的默认值',
    type ENUM('email', 'number', 'tel','text') NOT NULL COMMENT '格式', -- 请根据实际情况定义枚举值
    prompt_text TEXT COMMENT '提示文字',
    required TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否为必填项（1 表示是，0 表示否）',
    repetition TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否允许重复（1表示是，0表示否）',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (id) COMMENT '主键'
) COMMENT = '此表用于管理各种单行文本数据及其相关属性';

-- 删除表如果已存在
DROP TABLE IF EXISTS multi;

-- 创建名为multi的表，用于存储多行文本数据
CREATE TABLE multi (
    id INT(10) NOT NULL AUTO_INCREMENT COMMENT '多行的唯一标识',
    title VARCHAR(255) NOT NULL COMMENT '标题',
    description TEXT COMMENT '多行的描述信息',
    default_value VARCHAR(255) COMMENT '多行的默认值',
    prompt_text TEXT COMMENT '提示文字',
    required TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否为必填项（1 表示是，0 表示否）',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (id) COMMENT '主键'
) COMMENT = '此表用于管理各种多行文本数据及其相关属性';

-- 添加多选表的外键约束
ALTER TABLE config
ADD CONSTRAINT fk_config_multiselect
FOREIGN KEY (multiselect_id) REFERENCES multiselect(id);

-- 添加单选表的外键约束
ALTER TABLE config
ADD CONSTRAINT fk_config_radio
FOREIGN KEY (radio_id) REFERENCES radio(id);

-- 添加日期表的外键约束
ALTER TABLE config
ADD CONSTRAINT fk_config_date
FOREIGN KEY (date_id) REFERENCES date(id);

-- 添加编号表的外键约束
ALTER TABLE config
ADD CONSTRAINT fk_config_serial
FOREIGN KEY (serial_id) REFERENCES serial(id);

-- 添加单行文本表的外键约束
ALTER TABLE config
ADD CONSTRAINT fk_config_single
FOREIGN KEY (single_id) REFERENCES single(id);

-- 添加多行文本表的外键约束
ALTER TABLE config
ADD CONSTRAINT fk_config_multi
FOREIGN KEY (multi_id) REFERENCES multi(id);