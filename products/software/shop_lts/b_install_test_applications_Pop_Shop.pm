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
use lib '/var/lib/openqa/tests/pop/';
#use helpers::displays;
my @apps = ("steam","lutris","gimp","blender","obs");

sub run {
 my $length = @apps;
 for (my $i = 0;$i < $length;$i++) {
 	record_info($apps[$i],"Install test for".$apps[$i]);
 	send_key 'super';
 	type_string 'pop shop';
 	send_key_until_needlematch('pop_shop_screen','ret');
 	assert_screen 'pop_shop_screen',400;
 	if ($apps[$i] =~ /pick_/) {
 		assert_and_click "pop_".$apps[$i]."_install";
 	} else {
 		assert_and_click 'pop_shop_search';
 		wait_screen_change(sub {
 			type_string $apps[$i]."\n";
 		},400);
 		assert_and_click "pop_shop_search_".$apps[$i];
 	}
 	assert_and_click "change_type";
 	assert_and_click "change_type_deb";
 	assert_and_click "install_".$apps[$i];
 	
 	#wait_screen_change(sub {
 	#    record_info("screen changed");
 	    if (check_screen 'password_dialog',180 != undef) {
 	    
 	    #if (check_screen 'password_dialog',60 != undef) {
 	           save_screenshot();
 			    type_string "system76";
 			    send_key 'ret';
 		} else {
 		    record_info("No dialog");
 		    }
 	#},400);
 	
 	assert_screen "pop_".$apps[$i]."_installed",1800;
 	force_soft_failure(["install may have malfunctioned"]);
 	assert_and_click 'close_pop_shop';
 	sleep(5);
 	assert_screen 'desktop';
 	#sleep(120);
	}
}

1;
