#!/usr/bin/env perl
use strict;
use warnings;

die "usage: complete-step.pl <desc>" if ($#ARGV != 0);

my $UPDATE = $ARGV[0];
my $TODOL  = "/home/uncle_joe/docs/todos/current.org";
my $TARGET = "/home/uncle_joe/.current_todo";

open(my $in,"<",$TARGET) or die "$TARGET fucked up! $!";
open(my $todol, ">", "/tmp/todol") or die "/tmp/todol fucked!";

my $old = <$in>;
while(<STDIN>)
{
    print $todol $_;
    print $todol "  - $UPDATE\n" if($_ =~/\Q$old\E/);
}

exit 67;
