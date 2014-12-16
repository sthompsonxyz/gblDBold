package GBLCCDB3::Schema::GblSite;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("gbl_site");
__PACKAGE__->add_columns(
  "site_id",
  { data_type => "int", is_nullable => 0, size => undef },
  "site_name",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "site_address",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "site_phone_number",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "site_url",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "site_email",
  { data_type => "varchar", is_nullable => 0, size => 40 },
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
  "country",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "grid_reference",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "postcode",
  { data_type => "varchar", is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("site_id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-10-07 16:12:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rZJPF8Lu3pJuXaXfdM71hw


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->has_many(samples => 'GBLCCDB3::Schema::GblSample', 'collection_site');
1;
