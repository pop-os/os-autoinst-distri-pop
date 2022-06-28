use base 'basetest';
use strict;
use testapi;
my $timeout = 300;


sub install_terminal {

send_key 'super-t';
assert_screen 'terminal';
type_string "sudo apt install -y --allow-downgrades zfs-dkms\n";
type_string "system76";
send_key 'ret';
assert_screen 'zfs-license';
send_key 'ret';
assert_screen 'zfs-install-finished',800;

type_string "exit\n";

assert_screen 'desktop';
}


sub test_run_zfs {
	record_info("zfs test");
	install_terminal();

}


1;
