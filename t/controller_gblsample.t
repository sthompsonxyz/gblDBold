use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'GBLCCDB3' }
BEGIN { use_ok 'GBLCCDB3::Controller::gblsample' }

ok( request('/gblsample')->is_success, 'Request should succeed' );


