use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'GBLCCDB3' }
BEGIN { use_ok 'GBLCCDB3::Controller::samsbiotools' }

ok( request('/samsbiotools')->is_success, 'Request should succeed' );


