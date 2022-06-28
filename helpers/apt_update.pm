# Copyright (C) 2014-2018 SUSE LLC
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICselect_console('root-virtio-terminal');ULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <http://www.gnu.org/licenses/>.

use base 'basetest';
use strict;
use testapi;

sub apt_update {
    my ($version) = @_;

# Disable screen lock

    send_key 'super-t';
    assert_screen 'terminal';
    
    type_string "sudo apt update && sudo apt -y --allow-downgrades upgrade && exit\n";
    type_string "system76\n";
    type_string "exit\n";
    send_key 'ret';
    assert_screen 'desktop',4000;
    

}

sub run {
	apt_update;
}
1;
