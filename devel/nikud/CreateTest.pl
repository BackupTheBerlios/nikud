#!/usr/bin/perl

# Copyright 2004 Itai Levi.
# This program is distributed under the terms of 
# the GNU General Public License.


#$scale = 9;
$scale = 22;
$startx = 50;
$starty = 770;
$culmus_dir = "../culmus-0.100";
$t3dir = "..";

print "%!PS\n";
print "($culmus_dir/$ARGV[0].pfa) run\n";
print "($t3dir/$ARGV[0]-Menukad.t3) run\n";
print "/$ARGV[0]-Menukad findfont\n";
print "$scale scalefont setfont\n";

@NikudMarks = (
					"/afii57799",
					"/afii57801",
					"/afii57800",
					"/afii57802",
					"/afii57793",
					"/afii57794",
					"/afii57795",
					"/afii57798",
					"/afii57797",
					"/afii57806",
					"/afii57796",
					"/afii57807",
					"/afii57839",
					"/afii57841",
					"/afii57804",
					"/afii57803"
				  );







@HebrewLetters = (
						"/afii57664",
						"/afii57665",
						"/afii57666",
						"/afii57667",
						"/afii57668",
						"/afii57669",
						"/afii57670",
						"/afii57671",
						"/afii57672",
						"/afii57673",
						"/afii57674",
						"/afii57675",
						"/afii57676",
						"/afii57677",
						"/afii57678",
						"/afii57679",
						"/afii57680",
						"/afii57681",
						"/afii57682",
						"/uniFB20",
						"/afii57683",
						"/afii57684",
						"/afii57685",
						"/afii57686",
						"/afii57687",
						"/afii57688",
						"/afii57689",
						"/afii57690",
						"/uniFB30",	  #"alef with dagesh",
						"/uniFB31",	  #"bet with dagesh",
						"/uniFB32",	  #"gimel with dagesh",
						"/uniFB33",	  #"dalet with dagesh",
						"/uniFB34",	  #"he with dagesh",
						"/afii57723",	  #"vav with dagesh",
						"/uniFB36",	  #"zayin with dagesh",
						"/uniFB38",	  #"tet with dagesh",
						"/uniFB39",	  #"yod with dagesh",
						"/uniFB3A",	  #"kaf final with dagesh",
						"/uniFB3B",	  #"kaf with dagesh",
						"/uniFB3C",	  #"lamed with dagesh",
						"/uniFB3E",	  #"mem with dagesh",
						"/uniFB40",	  #"nun with dagesh",
						"/uniFB41",	  #"samekh with dagesh",
						"/uniFB43",	  #"pe final with dagesh",
						"/uniFB44",	  #"pe with dagesh",
						"/uniFB46",	  #"tsadi with dagesh",
						"/uniFB47",	  #"kof with dagesh",
						"/uniFB48",	  #"resh with dagesh",
						"/uniFB49",	  #"shin with dagesh",
						"/uniFB4A",	  #"tav with dagesh",
					  );


$glyphcount = 0;

print "$startx $starty moveto\n";


foreach (@HebrewLetters) {
  $letter = $_;
  foreach (@NikudMarks) {
    print "$_ glyphshow $letter glyphshow\n";
    $glyphcount++;
    if ($glyphcount eq 30) {
      $glyphcount = 0;
      $starty -= ($scale + 4);
      print "$startx $starty moveto\n";
    }
  }
}

$starty -= ($scale + 4);
print "$startx $starty moveto\n";


@words = qw( 
				/afii57690 /space /afii57690 /afii57803 /afii57669 /afii57799 /afii57686 /afii57793 /afii57678
				/space /comma /afii57690 /afii57806 /afii57669 /uniFB46 /afii57798 /afii57678
				/space /comma /afii57668 /afii57797 /afii57687 /afii57794 /afii57688 /afii57806 /afii57803 /uniFB49 /afii57798 /afii57676 /afii57799 /afii57669
				/space /comma /afii57664 /afii57794 /afii57680 /afii57806 /afii57803 /afii57689
				/space /comma /afii57679 /afii57723 /afii57804 /afii57689 /afii57806 /afii57688 /afii57799 /afii57667 /afii57793 /afii57673
				/space /comma /afii57677 /afii57673 /afii57793 /afii57668 /afii57806 /afii57676 /afii57801 /afii57664
				/space /comma /afii57799 /afii57674 /afii57795 /afii57804 /afii57689 /afii57806 /afii57839 /afii57671 /afii57798 /afii57668
);

foreach (@words) {
  print "$_ glyphshow\n";
}

print "showpage\n";
