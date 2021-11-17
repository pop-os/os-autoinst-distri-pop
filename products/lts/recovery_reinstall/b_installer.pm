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
use helpers::installer::avatar_tests;
use helpers::displays;
my $timeout = 400;
sub run {
	assert_screen 'desktop';
	#disable_screen_blanking '20.04';
    # wait for installer language select to apear
    assert_screen 'installer_language_select';

    # press enter to advance 
    send_key 'ret';

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
    assert_screen 'installer_install_option';
    
    send_key 'ret';

    # wait for the installer drive option to appear
    assert_screen 'installer_drive_option';
    assert_and_click 'installer_drive_select';
    assert_and_click 'installer_erase_and_install';    
    
    # wait for create user account screen to appear
    assert_screen 'installer_user_account_screen';
    type_string "System 76";
    
    avatar_selection_test;
    
    assert_and_click 'installer_user_account_confirm';

    # wait for password screen 
    assert_screen 'installer_password_screen';
    type_string "system76";
    send_key 'tab';
    type_string "system76";
    assert_and_click 'installer_password_confirm';

    # wait for encryption screen
    assert_screen 'installer_encryption_screen';
    send_key 'ret';
    assert_and_click 'installer_encryption_confirm';

    # wait for installation to finish

    assert_screen 'installer_partitioning';
    assert_screen 'installler_extracting_files';

    if(check_screen 'installer_failed',80){
       die;
    }
 
    assert_screen 'installer_finished',20*$timeout;
    assert_and_click 'installer_finished_reboot';

    #assert_screen 'desktop',80;
    
      
}

1;
