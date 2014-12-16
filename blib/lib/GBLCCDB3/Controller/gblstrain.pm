package GBLCCDB3::Controller::gblstrain;

use strict;
use warnings;
use parent 'Catalyst::Controller';
use Bio::Seq;
use Bio::SeqIO;
use Data::Page;

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{template} = "gblstrain.tt2";
}

sub strainsearch2test :Local {
	my ($self, $c) = @_;

	$c->stash->{template} = "gblstrain2.tt2";
}


sub strainlist :Local {
	my ($self,$c) = @_;

	$c->stash->{gblstrains} = [$c->model('GBLCCDB3::GblPhylogeny')->all];

	$c->stash->{template} = "strainlist.tt2";
}

sub showstrains2 :Local {
	my($self, $c) = @_;

	my $gblaccno = $c->request->params->{gblAccNo};
	my $sampleCode = $c->request->params->{sampleCode};
	my $strainCode = $c->request->params->{strainCode};
	my $boxNo = $c->request->params->{boxNo};
	my $viable = $c->request->params->{viability};
	my $pigment = $c->request->params->{szPigment};
	my $tempLower = $c->request->params->{tempLowerRange};
	my $tempUpper = $c->request->params->{tempUpperRange};
	my $emptyTemp = 0;
	
	if(!$tempLower && !$tempUpper)
	{
		$emptyTemp = 1;
	}
	if(!$tempLower)
		{$tempLower = -20;}
	if(!$tempUpper)
		{$tempUpper = 120;}

	my $phLower = $c->request->params->{pHLowerRange};
	my $phUpper = $c->request->params->{pHUpperRange};
	my $emptypH = 0;
	if(!$phLower && !$phUpper)
	{
		$emptypH = 1;
	}
	if(!$phLower)
		{$phLower = 1;}
	if(!$phUpper)
		{$phUpper = 14;}

	my $col_per = $c->request->params->{szPerimeter};
	my $col_prof = $c->request->params->{szProfile};
	my $col_texture = $c->request->params->{szTexture};
	my $col_trans = $c->request->params->{szTransparency};
	my $col_colour = $c->request->params->{szColour};
	my $col_diameter = $c->request->params->{szDiameter};

	my $cellshape = $c->request->params->{szCellShape};
	my $sporetype = $c->request->params->{szSporeType};
	my $motility = $c->request->params->{szMotile};

	 
	my $genus = $c->request->params->{genus};
	my $species = $c->request->params->{species};
	
	
	$c->stash->{gblstrainsearch} = [$c->model('GBLCCDB3::GblStrainPhylogeny')->search({ 
'me.use_record' => 'Y', 
($gblaccno) ? ('strains.gbl_accession_number' => {'like', '%'.$gblaccno.'%'}) : ( -or => ['strains.gbl_accession_number' => {'like', '%%'} , 'strains.gbl_accession_number' => undef ] ) ,  
($strainCode) ? ( 'strains.strain_code' => { 'like', '%'.$strainCode.'%' } ) : ( -or => [ 'strains.strain_code' => {'like', '%%' }, 'strains.strain_code' => undef ] ) ,

($boxNo) ? ('strains.box_number' => { 'like', '%'.$boxNo.'%' }) : (-or => ['strains.box_number' => {'like', '%%'}, 'strains.box_number' => undef ] ),

($viable) ? ('strains.viable' => {'like', '%'.$viable.'%'} ) : (-or => ['strains.viable' => {'like', '%%'}, 'strains.viable' => undef ] ),

($pigment) ? ('strains.pigment' => {'like', '%'.$pigment.'%'} ) : (-or => ['strains.pigment' => {'like', '%%'}, 'strains.pigment' => undef] ),

( $emptyTemp == 1 ) ? ( -or => ['strains.temperature' => {-between => [$tempLower, $tempUpper]}, 'strains.temperature' => undef] ) : ('strains.temperature' => {-between => [$tempLower, $tempUpper] }) ,

($genus) ? ('genus' => {'like', '%'.$genus.'%'}) : (-or => ['genus' => {'like', '%%' },'genus' => undef ] ),
($species) ? ('species' => {'like', '%'.$species.'%'} ) : ( -or => ['species' => {'like', '%%'}, 'species' => undef ]),
($sampleCode) ? ('strains.sample.sample_code' => {'like', '%'.$sampleCode.'%'}) : (-or => [ 'strains.sample.sample_code' => {'like', '%%'}, 'strains.sample.sample_code' => undef] ) ,
($col_per) ? ('strains.colony_perimeter' => {'like', '%'.$col_per.'%'} ) : ( -or => ['strains.colony_perimeter' => {'like', '%%'}, 'strains.colony_perimeter' => undef ] ),
($col_prof) ? ('strains.colony_profile' => {'like', '%'.$col_prof.'%'} ) : ( -or => ['strains.colony_profile' => {'like', '%%'}, 'strains.colony_profile' => undef ] ),
($col_texture) ? ('strains.colony_texture' => {'like', '%'.$col_texture.'%'} ) : ( -or => ['strains.colony_texture' => {'like', '%%'}, 'strains.colony_texture' => undef ] ),
($col_trans) ? ('strains.colony_transparency' => {'like', '%'.$col_trans.'%'} ) : ( -or => ['strains.colony_transparency' => {'like', '%%'}, 'strains.colony_transparency' => undef ] ),

($cellshape) ? ('strains.cell_shape' => {'like', '%'.$cellshape.'%'} ) : ( -or => ['strains.cell_shape' => {'like', '%%'}, 'strains.cell_shape' => undef ] ),
($sporetype) ? ('strains.spore_type' => {'like', '%'.$sporetype.'%'} ) : ( -or => ['strains.spore_type' => {'like', '%%'}, 'strains.spore_type' => undef ] ),
($motility) ? ('strains.motile' => {'like', '%'.$motility.'%'} ) : ( -or => ['strains.motile' => {'like', '%%'}, 'strains.motile' => undef ] ),
($emptypH == 1) ? (-or => ['strains.ph' => {-between => [$phLower , $phUpper ]}, 'strains.ph' => undef ] ) : ('strains.ph' => {-between => [$phLower , $phUpper]} )
 

},
{
join => [ { 'strains' => 'sample'}, 'phylogenies' ],
select => [ {distinct => 'gbl_accession_number'} ],
order_by => [ 'strains.gbl_accession_number' ],
prefetch => [ 'strains', 'phylogenies' ]
})];

	$c->stash->{template} = "gblstrainlist.tt2";
}

sub strains :Local {
	my ($self, $c, $strainrecord) = @_;

	$c->stash->{gblstraincode} = $strainrecord;

	$c->stash->{straindata} = [$c->model('GBLCCDB3::GblStrainPhylogeny')->search({
'strains.gbl_accession_number' => $strainrecord
},
{
prefetch => ['phylogenies', {'strains' => 'sample'} ]
})];
	$c->stash->{template} = "gblstrainrecordshow.tt2";
}




sub showstrains :Local {
	my($self, $c) = @_;

	my $gblaccno = $c->request->params->{gblAccNo};
	my $sampleCode = $c->request->params->{sampleCode};
	my $strainCode = $c->request->params->{strainCode};
	my $boxNo = $c->request->params->{boxNo};
	my $viable = $c->request->params->{viability};
	my $pigment = $c->request->params->{szPigment};
	my $tempLower = $c->request->params->{tempLowerRange};
	my $tempUpper = $c->request->params->{tempUpperRange};
	my $emptyTemp = 0;
	
	if(!$tempLower && !$tempUpper)
	{
		$emptyTemp = 1;
	}
	if(!$tempLower)
		{$tempLower = -20;}
	if(!$tempUpper)
		{$tempUpper = 120;}

	my $phLower = $c->request->params->{pHLowerRange};
	my $phUpper = $c->request->params->{pHUpperRange};
	my $emptypH = 0;
	if(!$phLower && !$phUpper)
	{
		$emptypH = 1;
	}
	if(!$phLower)
		{$phLower = 1;}
	if(!$phUpper)
		{$phUpper = 14;}

	my $col_per = $c->request->params->{szPerimeter};
	my $col_prof = $c->request->params->{szProfile};
	my $col_texture = $c->request->params->{szTexture};
	my $col_trans = $c->request->params->{szTransparency};
	my $col_colour = $c->request->params->{szColour};
	my $col_diameter = $c->request->params->{szDiameter};

	my $cellshape = $c->request->params->{szCellShape};
	my $sporetype = $c->request->params->{szSporeType};
	my $motility = $c->request->params->{szMotile};

	 
	my $genus = $c->request->params->{genus};
	my $species = $c->request->params->{species};

	my $pagenum = $c->request->params->{page};
	if(!$pagenum)
	{
		$pagenum = 1;
	}

	
	my $gblrs = $c->model('GBLCCDB3::GblStrainPhylogeny')->search({ 
'me.use_record' => 'Y', 
($gblaccno) ? ('strains.gbl_accession_number' => {'like', '%'.$gblaccno.'%'}) : ( -or => ['strains.gbl_accession_number' => {'like', '%%'} , 'strains.gbl_accession_number' => undef ] ) ,  
($strainCode) ? ( 'strains.strain_code' => { 'like', '%'.$strainCode.'%' } ) : ( -or => [ 'strains.strain_code' => {'like', '%%' }, 'strains.strain_code' => undef ] ) ,

($boxNo) ? ('strains.box_number' => { 'like', '%'.$boxNo.'%' }) : (-or => ['strains.box_number' => {'like', '%%'}, 'strains.box_number' => undef ] ),

($viable) ? ('strains.viable' => {'like', '%'.$viable.'%'} ) : (-or => ['strains.viable' => {'like', '%%'}, 'strains.viable' => undef ] ),

($pigment) ? ('strains.pigment' => {'like', '%'.$pigment.'%'} ) : (-or => ['strains.pigment' => {'like', '%%'}, 'strains.pigment' => undef] ),

( $emptyTemp == 1 ) ? ( -or => ['strains.temperature' => {-between => [$tempLower, $tempUpper]}, 'strains.temperature' => undef] ) : ('strains.temperature' => {-between => [$tempLower, $tempUpper] }) ,

($genus) ? ('genus' => {'like', '%'.$genus.'%'}) : (-or => ['genus' => {'like', '%%' },'genus' => undef ] ),
($species) ? ('species' => {'like', '%'.$species.'%'} ) : ( -or => ['species' => {'like', '%%'}, 'species' => undef ]),
($sampleCode) ? ('strains.sample.sample_code' => {'like', '%'.$sampleCode.'%'}) : (-or => [ 'strains.sample.sample_code' => {'like', '%%'}, 'strains.sample.sample_code' => undef] ) ,
($col_per) ? ('strains.colony_perimeter' => {'like', '%'.$col_per.'%'} ) : ( -or => ['strains.colony_perimeter' => {'like', '%%'}, 'strains.colony_perimeter' => undef ] ),
($col_prof) ? ('strains.colony_profile' => {'like', '%'.$col_prof.'%'} ) : ( -or => ['strains.colony_profile' => {'like', '%%'}, 'strains.colony_profile' => undef ] ),
($col_texture) ? ('strains.colony_texture' => {'like', '%'.$col_texture.'%'} ) : ( -or => ['strains.colony_texture' => {'like', '%%'}, 'strains.colony_texture' => undef ] ),
($col_trans) ? ('strains.colony_transparency' => {'like', '%'.$col_trans.'%'} ) : ( -or => ['strains.colony_transparency' => {'like', '%%'}, 'strains.colony_transparency' => undef ] ),

($cellshape) ? ('strains.cell_shape' => {'like', '%'.$cellshape.'%'} ) : ( -or => ['strains.cell_shape' => {'like', '%%'}, 'strains.cell_shape' => undef ] ),
($sporetype) ? ('strains.spore_type' => {'like', '%'.$sporetype.'%'} ) : ( -or => ['strains.spore_type' => {'like', '%%'}, 'strains.spore_type' => undef ] ),
($motility) ? ('strains.motile' => {'like', '%'.$motility.'%'} ) : ( -or => ['strains.motile' => {'like', '%%'}, 'strains.motile' => undef ] ),
($emptypH == 1) ? (-or => ['strains.ph' => {-between => [$phLower , $phUpper ]}, 'strains.ph' => undef ] ) : ('strains.ph' => {-between => [$phLower , $phUpper]} )
 

},
{
	join => [ { 'strains' => 'sample'}, 'phylogenies' ],
	select => [ {distinct => 'gbl_accession_number'} ],
	order_by => [ 'strains.gbl_accession_number' ],
	prefetch => [ 'strains', 'phylogenies' ],
	page => $pagenum,
	rows => 50
});

	my $arrayref = [$gblrs->all()];
	$c->stash->{gblstrainsearch} = $arrayref;
	my $pager = $gblrs->pager();
	$c->stash->{strainpager} = $pager;
	$c->stash->{page} = $pagenum;
	$c->stash->{template} = "gblstrainlist2.tt2";
}

sub strains :Local {
	my ($self, $c, $strainrecord) = @_;

	$c->stash->{gblstraincode} = $strainrecord;

	$c->stash->{straindata} = [$c->model('GBLCCDB3::GblStrainPhylogeny')->search({
		'strains.gbl_accession_number' => $strainrecord
					},
											{
		prefetch => ['phylogenies', {'strains' => 'sample'} ]
					})];

	$c->stash->{template} = "gblstrainrecordshow.tt2";
}






sub showsequence :Local {
	my ($self, $c, $sequencename) = @_;
	
	$c->stash->{seqs} = [$c->model('GBLCCDB3::GblStrainPhylogeny')->search({
		'strains.gbl_accession_number' => $sequencename
},
{
	join => [ 'strains' ],
	prefetch => [ 'strains' ]
})];
	$c->stash->{template} = "showgblseq.tt2";
}

sub fastadump :Local {
	my ($self, $c) = @_;

	my $seqobj = Bio::Seq->new(-alphabet => 'dna');
	my $seqioobj = Bio::SeqIO->new(-file => "<root/src/GBLCCseqs3.fasta", -format => 'fasta');

while ($seqobj = $seqioobj->next_seq)
{
$c->model('GBLCCDB3::GblStrainPhylogeny')->search({
'strains.gbl_accession_number' => $seqobj->display_id(), 'method' => 'Sequencing'}, {join => ['strains', 'phylogenies']})->update_all({'fasta16s' => ">".(($seqobj->display_id())." ".($seqobj->desc())."\n".($seqobj->seq()))});

}

	$c->stash->{template} = "gblsequpdate.tt2";
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
