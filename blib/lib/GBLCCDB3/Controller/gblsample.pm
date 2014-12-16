package GBLCCDB3::Controller::gblsample;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

GBLCCDB3::Controller::gblsample - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{template} = "gblsample.tt2";
}

sub showsamples :Local {
	my($self, $c) = @_;

	my $sampCode = $c->request->params->{sampCode};
	my $sampType = $c->request->params->{sampType};
	my $sourceTemp = $c->request->params->{sourceTemp};
	my $collector = $c->request->params->{collector};
	my $collSite = $c->request->params->{collSite};
	my $submitter = $c->request->params->{submitter};
	
	
	
	$c->stash->{gblsamplesearch} = [$c->model('GBLCCDB3::GblSample')->search({ 
sample_type => {'like', '%'.$sampType.'%'},  
sample_code => {'like', '%'.$sampCode.'%'},
sample_temperature => {'like', '%'.$sourceTemp.'%'},
collector => {'like', '%'.$collector.'%'},
collection_site => {'like', '%'.$collSite.'%'},
'me.userstamp' => {'like', '%'.$submitter.'%'},
},
{
join => ['site'],
prefetch => ['site']
})];

	$c->stash->{template} = "gblsamplelist.tt2";
}



sub samples :Local {
	my ($self, $c, $samplecode) = @_;

	$c->stash->{gblsamplecode} = $samplecode;

	$c->stash->{sampledata} = [$c->model('GBLCCDB3::GblStrainPhylogeny')->search({
'strains.sample.sample_code' => {'like', '%'.$samplecode.'%'}
},
{
join => [ 'strains', { 'strains' => 'sample'}, 'phylogenies' ],
order_by => [ 'strains.gbl_accession_number', 'genus', 'species' ],
prefetch => [ 'strains', 'phylogenies' ]
})];

	$c->stash->{template} = "gblsamplerecordshow.tt2";
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
