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
use helpers::apt_update;

sub run {

    # restart to get around installer issue
    eject_cd; 
    #power("reset");
    
    # Decryption prompt

    assert_screen 'decyrpt_prompt';
    type_string "system76\n";

    # GDM and Desktop

    assert_screen 'gdm';
    send_key 'ret';
    type_string "system76\n";
    sleep(15);
    assert_screen 'desktop',400;
	apt_update;
   # disable_screen_blanking '20.04';

}

1;
