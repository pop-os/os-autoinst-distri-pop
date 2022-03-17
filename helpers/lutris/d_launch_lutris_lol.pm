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

send_key 'super';
type_string 'lutris';
send_key 'ret';
assert_screen "lutris",1800;
#sleep(20);
assert_and_click "lutris-sources-lutris";
assert_and_click "lutris-sources-lutris-community_Installers";
assert_and_click "lutris-search";
assert_screen "lutris-search-focus";
type_string "League of Legends";
send_key "ret";
assert_screen "lutris-found-games";
assert_and_click "lutris-lol-installer";
assert_and_click "lutris-install";
assert_and_click "lutris-lol-installer-select-dialog";
assert_and_click "lutris-lol-install-location-dialog";
assert_and_click "lutris-lol-package-selection-dialog";
assert_and_click "lutris-lol-region-select-dialog",800;
assert_and_click "lol-installer",800;
assert_and_click "lol-riot-launcher",1800;
assert_and_click "lutris-install-option-menu-icon-select";
assert_and_click "lustris-install-option-launch";






}

1;
