# Copyright (C) 2014-2018 SUSE LLC
#
# This program is free software; you can retestbute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is testbuted in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use strict;
use testapi;
use autotest;
#use switch;
sub run {
# We set the test folder by retrieving the name of the test suite. [pop_lts,pop_sts,etc.]	
	my $test = testapi::get_var("TEST");
	diag($test);
	my @base = split('_',$test);
	my @sub = split('pop_lts',$test);
#testapi::set_var('PRODUCTDIR','products/'.$base[1]);

# We also need to set a needle directory.
#testapi::set_var('NEEDLES_DIR','needles');

	my $root = 'products/'.$base[1].'/';

	if (index($test,'shell') != -1) {
	   	autotest::loadtest "./".$sub[1].'/boot_to_desktop.pm';
	    autotest::loadtest "./".$sub[1].'/pop_shop_upgrade.pm';
   
   		my @tests = ("keyboard_movement","keyboard_resizing","keyboard_stacking");
   		foreach ( @tests ) {
   			autotest::loadtest "./".$sub[1].'shell/tiling_tests/'.$_.".pm";
   		}
   
   		autotest::loadtest "./".$sub[1].'/appmenu_tests.pm';
   		autotest::loadtest "./".$sub[1].'/launcher_tests.pm';
   		autotest::loadtest "./".$sub[1].'/gcc_tests.pm';
   		autotest::loadtest "./".$sub[1].'/workspace_tests.pm';
	} elsif (index($test,'upgrade') != -1) {
   
	   autotest::loadtest "./".$sub[1].'/boot_to_desktop.pm';
	   autotest::loadtest "./".$sub[1].'/pop_shop_upgrade.pm';
	   autotest::loadtest "./".$sub[1].'/system_upgrade.pm';
	   autotest::loadtest "./".$sub[1].'/tests/firstboot_after_upgrade.pm';
	   autotest::loadtest "./".$sub[1].'/tests/shutdown.pm';
	} elsif (index($test,'refresh_from_OS') != -1) {
   	   autotest::loadtest "./".$sub[1].'/boot_to_desktop.pm';
	   autotest::loadtest "./".$sub[1].'/pop_shop_upgrade.pm';
	   autotest::loadtest "./".$sub[1].'/system_recovery_refresh.pm';
	   autotest::loadtest "./".$sub[1].'/shutdown.pm';
	} elsif (index($test,'recovery') != -1) {
   		autotest::loadtest "./".$sub[1].'/tests/firstboot_after_install.pm';
   		autotest::loadtest "./".$sub[1].'/tests/installer.pm';
	} elsif (index($test,'pop_lts') != -1) {
		diag("Got to the test area");
   		autotest::loadtest $root.'std/boot_to_installer.pm';
   		autotest::loadtest $root.'std/installer.pm';
   		autotest::loadtest $root.'std/firstboot_after_install.pm';
   		autotest::loadtest $root.'std/shutdown.pm';
	}

}
1;
