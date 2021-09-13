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

sub avatar_selection_test {
    my ($version) = @_;

# Trigger after name entry

assert_screen 'installer_user_account_confirm';

assert_and_click 'installer_user_account_avatar';

assert_screen 'avatar_file_select_screen';

for(my $i = 1; $i < 10; $i++) {
	send_key 'down';
}

assert_and_click 'avatar_file_select_confirm';

assert_screen 'installer_user_account_avatar_changed';

assert_and_click 'installer_user_account_avatar_changeback';

assert_screen 'avatar_file_select_screen';

type_string 'penguin.jpg';

assert_and_click 'avatar_file_select_confirm';


}
1;
