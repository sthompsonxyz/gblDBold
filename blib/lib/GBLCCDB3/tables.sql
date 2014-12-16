CREATE TABLE "gbl_phylogeny" (
  "PHYLOGENY_ID" int NOT NULL primary key,
  "GENUS" varchar(20) default NULL,
  "SPECIES" varchar(20) NOT NULL default '',
  "SUBSPECIES" varchar(20) default NULL
);

CREATE TABLE "gbl_sample" (
  "SAMPLE_ID" int NOT NULL primary key,
  "SAMPLE_TYPE" varchar(20) NOT NULL default '',
  "SAMPLE_SOURCE_AGE" int default NULL,
  "SAMPLE_CODE" varchar(20) NOT NULL default '',
  "SAMPLE_TEMPERATURE" int default NULL,
  "COMMENT" varchar(200) default NULL,
  "USE_RECORD" char(1) NOT NULL default '',
  "CREATE_USERSTAMP" varchar(20) NOT NULL default '',
  "CREATE_TIMESTAMP" timestamp,
  "USERSTAMP" varchar(20) NOT NULL default '',
  "TIMESTAMP" timestamp,
  "COLLECTOR" varchar(20) NOT NULL default '',
  "COLLECTION_SITE" int NOT NULL default '0',
  "COLLECTION_DATE" date default NULL
);

CREATE TABLE "gbl_site" (
  "SITE_ID" int NOT NULL primary key,
  "SITE_NAME" varchar(40) NOT NULL default '',
  "SITE_ADDRESS" varchar(200) default NULL,
  "SITE_PHONE_NUMBER" varchar(20) default NULL,
  "SITE_URL" varchar(40) default NULL,
  "SITE_EMAIL" varchar(40) default NULL,
  "COMMENT" varchar(200) default NULL,
  "USE_RECORD" char(1) NOT NULL default '',
  "CREATE_USERSTAMP" varchar(20) NOT NULL default '',
  "CREATE_TIMESTAMP" timestamp,
  "USERSTAMP" varchar(20) NOT NULL default '',
  "TIMESTAMP" timestamp,
  "country" varchar(40) default NULL,
  "DESCRIPTION" varchar(100) default NULL,
  "GRID_REFERENCE" varchar(20) default NULL,
  "POSTCODE" varchar(10) default NULL
);

CREATE TABLE "gbl_strain" (
  "STRAIN_ID" int NOT NULL primary key,
  "STRAIN_CODE" varchar(20) NOT NULL default '',
  "GBL_ACCESSION_NUMBER" varchar(20) NOT NULL default '',
  "SAMPLE_ID" int NOT NULL default '0',
  "DEPOSITION_DATE" date,
  "BOX_NUMBER" int NOT NULL default '0',
  "NUMBER_OF_TUBES" int NOT NULL default '0',
  "VIABLE" char(1) default NULL,
  "PURE" char(1) default NULL,
  "PIGMENT" varchar(20) default NULL,
  "CELL_SHAPE" varchar(20) default NULL,
  "SPORE_TYPE" varchar(20) default NULL,
  "MOTILE" char(1) default NULL,
  "COMMENT" varchar(200) default NULL,
  "USE_RECORD" char(1) NOT NULL default '',
  "CREATE_USERSTAMP" varchar(20) NOT NULL default '',
  "CREATE_TIMESTAMP" timestamp,
  "USERSTAMP" varchar(20) NOT NULL default '',
  "TIMESTAMP" timestamp,
  "CONFIDENTIALITY" varchar(10) NOT NULL default 'low',
  "COLONY_PERIMETER" varchar(20) default NULL,
  "COLONY_PROFILE" varchar(20) default NULL,
  "COLONY_TEXTURE" varchar(20) default NULL,
  "COLONY_TRANSPARENCY" varchar(20) default NULL,
  "COLONY_COLOUR" varchar(20) default NULL,
  "COLONY_DIAMETER" varchar(20) default NULL,
  "GRAM_STAIN" int default NULL,
  "CATALASE" int default NULL,
  "MEDIUM" varchar(20) default NULL,
  "TEMPERATURE" int default NULL,
  "MIN_TEMPERATURE" int default NULL,
  "MAX_TEMPERATURE" int default NULL,
  "PH" int default NULL,
  "MIN_PH" int default NULL,
  "MAX_PH" int default NULL,
  "TRANSFORMABLE" char(1) default NULL,
  "AEROBIC" char(1) default NULL,
  "ANAEROBIC" char(1) default NULL
);

CREATE TABLE "gbl_strain_phylogeny" (
  "STRAIN_PHYLOGENY_ID" int NOT NULL primary key,
  "STRAIN_ID" int NOT NULL default '0',
  "PHYLOGENY_ID" int NOT NULL default '0',
  "similarity" int default NULL,
  "USE_RECORD" char(1) NOT NULL default '',
  "CREATE_USERSTAMP" varchar(20) NOT NULL default '',
  "CREATE_TIMESTAMP" timestamp,
  "USERSTAMP" varchar(20) NOT NULL default '',
  "TIMESTAMP" timestamp,
  "method" varchar(20) NOT NULL default 'HaeIII',
  "TYPE" char(2) default NULL
);

