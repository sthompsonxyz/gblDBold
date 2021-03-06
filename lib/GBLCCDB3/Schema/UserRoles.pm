package GBLCCDB3::Schema::UserRoles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("user_roles");
__PACKAGE__->add_columns(
  "user_id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "role_id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("user_id", "role_id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-10-07 16:12:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VOjXpoVQed6s+Q2ACQm0Lw


# You can replace this text with custom content, and it will be preserved on regeneration
#
    # Set relationships:
    #

    # belongs_to():
    #   args:
    #     1) Name of relationship, DBIC will create accessor with this name
    #     2) Name of the model class referenced by this relationship
    #     3) Column name in *this* table
    __PACKAGE__->belongs_to(user => 'GBLCCDB3::Schema::Users', 'user_id');

    # belongs_to():
    #   args:
    #     1) Name of relationship, DBIC will create accessor with this name
    #     2) Name of the model class referenced by this relationship
    #     3) Column name in *this* table
    __PACKAGE__->belongs_to(role => 'GBLCCDB3::Schema::Roles', 'role_id');
1;
