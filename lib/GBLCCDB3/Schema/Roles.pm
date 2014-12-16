package GBLCCDB3::Schema::Roles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("roles");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "role",
  { data_type => "TEXT", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-10-07 16:12:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Nl2AWs16dDVFThp7wEi5VA


# You can replace this text with custom content, and it will be preserved on regeneration
#
    # Set relationships:
    #

    # has_many():
    #   args:
    #     1) Name of relationship, DBIC will create accessor with this name
    #     2) Name of the model class referenced by this relationship
    #     3) Column name in *foreign* table
    __PACKAGE__->has_many(map_user_role => 'GBLCCDB3::Schema::UserRoles', 'role_id');
1;
