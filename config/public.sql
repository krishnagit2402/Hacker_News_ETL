\c hn

/*
 Navicat PostgreSQL Data Transfer

 Source Server         : localhost
 Source Server Version : 90401
 Source Host           : localhost
 Source Database       : hn
 Source Schema         : public

 Target Server Version : 90401
 File Encoding         : utf-8

 Date: 04/11/2015 00:14:27 AM
*/

-- ----------------------------
--  Table structure for sta_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."sta_items";
CREATE TABLE "public"."sta_items" (
	"id" int8 NOT NULL,
	"type" varchar(25) COLLATE "default",
	"by" varchar(25) COLLATE "default",
	"time" int8,
	"text" text COLLATE "default",
	"parent" int8,
	"kids" text COLLATE "default",
	"url" varchar(50) COLLATE "default",
	"score" int8,
	"title" text COLLATE "default",
	"parts" text COLLATE "default",
	"descendants" text COLLATE "default",
	"updated" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sta_items" OWNER TO "import";

-- ----------------------------
--  Table structure for sta_queue
-- ----------------------------
DROP TABLE IF EXISTS "public"."sta_queue";
CREATE TABLE "public"."sta_queue" (
	"id" int8,
	"type" varchar(50) COLLATE "default",
	"sid" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sta_queue" OWNER TO "import";

-- ----------------------------
--  Table structure for sta_responses
-- ----------------------------
DROP TABLE IF EXISTS "public"."sta_responses";
CREATE TABLE "public"."sta_responses" (
	"id" int8,
	"url" text COLLATE "default",
	"response" text COLLATE "default",
	"type" varchar(10) COLLATE "default",
	"updated" int8,
	"request_for" varchar(10) COLLATE "default",
	"created" int8,
	"by" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sta_responses" OWNER TO "import";

-- ----------------------------
--  Table structure for sta_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."sta_users";
CREATE TABLE "public"."sta_users" (
	"id" int4,
	"created" int4,
	"delay" int4,
	"about" text COLLATE "default",
	"karma" int4,
	"submitted" text COLLATE "default",
	"updated" int2,
	"name" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sta_users" OWNER TO "import";

-- ----------------------------
--  Primary key structure for table sta_items
-- ----------------------------
ALTER TABLE "public"."sta_items" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

