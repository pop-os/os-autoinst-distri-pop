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


sub run {
#sleep(10);
wait_screen_change(sub {
	send_key 'super-a';
	}, 400);
type_string 'lutris';
#send_key 'ret';
assert_and_click 'applications-lutris';
assert_screen "lutris",1800;
sleep(20);
send_key 'super-t';
assert_screen 'terminal';
type_string "killall -9 lutris\n";
type_string "exit\n";
assert_screen 'desktop';

}

1;
