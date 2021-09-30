use base 'basetest';
use strict;
use testapi;

sub resizing {

	assert_screen 'desktop';

	
	send_key 'super-y';
    for (my $i = 1; $i < 4; $i++) {
    	send_key 'super-t';
    	assert_screen 'tiled_screens_'.$i;
    	
    }
	assert_and_click 'check_tiling_1';
	send_key 'super-y';
	check_screen 'check_windows';
	send_key 'super-y';
	assert_and_click 'check_tiling_2';
	
	## Begin keyboard resizing tests
	
	send_key 'super-ret';
	assert_screen 'check_window_highlight';
	for (my $i = 1; $i <= 2; $i++) {
		send_key 'shift-right';
		#send_key 'shift-down';
		assert_screen 'check_window_resize_Horizontal_'.$i;
	}
	send_key 'ret';
	
	assert_screen 'check_window_resized_1';
	send_key 'super-left';
	send_key 'super-ret';
	assert_screen 'check_window_highlight_right';
	
	
	for (my $i = 1; $i <= 2; $i++) {
		#send_key 'shift-right';
		send_key 'shift-down';
		assert_screen 'check_window_resize_Vertical_'.$i;
	}
	send_key 'ret';
	
	
	
	type_string 'killall gnome-terminal-*';
	send_key 'ret';
	send_key 'super-y';
	assert_screen 'desktop';
}
1;
