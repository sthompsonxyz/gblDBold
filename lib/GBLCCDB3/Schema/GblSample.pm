package GBLCCDB3::Schema::GblSample;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("gbl_sample");
__PACKAGE__->add_columns(
  "sample_id",
  { data_type => "int", is_nullable => 0, size => undef },
  "sample_type",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "sample_source_age",
  { data_type => "int", is_nullable => 0, size => undef },
  "sample_code",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "sample_temperature",
  { data_type => "int", is_nullable => 0, size => undef },
  "comment",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "use_record",
  { data_type => "char", is_nullable => 0, size => 1 },
  "create_userstamp",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "create_timestamp",
  { data_type => "timestamp", is_nullable => 0, size => undef },
  "userstamp",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "timestamp",
  { data_type => "timestamp", is_nullable => 0, size => undef },
  "collector",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "collection_site",
  { data_type => "int", is_nullable => 0, size => undef },
  "collection_date",
  { data_type => "date", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("sample_id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-10-07 16:12:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3wur8L717nvdFgYs9niqYw


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->has_many(strains => 'GBLCCDB3::Schema::GblStrain', 'sample_id');

__PACKAGE__->belongs_to(site => 'GBLCCDB3::Schema::GblSite', 'collection_site');
1;
