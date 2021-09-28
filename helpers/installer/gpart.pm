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

sub custom_partitions {
    my ($version) = @_;

    assert_screen 'installer_partitions_screen';
    assert_and_click 'installer_partitions_Modify';
    assert_screen 'gparted';
    assert_and_click 'gparted_device';
    assert_and_click 'gparted_create_new_PT';
    assert_and_click 'gparted_new_PT_format';
    assert_and_click 'gparted_new_PT_format_gpt';
    assert_and_click 'gparted_create_new_PT_confirm';

    my @a = (500,4096);
    for my $i (@a) { 
    	assert_and_click 'gparted_create_new_partition';
    	assert_screen 'gparted_new_partition';
    	send_key '0';
    	send_key 'tab';
    	type_string $i;
    	assert_and_click 'gparted_partition_type';
    	assert_and_click 'gparted_fat32';
    	assert_and_click 'gparted_add';
    }
    
        assert_and_click 'gparted_create_new_partition';
        assert_screen 'gparted_new_partition';
        send_key '0';
        send_key 'tab';
        assert_and_click 'gparted_partition_type';
        assert_and_click 'gparted_ext4';
        assert_and_click 'gparted_add';

    assert_and_click 'gparted_apply';
    assert_and_click 'gparted_confirm';
    assert_and_click 'gparted_close';
    assert_and_click 'gparted_close_window';

    assert_and_click 'installer_partitions_select_boot';
    assert_and_click 'installer_partitions_use_boot';
    assert_and_click 'installer_partitions_format_boot';
    assert_and_click 'installer_partitions_confirm_boot';

    assert_and_click 'installer_partitions_select_recovery';
    assert_and_click 'installer_partitions_use_recovery';
    assert_and_click 'installer_partitions_use_as';
    type_string "/recovery";
    assert_and_click 'installer_partitions_confirm_recovery';

    assert_and_click 'installer_partitions_select_root';
    assert_and_click 'installer_partitions_use_root';
    assert_and_click 'installer_partitions_confirm_root';

}
1;
