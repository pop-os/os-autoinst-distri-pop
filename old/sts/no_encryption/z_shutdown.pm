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
use helpers::displays;

sub run {
    # wait for boot to finish
    assert_and_click "system_menu";
    assert_and_click "system_menu_power_off";
    assert_and_click "system_menu_power_off_power_off";
    assert_and_click "dialog_power_off";
    assert_screen "system_down";
    #eject_cd;
    #power('off');
    assert_shutdown(200);
    

}

1;
