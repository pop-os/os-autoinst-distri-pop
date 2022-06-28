use base 'basetest';
use strict;
use testapi;
my $timeout = 300;

sub pop_deb_install {

 send_key 'super';
 type_string 'pop shop';
 send_key 'ret';
 assert_screen 'pop_shop_screen';
 assert_and_click 'pop_pick_steam_install';
 assert_and_click 'pop_pick_steam_change_type';
 assert_and_click 'pop_pick_steam_select_deb';
 assert_and_click 'install_steam';
 assert_screen 'password_dialog';
 type_string "system76\n";
 assert_screen 'pop_pick_steam_installed',1400;
 assert_and_click 'close_pop_shop';
 if (check_screen 'pop_shop_screen') {
 	assert_and_click 'close_pop_shop';
 	}
}

sub test_run_steam {
	record_info('Steam tests');
	pop_deb_install();
}
1;
