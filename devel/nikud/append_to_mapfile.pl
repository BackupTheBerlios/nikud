#!/usr/bin/perl

# Copyright 2004 Itai Levi.
# This program is distributed under the terms of 
# the GNU General Public License.

$outtmpfile = "out.tmp";

open(TEMPFILE,  $ARGV[0]) or die "Can't open $ARGV[0], $!";
open(MAPFILE, $ARGV[1]);
open(OUTTMPFILE, ">", $outtmpfile) or die "Can't open $outtmpfile, $!";

while ( <TEMPFILE>) {
    if (/(\w+)\s+([\w\-]+)(\s+.+\.enc)/) {
	$firstWordInTemp = $1;
	$lineToAppend = "$1 $2-Menukad$3 <<$2-Menukad.t3 <$2.pfa\n";
	break;
    }
}

$found = 0;
while(<MAPFILE>) {
    $line = $_;
    if(/(\w+)/) {
	$firstWord = $1;
	if($firstWord eq $firstWordInTemp) {
	    print OUTTMPFILE $lineToAppend;
	    $found = 1;
	}
	else {
	    print OUTTMPFILE $line;
	}
    }
}
if($found == 0){
    print OUTTMPFILE $lineToAppend;
}



close OUTTMPFILE;
close TEMPFILE;
close MAPFILE;

unlink $ARGV[1];

open(MAPFILE, ">", $ARGV[1]) or die "Can't open $ARGV[1], $!";
open(OUTTMPFILE, $outtmpfile) or die "Can't open $outtmpfile, $!";

while(<OUTTMPFILE>) {
    print MAPFILE $_;
}

close MAPFILE;
close OUTTMPFILE;

unlink $outtmpfile;
