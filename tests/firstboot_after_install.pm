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

    
    # Decryption prompt

    assert_screen 'decyrpt_prompt';
    type_string "system76\n";


    # GDM and Desktop
 
    assert_screen 'gdm';
    send_key 'ret';
    type_string "system76\n";
    assert_screen 'desktop';

    # Initial Setup

    assert_screen 'initial_dialog';
    send_key 'ret';


    # Typing screen 
 
    assert_screen 'initial_dialog_typing';

      # Need to add input tests.

    send_key 'ret';

    # Privacy

    assert_screen 'initial_dialog_privacy';

      # Need to add toggle test

    send_key 'ret';

    # Time Zone screen

    check_screen 'system_timezone_updated';
    
    assert_screen 'initial_dialog_timezone';

      # Need to add map click test

    assert_and_click 'initial_dialog_timezone_select_search';
    type_string "Denver\n";
    assert_and_click 'initial_dialog_timezone_next';

    # Online Accounts 

    assert_screen 'initial_dialog_online_accounts';

      # We may want to add tests here for online account setup.

    assert_and_click 'initial_dialog_online_accounts_skip';

   # finish Screen
   
   assert_screen 'finished';
   send_key 'ret';

   # Back to desktop

   assert_screen 'desktop';    

}

1;
