package GBLCCDB3::Schema::GblStrain;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("gbl_strain");
__PACKAGE__->add_columns(
  "strain_id",
  { data_type => "int", is_nullable => 0, size => undef },
  "strain_code",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "gbl_accession_number",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "sample_id",
  { data_type => "int", is_nullable => 0, size => undef },
  "deposition_date",
  { data_type => "date", is_nullable => 0, size => undef },
  "box_number",
  { data_type => "int", is_nullable => 0, size => undef },
  "number_of_tubes",
  { data_type => "int", is_nullable => 0, size => undef },
  "viable",
  { data_type => "char", is_nullable => 0, size => 1 },
  "pure",
  { data_type => "char", is_nullable => 0, size => 1 },
  "pigment",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "cell_shape",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "spore_type",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "motile",
  { data_type => "char", is_nullable => 0, size => 1 },
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
  "confidentiality",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "colony_perimeter",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "colony_profile",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "colony_texture",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "colony_transparency",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "colony_colour",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "colony_diameter",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "gram_stain",
  { data_type => "int", is_nullable => 0, size => undef },
  "catalase",
  { data_type => "int", is_nullable => 0, size => undef },
  "medium",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "temperature",
  { data_type => "int", is_nullable => 0, size => undef },
  "min_temperature",
  { data_type => "int", is_nullable => 0, size => undef },
  "max_temperature",
  { data_type => "int", is_nullable => 0, size => undef },
  "ph",
  { data_type => "int", is_nullable => 0, size => undef },
  "min_ph",
  { data_type => "int", is_nullable => 0, size => undef },
  "max_ph",
  { data_type => "int", is_nullable => 0, size => undef },
  "transformable",
  { data_type => "char", is_nullable => 0, size => 1 },
  "aerobic",
  { data_type => "char", is_nullable => 0, size => 1 },
  "anaerobic",
  { data_type => "char", is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("strain_id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-10-07 16:12:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zUpG+H/bFcNCT4M+gMtrRw


# You can replace this text with custom content, and it will be preserved on regeneration

__PACKAGE__->belongs_to(sample => 'GBLCCDB3::Schema::GblSample', 'sample_id'); 
__PACKAGE__->might_have(map_strphylo => 'GBLCCDB3::Schema::GblStrainPhylogeny', 'strain_id'); 
__PACKAGE__->many_to_many(phylos => 'map_strphylo', 'phylogenies');
1;
