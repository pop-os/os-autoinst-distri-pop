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

sub run {
	sleep(20);
	assert_screen "desktop",400;

# Disable screen lock

     send_key 'super-t';
     assert_screen 'terminal';

    type_string "gsettings set org.gnome.desktop.screensaver lock-enabled false\n";
    type_string "gsettings set org.gnome.desktop.screensaver idle-activation-enabled false\n"; 
    type_string "gsettings set org.gnome.desktop.session idle-delay 0\n";
    type_string "gsettings set org.gnome.settings-daemon.plugins.power idle-dim false\n";  
    type_string "exit\n";

}


1;
