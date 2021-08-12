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

sub run {
    # wait for installer language select to apear
    assert_screen 'installer_language_select';

    # press enter to advance 
    send_key 'ret';

    # wait for the installer language region to appear
    assert_screen 'installer_language_region';

    #assert_and_click 'installer_lauguage_region_select';

    send_key 'ret';
    
    # wait for the installer keyboard layout to appear
    assert_screen 'installer_keyboard_layout',300;

    send_key 'ret';


    # wait for the installer keyboard region to appear
    assert_screen 'installer_keyboard_region',300;
    
    send_key 'ret';


    # wait for the installer install options to appear
    assert_screen 'installer_install_option',300;
    
    send_key 'ret';


    # wait for the installer drive option to appear
    assert_screen 'installer_drive_option',300;
    
    #send_key 'ret';
      
}

1;
