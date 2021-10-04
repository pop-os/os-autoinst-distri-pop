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
use helpers::installer::online_accounts;

sub run {
    
    #assert_screen 'boot_splash';
    #eject_cd();
    #power("reset");
    

    # GDM and Desktop
 
    #assert_screen 'gdm';
    #send_key 'ret';
    #type_string "system76\n";
    #assert_screen 'desktop';
    
    
    # Disable screen lock
    
    #disable_screen_blanking '21.04';
    
    # Initial Setup

    assert_screen 'initial_dialog';
    send_key 'ret';


    # Typing screen 
 
    assert_screen 'initial_dialog_typing';

      # Need to add input tests.

    send_key 'ret';

    # Cosmic Dock options

    assert_screen 'initial_dialog_cosmic_dock';

    assert_and_click 'initial_dialog_cosmic_dock_no_dock';
    assert_screen 'initial_dialog_cosmic_dock_no_dock_check';
    
    assert_and_click 'initial_dialog_cosmic_dock_extend_dock';
    assert_screen 'initial_dialog_cosmic_dock_extend_check';

    assert_and_click 'initial_dialog_cosmic_dock_no_extend_dock';
    assert_screen 'initial_dialog_cosmic_dock_no_extend_check';

    assert_and_click 'initial_dialog_cosmic_dock_extend_dock';
    assert_screen 'initial_dialog_cosmic_dock_extend_check';
    

    assert_and_click 'initial_dialog_cosmic_dock_click';
    
    # Cosmic Top Bar

    assert_screen 'inital_dialog_top_bar';

    assert_and_click 'initial_dialog_top_bar_workspace_off';
    assert_screen 'initial_dialog_top_bar_workspace_off_check';

    assert_and_click 'initial_dialog_top_bar_applications_off';
    assert_screen 'initial_dialog_top_bar_applications_off_check';

    assert_and_click 'initial_dialog_top_bar_workspace_on';
    assert_screen 'initial_dialog_top_bar_workspace_on_check';

    assert_and_click 'initial_dialog_top_bar_applications_on';
    assert_screen 'initial_dialog_top_bar_applications_on_check';

    assert_and_click 'initial_dialog_top_bar_datetime_list';
    assert_screen 'initial_dialog_top_bar_datetime_list_check';

    assert_and_click 'initial_dialog_top_bar_datetime_left';
    assert_screen 'initial_dialog_top_bar_datetime_left_check';
    
    send_key('ret');
    send_key('down');
    send_key('ret');

    assert_screen 'initial_dialog_top_bar_datetime_right_check';
    
    send_key('ret');
    send_key('up');
    send_key('up');
    send_key('ret');
    
    assert_screen 'initial_dialog_top_bar_datetime_center_check';

    assert_and_click 'initial_dialog_cosmic_dock_click';
    #send_key('ret');

    # Launcher info
   
    assert_screen 'initial_dialog_launcher_info';

    #assert_and_click 'initial_dialog_cosmic_dock_click';
    send_key('ret');


    # Gestures
   
    assert_screen 'initial_dialog_gestures_info';
    send_key('ret');

    # Privacy

    assert_screen 'initial_dialog_privacy';

      # Need to add toggle test

    send_key 'ret';

    # Time Zone screen

    check_screen 'system_timezone_updated';
    
    assert_screen 'initial_dialog_timezone';

      # Need to add map click test

    assert_and_click 'initial_dialog_timezone_select_search';
    type_string "Denver";
    send_key('ret');
    assert_and_click 'initial_dialog_timezone_select_mt';

    assert_screen 'initial_dialog_timezone_mt_selected';


    assert_and_click 'initial_dialog_timezone_next';
    assert_and_click 'initial_dialog_timezone_next';

    # Online Accounts 

    assert_screen 'initial_dialog_online_accounts';

    online_accounts_quick_test;

    assert_and_click 'initial_dialog_online_accounts_skip';

   # finish Screen
   
   assert_screen 'finished';
   send_key 'ret';

   # Back to desktop

   assert_screen 'desktop';    

}

1;
