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
use helpers::gnome_display;

sub run {
    # wait for installer language select to apear
    assert_screen 'installer_language_select';

    # press enter to advance 
    send_key 'ret';
    
   #disable_screen_blanking '21.04';

    # wait for the installer language region to appear
    assert_screen 'installer_language_region';

    #assert_and_click 'installer_lauguage_region_select';

    send_key 'ret';
    
    # wait for the installer keyboard layout to appear
    assert_screen 'installer_keyboard_layout';

    send_key 'ret';


    # wait for the installer keyboard region to appear
    assert_screen 'installer_keyboard_region';
    
    send_key 'ret';

     # wait for the installer install options to appear
    assert_screen 'installer_install_decrypt_option';
    
    assert_and_click 'installer_decrypt_select';
   
    assert_screen 'installer_decrypt_drive_select';

    send_key 'ret';
    
    assert_screen 'installer_password_entry';
    
    type_string "system76";

    assert_and_click 'installer_decrypt_unlock';

    # wait for the installer drive option to appear
    assert_screen 'installer_recovery_options';
    assert_and_click 'installer_refesh_select';
    assert_and_click 'installer_recovery_refresh';
    assert_and_click 'installer_refresh_install';
    assert_screen 'installer_refresh_start';
    assert_screen 'installer_finished',600;
    assert_and_click 'installer_finished_reboot';
      
}

1;
