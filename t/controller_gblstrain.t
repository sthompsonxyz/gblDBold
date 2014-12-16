use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'GBLCCDB3' }
BEGIN { use_ok 'GBLCCDB3::Controller::gblstrain' }

ok( request('/gblstrain')->is_success, 'Request should succeed' );


