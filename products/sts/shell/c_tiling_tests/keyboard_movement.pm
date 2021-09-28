use base 'basetest';
use strict;
use testapi;

sub run {
	## Standard Tiling tests
	
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
	
	## Enable Highlight
	
	assert_and_click 'tiling_menu';
	assert_and_click 'active_hint';
	assert_screen 'active_hint_enabled';
	
	
	## Movement tests
	
	record_info('focus arrows','Movement using arrow keys');
	
	send_key 'super-right';
	assert_screen 'check_window_border_right';
	send_key 'super-down';
	assert_screen 'check_window_border_down';
	send_key 'super-up';
	assert_screen 'check_window_border_up';
	
	send_key 'super-down';
	assert_screen 'check_window_border_down';
	send_key 'super-right';
	assert_screen 'check_window_border_right';
	send_key 'super-left';
	assert_screen 'check_window_border_down';
	send_key 'super-up';
	assert_screen 'check_window_border_up';
	
	record_info('focus vim','Movement using  vim shortcuts');
	
	send_key 'super-l';
	assert_screen 'check_window_border_right';
	send_key 'super-j';
	assert_screen 'check_window_border_down';
	send_key 'super-k';
	assert_screen 'check_window_border_up';
	
	send_key 'super-j';
	if (check_screen 'check_window_border_down' == undef) {
		record_info('super-j','Movement using j failed to work on first attempt');
		send_key 'super-j';
	}
	assert_screen 'check_window_border_down';
	send_key 'super-l';
	assert_screen 'check_window_border_right';
	send_key 'super-j';
	assert_screen 'check_window_border_down';
	send_key 'super-k';
	assert_screen 'check_window_border_up';
	
	record_info('movement arrows','Movement using arrow keys');
	
	send_key 'super-ret';
	assert_screen 'check_window_highlight';
	send_key 'right';
	assert_screen 'check_window_movement_right';
	send_key 'down';
	assert_screen 'check_window_movement_down';
	send_key 'left';
	assert_screen 'check_window_movement_left';
	send_key 'up';
	assert_screen 'check_window_movement_up';
	send_key 'ret';
	
	record_info('movement vim','Movement using vim shortcuts');
	
	send_key 'super-ret';
	assert_screen 'check_window_highlight';
	send_key 'l';
	assert_screen 'check_window_movement_right';
	send_key 'j';
	assert_screen 'check_window_movement_down';
	send_key 'h';
	assert_screen 'check_window_movement_left';
	send_key 'k';
	assert_screen 'check_window_movement_up';
	send_key 'ret';
	
	type_string 'killall gnome-terminal-*';
	send_key 'ret';
	send_key 'super-y';
	assert_screen 'desktop';
}
1;
