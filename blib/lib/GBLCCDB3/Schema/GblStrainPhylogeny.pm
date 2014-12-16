package GBLCCDB3::Schema::GblStrainPhylogeny;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("gbl_strain_phylogeny");
__PACKAGE__->add_columns(
  "strain_phylogeny_id",
  { data_type => "int", is_nullable => 0, size => undef },
  "strain_id",
  { data_type => "int", is_nullable => 0, size => undef },
  "phylogeny_id",
  { data_type => "int", is_nullable => 0, size => undef },
  "similarity",
  { data_type => "int", is_nullable => 0, size => undef },
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
  "method",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "type",
  { data_type => "char", is_nullable => 0, size => 2 },
  "fasta16s",
  { data_type => "text", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("strain_phylogeny_id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-10-07 16:12:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CzYsP9lImo1ycIP7TH5TXw


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->belongs_to(strains => 'GBLCCDB3::Schema::GblStrain', 'strain_id');
__PACKAGE__->belongs_to(phylogenies => 'GBLCCDB3::Schema::GblPhylogeny', 'phylogeny_id');
1;
