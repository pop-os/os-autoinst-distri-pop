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
my $timeout = 300;

sub displays {

	assert_screen 'desktop';

    send_key 'super-t';
    assert_screen 'terminal';

    type_string "gsettings set org.gnome.desktop.screensaver lock-enabled false\n";
    type_string "gsettings set org.gnome.desktop.screensaver idle-activation-enabled false\n"; 
    type_string "gsettings set org.gnome.desktop.session idle-delay 0\n";
    type_string "gsettings set org.gnome.settings-daemon.plugins.power idle-dim false\n";  
    type_string "exit\n";
}

sub reboot {

    # wait for boot to finish
    assert_and_click "system_menu";
    assert_and_click "system_menu_power_off";
    assert_and_click "system_menu_power_restart";
    assert_and_click "dialog_power_restart";
    check_screen "system_down",200;
    #eject_cd;
    #power('off');
    #assert_reboot(120);
    

}

sub to_desktop {
 	assert_screen 'decyrpt_prompt',$timeout;
    type_string "system76\n";


    # GDM and Desktop
 
    assert_screen 'gdm',$timeout;
    send_key 'ret';
    type_string "system76";
    send_key 'ret';
    assert_screen 'desktop',$timeout;
}

sub test_run {

	# standard boilerplate funcitons to ensure the system is ready to test
	displays();
	reboot();
	to_desktop();
	

	if (-d "/var/lib/openqa/tests/pop/helpers/steam") {
		push(@INC, "/var/lib/openqa/tests/pop/helpers/steam/");
		require "steam_test.pm";
		test_run_steam();
	}
	
	if (-d "/var/lib/openqa/tests/pop/helpers/vbox") {
		push(@INC, "/var/lib/openqa/tests/pop/helpers/vbox/");
		require "vbox_test.pm";
		test_run_vbox();
	}
	
	if (-d "/var/lib/openqa/tests/pop/helpers/nvidia") {
		push(@INC, "/var/lib/openqa/tests/pop/helpers/nvidia/");
		require "nvidia_test.pm";
		test_run_nvidia();
	}
	
	if (-d "/var/lib/openqa/tests/pop/helpers/zfs") {
		push(@INC, "/var/lib/openqa/tests/pop/helpers/zfs/");
		require "zfs_test.pm";
		test_run_zfs();
	}

}
1;
