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

 # Pop Upgrade
    send_key 'super';
    type_string 'upgrade';
    assert_screen 'upgrade_test';
    assert_and_click 'os_upgrade';
    assert_screen 'os_upgrade_screen';
    assert_and_click 'os_upgrade_screen_download';
    assert_screen 'os_upgrade_download_complete',2000;
    assert_and_click 'os_upgrade_screen_upgrade';
    assert_and_click 'os_upgrade_confirm_upgrade';

    assert_screen 'decyrpt_prompt';
    type_string "system76\n";

    assert_screen 'os_upgrade_upgrading',2000;

    assert_screen 'decyrpt_prompt',20000;
    #type_string "system76\n";
    

}

1;
