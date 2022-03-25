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
my $timeout = 400;

sub run {
    #power("reset");
	#eject_cd;
    
    # Decryption prompt

    #assert_screen 'decyrpt_prompt',$timeout;
    #type_string "system76\n";


    # GDM and Desktop
 
    #assert_screen 'gdm',$timeout;
    #send_key 'ret';
    #type_string "system76\n";
    #assert_screen 'desktop',$timeout;

    # Initial Setup

#    assert_screen 'initial_dialog',$timeout;
#    send_key 'ret';

    #disable_screen_blanking '21.04';
	

    # Typing screen 
 
#    assert_screen 'initial_dialog_typing',$timeout;

      # Need to add input tests.

#    send_key 'ret';

    # Cosmic Dock options

    assert_screen 'initial_dialog_cosmic_dock',$timeout;

    assert_and_click 'initial_dialog_cosmic_dock_no_dock',$timeout;
    assert_screen 'initial_dialog_cosmic_dock_no_dock_check',$timeout;
    
    assert_and_click 'initial_dialog_cosmic_dock_extend_dock',$timeout;
    assert_screen 'initial_dialog_cosmic_dock_extend_check',$timeout;

    assert_and_click 'initial_dialog_cosmic_dock_no_extend_dock',$timeout;
    assert_screen 'initial_dialog_cosmic_dock_no_extend_check',$timeout;

    assert_and_click 'initial_dialog_cosmic_dock_extend_dock',$timeout;
    assert_screen 'initial_dialog_cosmic_dock_extend_check',$timeout;
    

    assert_and_click 'initial_dialog_cosmic_dock_click',$timeout;
    
    # Cosmic Top Bar

    assert_screen 'inital_dialog_top_bar',$timeout;

    assert_and_click 'initial_dialog_top_bar_workspace_off',$timeout;
    assert_screen 'initial_dialog_top_bar_workspace_off_check',$timeout;

    assert_and_click 'initial_dialog_top_bar_applications_off',$timeout;
    assert_screen 'initial_dialog_top_bar_applications_off_check',$timeout;

    assert_and_click 'initial_dialog_top_bar_workspace_on',$timeout;
    assert_screen 'initial_dialog_top_bar_workspace_on_check',$timeout;

    assert_and_click 'initial_dialog_top_bar_applications_on',$timeout;
    assert_screen 'initial_dialog_top_bar_applications_on_check',$timeout;

    assert_and_click 'initial_dialog_top_bar_datetime_list',$timeout;
    assert_screen 'initial_dialog_top_bar_datetime_list_check',$timeout;

    assert_and_click 'initial_dialog_top_bar_datetime_left',$timeout;
    assert_screen 'initial_dialog_top_bar_datetime_left_check',$timeout;
    
    send_key('ret');
    send_key('down');
    send_key('ret');

    assert_screen 'initial_dialog_top_bar_datetime_right_check',$timeout;
    
    send_key('ret');
    send_key('up');
    send_key('up');
    send_key('ret');
    
    assert_screen 'initial_dialog_top_bar_datetime_center_check',$timeout;

    assert_and_click 'initial_dialog_cosmic_dock_click',$timeout;
    #send_key('ret');

    # Launcher info
   
    assert_screen 'initial_dialog_launcher_info',$timeout;

    #assert_and_click 'initial_dialog_cosmic_dock_click';
    send_key('ret');


    # Gestures
   
    assert_screen 'initial_dialog_gestures_info',$timeout;
    send_key('ret');

    # Appearance
    
    assert_screen 'initial_dialog_appearance',$timeout;
    assert_and_click 'initial_dialog_appearance_light',$timeout;
    assert_and_click 'initial_dialog_appearance_dark',$timeout;
    assert_and_click 'initial_dialog_appearance_next',$timeout;

    # Privacy

    assert_screen 'initial_dialog_privacy',$timeout;

      # Need to add toggle test

    send_key 'ret';

    # Time Zone screen

    check_screen 'system_timezone_updated';
    
    assert_screen 'initial_dialog_timezone',$timeout;

      # Need to add map click test

    assert_and_click 'initial_dialog_timezone_select_search',$timeout;
    type_string "Denver";
    send_key('ret');
    assert_and_click 'initial_dialog_timezone_select_mt',$timeout;

    assert_screen 'initial_dialog_timezone_mt_selected',$timeout;


    assert_and_click 'initial_dialog_timezone_next',$timeout;
    

    # Online Accounts 

    assert_screen 'initial_dialog_online_accounts',$timeout;

    online_accounts_quick_test;

    assert_and_click 'initial_dialog_online_accounts_skip',$timeout;

   # finish Screen
   
   assert_screen 'finished',$timeout;
   send_key 'ret';

   # Back to desktop

   assert_screen 'desktop',$timeout;    

}

1;
