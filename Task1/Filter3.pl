my $ephi = 'solar.txt'; #opening the file
open(SOLAR, '<', $ephi) or die $!; #either open the file or end the program if the file cannot open

#print all records that have negative orbital periods

print "All the records for satellites that have negative orbital periods.\n";
while(my $three = <SOLAR>){#read in the file
  chomp($three);
  my @field3 = split(" ", $three);#again splitting into an array
  if($field3[4] < 0){ #checking the fourth field of the array where the orbital period is located and checking if the int < 0 or negative
    print "@field3[0..$#field3]\n";
  }
}
close SOLAR;
