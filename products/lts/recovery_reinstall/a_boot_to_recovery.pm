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
#use lib '/var/lib/openqa/tests/pop/';
#use helpers::displays;
#use helpers::installer::online_accounts;

sub run {
    eject_cd();
    assert_screen 'uefi';
    # Decryption prompt

    assert_screen 'decyrpt_prompt';
    type_string "system76\n";


    # GDM and Desktop
 
    assert_screen 'gdm';
    send_key 'ret';
    type_string "system76\n";
    assert_screen 'desktop';
    
#    disable_screen_blanking '20.04';

    # changing boot option
    
    #send_key 'super-t';
    #type_string 'terminal';
    #send_key 'ret';
    #hold_key 'ctrl';
    #send_key '1';
    #release_key 'ctrl';
     wait_screen_change( sub {
    	send_key 'super-t';
    	#type_string 'terminal';
    	#send_key 'ret';
    	
    },6000);
    #assert_screen 'terminal',$timeout;
    assert_screen 'terminal';
    type_string "gsettings set org.gnome.desktop.screensaver lock-enabled false\n";
    type_string "gsettings set org.gnome.desktop.screensaver idle-activation-enabled false\n";   
    type_string "killall totem\n";
    type_string "sudo su\n";
    type_string "system76\n";
    type_string "cd /boot/efi/loader\n";
    type_string "mv loader.conf loader.conf-old\n";
    type_string 'echo "default Pop_OS-Recovery" > loader.conf';  
    type_string "\nreboot\n";


}

1;
