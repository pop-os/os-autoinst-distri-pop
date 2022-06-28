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

sub run {

    # Start Pop Shop
    send_key 'super';
    type_string 'pop shop';
    send_key 'ret';
    if (check_screen 'repo_failure') {
    	fail();
    }
    assert_screen 'pop_shop_screen';
    assert_and_click 'pop_shop_installed',6000;
    assert_and_click 'pop_shop_upgrade';
    if (check_screen 'confirm_upgrading_state',60 == undef) {
        assert_and_click 'pop_shop_upgrade';	
	}
    
	
    check_screen 'confirm_upgrading_state',2000;
    assert_screen 'upgrading_complete',5000;
    assert_and_click 'close_pop_shop';

}

1;
