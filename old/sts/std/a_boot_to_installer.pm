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
use helpers::workarounds;
my $timeout = 400;
sub run {
    # wait for boot to finish
    assert_screen 'boot_finish',$timeout;

    # press enter to boot right away
    #send_key 'ret';

    # wait for the desktop to appear
    assert_screen 'installer_language_select',$timeout;
    
    # Disable screen lock
#    disable_screen_blanking '21.04';
    #restart_gdm 'install';
}

1;
