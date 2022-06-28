use base 'basetest';
use strict;
use testapi;
my $timeout = 300;

sub pop_deb_install {
 sleep(10);
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

sub run_steam_applications {

send_key 'super-a';
type_string 'steam';
assert_screen 'app_library_steam_selected';
send_key 'ret';
assert_screen 'steam_create_account',1400;
assert_and_click 'steam_login_existing';
assert_screen 'steam_login',400;
type_string "system76QA";
send_key 'tab';
type_string "System76 9202269269";
send_key 'tab';
assert_and_click "steam_login_logon";
assert_screen "steam";
sleep(5);
send_key 'super-t';
assert_screen 'terminal';
type_string "killall -9 steam\n";
type_string "exit\n";
assert_screen 'desktop';

}

sub test_run_steam {
	record_info('Steam tests');
	pop_deb_install();
	run_steam_applications();
}
1;
