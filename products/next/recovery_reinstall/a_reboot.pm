use base 'basetest';
use strict;
use testapi;
#use lib '/var/lib/openqa/tests/pop/';
#use helpers::displays;
#use helpers::installer::online_accounts;
my $timeout = 400;

sub run {    
    assert_screen 'desktop',$timeout;
   
}
1;
