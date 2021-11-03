use base 'basetest';
use strict;
use testapi;

sub run {
    for (my $i = 0; $i < 4; $i++) {
    	send_key 'super-t';
    }
   	#check_screen 'check_windows';
   	send_key 'super-y';
	assert_and_click 'check_tiling_1';
	send_key 'super-y';
	
	assert_and_click 'check_tiling_2';
	send_key 'super-y';
	
	
	#assert_and_click 'tiling_options';
	#assert_and_click 'toggle_tiling_on';
	#assert_and_click 'tiling_options';
	#assert_and_click 'toggle_tiling_off';

}
1;
