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

my $timeout = 400;
sub custom_partitions {
    my ($version) = @_;

    assert_screen 'installer_partitions_screen',$timeout;
    assert_and_click 'installer_partitions_Modify',$timeout;
    assert_screen 'gparted',$timeout;
    assert_and_click 'gparted_device',$timeout;
    assert_and_click 'gparted_create_new_PT',$timeout;
    assert_and_click 'gparted_new_PT_format',$timeout;
    assert_and_click 'gparted_new_PT_format_gpt',$timeout;
    assert_and_click 'gparted_create_new_PT_confirm',$timeout;

    my @a = (500,4096);
    for my $i (@a) { 
    	assert_and_click 'gparted_create_new_partition',$timeout;
    	assert_screen 'gparted_new_partition',$timeout;
    	send_key '0';
    	send_key 'tab';
    	type_string $i;
    	assert_and_click 'gparted_partition_type',$timeout;
    	assert_and_click 'gparted_fat32',$timeout;
    	assert_and_click 'gparted_add',$timeout;
    }
    
        assert_and_click 'gparted_create_new_partition',$timeout;
        assert_screen 'gparted_new_partition',$timeout;
        send_key '0';
        send_key 'tab';
        assert_and_click 'gparted_partition_type',$timeout;
        assert_and_click 'gparted_ext4',$timeout;
        assert_and_click 'gparted_add',$timeout;

    assert_and_click 'gparted_apply',$timeout;
    assert_and_click 'gparted_confirm',$timeout;
    assert_and_click 'gparted_close',$timeout;
    assert_and_click 'gparted_close_window',$timeout;

    assert_and_click 'installer_partitions_select_boot',$timeout;
    assert_and_click 'installer_partitions_use_boot',$timeout;
    assert_and_click 'installer_partitions_format_boot',$timeout;
    assert_and_click 'installer_partitions_confirm_boot',$timeout;

    assert_and_click 'installer_partitions_select_recovery',$timeout;
    assert_and_click 'installer_partitions_use_recovery',$timeout;
    assert_and_click 'installer_partitions_use_as',$timeout;
    type_string "/recovery";
    assert_and_click 'installer_partitions_confirm_recovery',$timeout;

    assert_and_click 'installer_partitions_select_root',$timeout;
    assert_and_click 'installer_partitions_use_root',$timeout;
    assert_and_click 'installer_partitions_confirm_root',$timeout;

}
1;
