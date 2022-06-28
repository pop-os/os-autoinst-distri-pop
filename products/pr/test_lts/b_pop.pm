use base 'basetest';
use strict;
use testapi;
use lib '/var/lib/openqa/tests/pop/';
use helpers::apt_update;

sub run {
 my $build = get_var("BUILD");
 my @repo = split("_",$build);
 
 record_info('info',$build."\n".$repo[3]."\n".$repo[4]);

 my $cmd = "git clone";
 my $url = "https://github.com/pop-os/pop";
 my $dest = "pop";
 
 assert_screen 'desktop';

 send_key 'super-t';
 assert_screen 'terminal';
 
 type_string $cmd." ".$url." ".$dest. "&& exit";
 send_key 'ret';
 
 assert_screen 'desktop';
 
 send_key 'super-t';
 assert_screen 'terminal';
 
 type_string "cd pop/scripts && ./apt add $repo[4]";
 send_key 'ret';
 type_string "system76";
 send_key 'ret';
 assert_screen 'pr_added',500;
 type_string 'exit';
 send_key 'ret';
 assert_screen 'desktop';
 
 apt_update();
 assert_screen 'full_desktop',800;
}

1;
