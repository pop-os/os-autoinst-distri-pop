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
my $timeout = 400;
sub run {
    eject_cd();
    assert_screen 'uefi',$timeout;
    # Decryption prompt

    assert_screen 'decyrpt_prompt',$timeout;
    type_string "system76\n";


    # GDM and Desktop
 
    assert_screen 'gdm',$timeout;
    send_key 'ret';
    type_string "system76\n";
    assert_screen 'desktop',$timeout;
    
    # changing boot option
    
    wait_screen_change( sub {
    	send_key 'super-t';
    	assert_screen 'terminal';
    },600);
    
    
    type_string "sudo su\n";
    type_string "system76\n";
    type_string "cd /boot/efi/loader\n";
    type_string "mv loader.conf loader.conf-old\n";
    type_string 'echo "default Pop_OS-Recovery" > loader.conf';  
    type_string "\nreboot\n";


}

1;
