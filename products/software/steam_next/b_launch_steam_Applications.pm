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

send_key 'super-a';
enter_cmd 'steam';
#send_key 'ret';
assert_screen 'steam_create_account',400;
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

1;
