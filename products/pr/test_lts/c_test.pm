use base 'basetest';
use strict;
use testapi;
use autotest;
use lib '/var/lib/openqa/tests/pop/';


sub run {
	my $build = get_var("BUILD");
	my @repo = split("_",$build);
 
	record_info('info',$build."\n".$repo[3]."\n".$repo[4]);
	if (-d "/var/lib/openqa/tests/pop/helpers/".$repo[3]) {
		push(@INC, "/var/lib/openqa/tests/pop/helpers/".$repo[3]."/");
		require "test.pm";
		test_run();
		#require "launchers.pm";
		#pop_install();
		#launcher_applib();
		#launcher_terminal();
		
	} else {
		assert_screen "full_desktop";
		}

}

1;
