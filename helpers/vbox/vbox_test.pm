use base 'basetest';
use strict;
use testapi;
my $timeout = 300;


sub install_pop_shop {

 send_key 'super';
 type_string 'pop shop';
 send_key 'ret';
 assert_screen 'pop_shop_screen';
 assert_and_click 'pop_search_virtualbox';
 type_string "virtualbox";
 send_key 'ret';
 assert_and_click 'pop_click_virtualbox';
 
 #if (check_screen 'password_dialog') {
	 assert_screen 'password_dialog';
	 type_string "system76\n";
#	 }
	 
 assert_screen 'pop_virtualbox_installed',1400;
 assert_and_click 'close_pop_shop';

 if (check_screen 'pop_shop_screen') {
 	assert_and_click 'close_pop_shop';
 	}
}

sub launch_vbox_applications {

send_key 'super-a';
type_string 'virtualbox';
assert_screen 'app_library_virtualbox_selected';
send_key 'ret';
assert_screen "virtualbox";
sleep(5);
send_key 'super-t';
assert_screen 'terminal';
type_string "killall -9 VirtualBox\n";
type_string "exit\n";
assert_screen 'desktop';

}

sub test_run_vbox() {
	record_info("Vbox test");
	sleep(10);
	install_pop_shop();
	launch_vbox_applications();

}


1;
