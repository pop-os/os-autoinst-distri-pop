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

sub online_accounts_quick_test {
    my ($version) = @_;

# Trigger before continuing past online accounts
# This test will go through each item in the online accounts list and verifies the services login process.
# It will not connect to these services during this test.
# This test only checks the services with a webview component.

assert_screen 'initial_dialog_online_accounts';

# Google
assert_and_click 'online_accounts_google';
assert_screen 'online_accounts_google_login';
assert_and_click 'online_accounts_login_close';

# Facebook
#assert_and_click 'online_accounts_facebook';
#assert_screen 'online_accounts_facebook_login';
#assert_and_click 'online_accounts_login_close';

#Micosoft
assert_and_click 'online_accounts_microsoft';
assert_screen 'online_accounts_microsoft_login';
assert_and_click 'online_accounts_login_close';

#Flickr
assert_and_click 'online_accounts_flickr';
assert_screen 'online_accounts_flickr_login';
assert_and_click 'online_accounts_login_close';

#Foursquare
assert_and_click 'online_accounts_foursquare';
assert_screen 'online_accounts_forsquare_login';
assert_and_click 'online_accounts_login_close';


}
1;
