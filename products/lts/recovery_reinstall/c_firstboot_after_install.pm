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

    assert_screen 'uefi',$timeout;
    power("reset");
    eject_cd();
    
    # Decryption prompt

    assert_screen 'decyrpt_prompt',$timeout;
    type_string "system76\n";


    # GDM and Desktop
 
    assert_screen 'gdm',$timeout;
    send_key 'ret';
    type_string "system76\n";
    assert_screen 'desktop';
    
    ##disable_screen_blanking;
    
     send_key 'super';
     type_string 'terminal';
     send_key 'ret';
    
     assert_screen 'terminal';
     type_string "gsettings set org.gnome.desktop.screensaver lock-enabled false\n";
    type_string "gsettings set org.gnome.desktop.screensaver idle-activation-enabled false\n"; 
    type_string "gsettings set org.gnome.desktop.session idle-delay 0\n";
    type_string "gsettings set org.gnome.settings-daemon.plugins.power idle-dim false\n";  
    type_string "exit\n";
    

    # Initial Setup

    assert_screen 'initial_dialog',$timeout;
    send_key 'ret';
	
	
    # Typing screen 
 
    assert_screen 'initial_dialog_typing',$timeout;

      # Need to add input tests.

    send_key 'ret';

    # Privacy

    assert_screen 'initial_dialog_privacy',$timeout;

      # Need to add toggle test

    send_key 'ret';

    # Time Zone screen

    check_screen 'system_timezone_updated',$timeout;
    
    assert_screen 'initial_dialog_timezone',$timeout;

      # Need to add map click test

    assert_and_click 'initial_dialog_timezone_select_search',$timeout;
    type_string "Denver\n";
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
