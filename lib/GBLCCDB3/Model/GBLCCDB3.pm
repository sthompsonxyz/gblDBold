package GBLCCDB3::Model::GBLCCDB3;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'GBLCCDB3::Schema',
    connect_info => [
        'dbi:SQLite:gblccdb2.db',
        
    ],
);

=head1 NAME

GBLCCDB3::Model::GBLCCDB3 - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<GBLCCDB3>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<GBLCCDB3::Schema>

=head1 AUTHOR

root

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
