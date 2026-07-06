#!/usr/bin/env perl
use strict;
use warnings;

die "usage: change-status.pl <TODO-entry> [TODO|DONE]" if ($#ARGV != 1);
open(my $todol, ">", "/tmp/todol") or die "/tmp/todol fucked!";

my $status = $ARGV[1];
die "$status should be [TODO|DONE]!" unless($status =~ /DONE|TODO/);

my $l = "TODO"; my $r = "DONE";
($l,$r) = ($r,$l) if $status eq "TODO";

while(<STDIN>)
{
    if($_ =~ /\Q$ARGV[0]\E/)
    {
	my $done = $_;
	$done =~  s/\Q$l\E/\Q$r\E/g;
	print $todol $done;
    }
    else{ print $todol $_; }
}
