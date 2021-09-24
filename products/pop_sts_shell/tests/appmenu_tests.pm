use base 'basetest';
use strict;
use testapi;

sub run {
   for (my $i = 0; $i < 4; $i++) {
   		send_key 'super-q';
   }
   
   # Check the layout of the application menu and its open / close behavior

   assert_screen 'desktop';
   send_key 'super-a';
   assert_screen 'appmenu';
   send_key 'super-a';
   assert_screen 'desktop';
   send_key 'super-a';
   assert_screen 'appmenu';
   send_key 'esc';
   assert_screen 'desktop';

  # Test search dialog using various key words.
  my @tests = ( "terminal","calculator","settings","pop_shop");
  foreach ( @tests ) {
    send_key 'super-a';
  	assert_screen 'appmenu';
  	type_string $_;
  	assert_screen 'check_search_'.$_;
  	send_key 'esc';
  	assert_screen 'appmenu';
  	send_key 'esc';
  	assert_screen 'desktop';
  }
}
1;
