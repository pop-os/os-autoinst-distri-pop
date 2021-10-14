use base 'basetest';
use strict;
use testapi;
#use lib '/var/lib/openqa/tests/pop/';
#use helpers::displays;
#use helpers::installer::online_accounts;
my $timeout = 400;

sub run {    
    # Decryption prompt

    assert_screen 'decyrpt_prompt',$timeout;
    type_string "system76\n";


    # GDM and Desktop
 
    assert_screen 'gdm',$timeout;
    send_key 'ret';
    type_string "system76\n";
    assert_screen 'desktop',$timeout;
   
}
1;
