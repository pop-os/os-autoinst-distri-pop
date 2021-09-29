use base 'basetest';
use strict;
use testapi;

sub keyboard_stacking {
	
	## Disable Highlight
	assert_screen 'desktop';
	#assert_and_click 'tiling_menu',60;
	#assert_screen 'tiling_menu_visible',60;
	
	#assert_and_click 'active_hint_disable',60;
	
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
	

		
	
	## Stacking tests
	
	record_info('Stacking','Stacking Tests');
	if (check_screen 'check_stacking_init' == undef) {
		send_key 'super-left';
		send_key 'super_up';
		assert_screen 'check_upper_left_highlight';
	}
	send_key 'super-left';
	send_key 'super-up';
	#send_key 'super-up';
	send_key 'super-s';
	assert_screen 'check_stacking_init';
	send_key 'super-down';
	send_key 'super-ret';
	send_key 'up';
	assert_screen 'check_stack_increase';
	send_key 'ret';
	assert_screen 'check_stack_selection_clear';
	send_key 'super-right';
	send_key 'super-right';
	assert_screen 'check_right_window_selection';
	send_key 'super-ret';
	send_key 'left';
	send_key 'ret';
	assert_screen 'check_stack_increase';
	send_key 'ret';
	send_key 'super-ret';
	send_key 'right';
	send_key 'ret';
	assert_screen 'check_stack_decrease';
	send_key 'super-left';
	send_key 'super-ret';
	send_key 'right';
	send_key 'ret';
	assert_screen 'check_stack_decrease';
	send_key 'super-left';
	send_key 'super-s';
	assert_screen 'check_disabled_stack';
	send_key 'super-y';
	send_key 'super-y';
	assert_and_click 'check_tiling_2';
	
	type_string 'killall gnome-terminal-*';
	send_key 'ret';
	send_key 'super-y';
	assert_screen 'desktop';
}
1;
