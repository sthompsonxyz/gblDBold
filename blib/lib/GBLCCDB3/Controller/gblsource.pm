package GBLCCDB3::Controller::gblsource;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

GBLCCDB3::Controller::gblsource - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{template} = "gblsource.tt2";
}

sub showsources :Local {
	my($self, $c) = @_;

	my $sourceName = $c->request->params->{sourceNAME};
	my $address = $c->request->params->{address};
	
	
	
	$c->stash->{gblsourcesearch} = [$c->model('GBLCCDB3::GblSite')->search({ 
site_address => {'like', '%'.$address.'%'},  
site_name => {'like', '%'.$sourceName.'%'}
})];

	$c->stash->{template} = "gblsourcelist.tt2";
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
