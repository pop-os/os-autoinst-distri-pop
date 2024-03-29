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
my $timeout = 400;
sub run {
    # wait for installer language select to apear
    assert_screen 'installer_language_select',$timeout;

    #disable_screen_blanking '21.04';
	#send_key 'tab';
    # press enter to advance 
    send_key 'ret';

    # wait for the installer language region to appear
    assert_screen 'installer_language_region',$timeout;

    assert_and_click 'installer_lauguage_region_select',$timeout;

    #send_key 'ret';
    
    # wait for the installer keyboard layout to appear
    assert_screen 'installer_keyboard_layout',$timeout;

    send_key 'ret';


    # wait for the installer keyboard region to appear
    assert_screen 'installer_keyboard_region',$timeout;
    
    send_key 'ret';

    # wait for the installer install options to appear
   # assert_and_click 'installer_install_option',$timeout;
    assert_and_click 'installer_install_option',$timeout;
    #send_key 'return';
    assert_and_click 'installer_install_option_next',$timeout;
    #send_key 'ret';

    # wait for the installer drive option to appear
    assert_screen 'installer_drive_option',$timeout;
    assert_and_click 'installer_drive_select',$timeout;
    assert_and_click 'installer_erase_and_install',$timeout;    
    
    # wait for create user account screen to appear
    assert_screen 'installer_user_account_screen',$timeout;
    type_string "System 76";
    assert_and_click 'installer_user_account_confirm',$timeout;

    # wait for password screen 
    assert_screen 'installer_password_screen',$timeout;
    type_string "system76";
    send_key 'tab';
    type_string "system76";
    assert_and_click 'installer_password_confirm',$timeout;

    # wait for encryption screen
    assert_screen 'installer_encryption_screen',$timeout;
    send_key 'ret';
    #assert_and_click 'installer_encryption_confirm',$timeout;

    # wait for installation to finish

    assert_screen 'installer_partitioning',$timeout;
    wait_screen_change {
        assert_screen 'installler_extracting_files',$timeout;
    };
    if(check_screen 'installer_failed',80){
       die;
    }
   
    assert_screen 'installer_finished',$timeout*20;
    
    assert_and_click 'installer_finished_reboot',$timeout;
	#assert_screen 'boot_splash',$timeout;
	sleep(10);
    power("reset");
    eject_cd();
    #assert_screen 'desktop',80;
    
      
}

1;
