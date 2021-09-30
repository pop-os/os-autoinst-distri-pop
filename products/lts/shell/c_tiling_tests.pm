use base 'basetest';
use strict;
use testapi;
use helpers::shell::tiling_tests::keyboard_movement;
use helpers::shell::tiling_tests::keyboard_resizing;
use helpers::shell::tiling_tests::keyboard_stacking;
sub run {
	
	movement;
	assert_screen 'desktop';
	resizing;
	assert_screen 'desktop';
	stacking;
	assert_screen 'desktop';
	
   # for (my $i = 0; $i < 3; $i++) {
   # 	send_key 'super-t';
  #  }
   	#check_screen 'check_windows';
   #	send_key 'super-y';
	#assert_and_click 'check_tiling_1';
	#send_key 'super-y';
	
	#assert_and_click 'check_tiling_2';
	#send_key 'super-y';
	


}
1;
