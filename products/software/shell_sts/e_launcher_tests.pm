use base 'basetest';
use strict;
use testapi;

sub run {
  my @tests = ( "terminal","calculator","settings","pop_shop");
  foreach ( @tests ) {
    send_key 'super';
  	assert_screen 'launcher';
  	type_string $_;
  	assert_screen 'check_search_'.$_;
  	send_key 'esc';
  	assert_screen 'desktop';
  }

}
1;
