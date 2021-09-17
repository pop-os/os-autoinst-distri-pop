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
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use strict;
use testapi;
use autotest;
#use switch;

# We set the test folder by retrieving the name of the test suite. [pop_lts,pop_sts,etc.]	
my $distri = testapi::get_var("TEST");
testapi::set_var('PRODUCTDIR','products/'.$distri.'/');

# We also need to set a needle directory.
testapi::set_var('NEEDLES_DIR','needles');

if (index($distri,'shell') != -1) {
   autotest::loadtest 'products/'.$distri.'/tests/boot_to_desktop.pm';
   autotest::loadtest 'products/'.$distri.'/tests/std_tests.pm';
} elsif (index($distri,'upgrade') != -1) {
   autotest::loadtest 'products/'.$distri.'/tests/boot_to_desktop.pm';
   autotest::loadtest 'products/'.$distri.'/tests/pop_shop_upgrade.pm';
   autotest::loadtest 'products/'.$distri.'/tests/system_upgrade.pm';
   autotest::loadtest 'products/'.$distri.'/tests/firstboot_after_upgrade.pm';
   autotest::loadtest 'products/'.$distri.'/tests/shutdown.pm';
} elsif (index($distri,'refresh_from_OS') != -1) {
   autotest::loadtest 'products/'.$distri.'/tests/boot_to_desktop.pm';
   autotest::loadtest 'products/'.$distri.'/tests/pop_shop_upgrade.pm';
   autotest::loadtest 'products/'.$distri.'/tests/system_recovery_refresh.pm';
   #autotest::loadtest 'products/'.$distri.'/tests/firstboot_after_upgrade.pm';
   autotest::loadtest 'products/'.$distri.'/tests/shutdown.pm';
} elsif (index($distri,'recovery') != -1) {
   autotest::loadtest 'products/'.$distri.'/tests/firstboot_after_install.pm';
   autotest::loadtest 'products/'.$distri.'/tests/installer.pm';
} else {
   autotest::loadtest 'products/'.$distri.'/tests/boot_to_installer.pm';
   autotest::loadtest 'products/'.$distri.'/tests/installer.pm';
   autotest::loadtest 'products/'.$distri.'/tests/firstboot_after_install.pm';
   autotest::loadtest 'products/'.$distri.'/tests/shutdown.pm';

}
1;
