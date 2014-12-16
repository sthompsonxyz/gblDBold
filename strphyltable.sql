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

