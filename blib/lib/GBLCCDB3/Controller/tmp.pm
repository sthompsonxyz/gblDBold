package GBLCCDB3::Controller::tmp;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

GBLCCDB3::Controller::tmp - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched GBLCCDB3::Controller::tmp in tmp.');
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
