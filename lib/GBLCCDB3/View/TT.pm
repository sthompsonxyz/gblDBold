package GBLCCDB3::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
    INCLUDE_PATH => [
        GBLCCDB3->path_to( 'root', 'src' ),
        GBLCCDB3->path_to( 'root', 'lib' )
    ],
    PRE_PROCESS  => 'config/main',
    WRAPPER      => 'site/wrapper',
    ERROR        => 'error.tt2',
    TIMER        => 0
});

=head1 NAME

GBLCCDB3::View::TT - Catalyst TTSite View

=head1 SYNOPSIS

See L<GBLCCDB3>

=head1 DESCRIPTION

Catalyst TTSite View.

=head1 AUTHOR

root

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

