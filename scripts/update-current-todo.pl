#!/usr/bin/env perl
use strict;
use warnings;


open(my $out, ">>", glob("~/docs/todos/completed.org")) or die "can't open completed.org!";
open(my $tmp,">", "/tmp/.todotmp") or die "can't open /tmp/.todotmp";

my $redir = 0;
while(<>){
    $redir = 1 if(/DONE/);
    $redir = 0 if(/TODO/);
    
    print $out $_ if $redir;
    print $tmp $_ if !$redir;
}
close $out or die "$out: $!";
close $tmp or die "$tmp: $!";

open(my $in, ">", glob("~/docs/todos/current.org")) or die "can't open current.org";
open($tmp,"<", "/tmp/.todotmp") or die "can't open /tmp/.todotmp";
while(<$tmp>){
     print $in $_;
}
close $in or die "$in: $!";
close $tmp or die "$tmp: $!";

