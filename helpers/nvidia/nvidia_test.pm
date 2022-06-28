use base 'basetest';
use strict;
use testapi;
my $timeout = 300;


sub install_terminal {

send_key 'super-t';
assert_screen 'terminal';
type_string "sudo apt install -y --allow-downgrades system76-driver-nvidia\n";
type_string "system76";
send_key 'ret';
assert_screen 'nvidia-install-finished',1000;

type_string "exit\n";

assert_screen 'desktop';
}


sub test_run_nvidia() {
	record_info("Nvidia test");
	install_terminal();

}


1;
