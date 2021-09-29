use base 'basetest';
use strict;
use testapi;
use products::sts::shell::c_tiling_tests::keyboard_movement;
use products::sts::shell::c_tiling_tests::keyboard_resizing;
use products::sts::shell::c_tiling_tests::keyboard_stacking;
use products::sts::shell::c_tiling_tests::tiling_tests;

sub run {

#tiling_tests;
keyboard_movement;
keyboard_resizing;
keyboard_stacking;


}
1;
