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


sub run {

 send_key 'super';
 type_string 'pop!_shop';
 send_key 'ret';
 assert_screen 'pop_shop_screen';
 
 assert_and_click 'pop_shop_search';
 type_string "lutris";
 assert_and_click 'pop_shop_lutris';
 
 assert_and_click 'uninstall_lutris';
 #assert_screen 'password_dialog';
 #type_string "system76\n";
 assert_screen 'install_lutris',400;
 assert_and_click 'close_pop_shop';
 
}

1;
