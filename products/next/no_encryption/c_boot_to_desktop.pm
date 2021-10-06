use base 'basetest';
use strict;
use testapi;
#use lib '/var/lib/openqa/tests/pop/';
#use helpers::displays;
#use helpers::installer::avatar_tests;

sub run {

  # GDM and Desktop
 
    assert_screen 'gdm';
    send_key 'ret';
    type_string "system76\n";
    assert_screen 'desktop';


} 
1;
