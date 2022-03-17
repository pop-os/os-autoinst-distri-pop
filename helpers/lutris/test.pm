use base 'basetest';
use strict;
use testapi;
use lib '/var/lib/openqa/tests/pop/';
#use helpers::displays;

sub test_run {
		require "shop.pm";
		require "launchers.pm";
		#pop_install();
		launcher_applib();
		launcher_terminal();
}
1;
