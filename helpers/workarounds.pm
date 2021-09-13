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

sub restart_gdm {
	my ($mode) = @_;
	#select_console 'root-console';
	#add_console('root-console',  'tty-console', {tty => 3});
	#select_console('root-console');
        
	# get to tty
	hold_key 'ctrl';
	hold_key 'alt';
	send_key 'f3';

	assert_screen 'tty';
	assert_script_sudo 'systemctl restart gdm',200;


	#if ($mode == 'install') {
	#	type_string 'pop-os\n'

	#} elsif ($mode == 'desktop') {
	#	type_string 'system76\n';
	#	type_string 'system76\n';

	#} else {
	#	type_string 'pop-os\n'
	
	#}

	#assert_screen 'logged_in';

	#type_string 'systemctl restart gdm\n';

	#if ($mode == 'install') {
	#	assert_screen 'desktop'
	#}
}

1;
