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
use lib '/var/lib/openqa/tests/pop/';
# We set the test folder by retrieving the name of the test suite. [pop_lts,pop_sts,etc.]	
my $test = testapi::get_var("TEST");
my @spl = split('_',$test);
my @sub = split('pop_'.$spl[1].'_',$test);

my $root = 'products/'.$spl[1].'/';
diag("Root is set to ".$root);
testapi::set_var('PRODUCTDIR','products/'.$spl[1].'/');

# We also need to set a needle directory.
testapi::set_var('NEEDLES_DIR','needles');

if (@sub == 1) {  
   autotest::loadtestdir $root.'std';
} else {
   autotest::loadtestdir $root.$sub[1];
}

1;
