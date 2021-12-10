# Copyright (C) 2014-2018 SUSE LLC
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <http://www.gnu.org/licenses/>.

use base 'basetest';
use strict;
use testapi;
#use lib '/var/lib/openqa/tests/pop/';
#use helpers::displays;
my @apps = ("steam","lutris","gimp","blender","obs");

sub run {
 my $length = @apps;
 for (my $i = 0;$i < $length;$i++) {
    record_info($apps[$i],"Install test for".$apps[$i]);
 	send_key 'super-a';
 	type_string 'pop shop';
 	send_key 'ret';
 	assert_screen 'pop_shop_screen';
 	#if ($apps[$i] =~ /pick_/) {
 	#	assert_and_click "pop_".$apps[$i]."_install";
 	#} else {
 	assert_and_click 'pop_shop_search';
 	type_string $apps[$i]."\n";
 	wait_screen_change(sub {
 		assert_and_click "pop_shop_search_".$apps[$i];
 	},400);
 	wait_screen_change(sub {
 		assert_and_click "uninstall_".$apps[$i];
 	},400);
	wait_screen_change(sub {
 		if (check_screen 'password_dialog',40 != undef) {
 			save_screenshot();
 			type_string "system76";
 			send_key 'ret';
 		}
 	},400);
 	assert_screen "install_".$apps[$i],400;
 	assert_and_click 'close_pop_shop';
 	sleep(5);
 	assert_screen 'desktop';
 	}
 
}

1;
