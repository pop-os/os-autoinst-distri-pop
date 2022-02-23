use base 'basetest';
use strict;
use testapi;
#use lib '/var/lib/openqa/tests/pop/';
#use helpers::displays;
#use helpers::installer::online_accounts;
my $timeout = 400;

sub run {
	#assert_screen 'boot_splash',$timeout;
    power("reset");
    eject_cd();
    
    # Decryption prompt

    assert_screen 'decyrpt_prompt',$timeout;
    type_string "system76\n";


    # GDM and Desktop
 
    assert_screen 'gdm',$timeout;
    send_key 'ret';
    type_string "system76\n";
    sleep(15);
    assert_screen 'desktop';
   
}
1;
