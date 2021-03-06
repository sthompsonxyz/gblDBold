package GBLCCDB3::Schema::GblPhylogeny;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("gbl_phylogeny");
__PACKAGE__->add_columns(
  "phylogeny_id",
  { data_type => "int", is_nullable => 0, size => undef },
  "genus",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "species",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "subspecies",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "ncbiref",
  { data_type => "varchar", is_nullable => 0, size => 20 },
);
__PACKAGE__->set_primary_key("phylogeny_id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-10-07 16:12:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HLFIQ9ZDgTWkJMY+xndtEg


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->might_have(map_strphylo => 'GBLCCDB3::Schema::GblStrainPhylogeny', 'phylogeny_id');

__PACKAGE__->many_to_many(phylstrains => 'map_strphylo', 'strains');
1;
