#Print all records and change the orbital periods given in seconds rather than days.

my $ephi = 'solar.txt'; #opening the file
open(SOLAR, '<', $ephi) or die $!; #either open the file or end the program if the file cannot open

#seconds in a day 86400, 1.0 = 1 day, if given is < 1 = less than a day, if given is > 1 = more than a day
#therefore anything > 1 = 86400 * x to find seconds
#and anything < 1 = is the same as above
print "All the records with orbital periods given in seconds rather than days.\n";
while(my $five = <SOLAR>){
  my @field5 = split(" ", $five);
  my $seconds = 86400; #seconds in a day
  #these if statements cover all numbers -inf < 0 < 1 < +inf
  if($field5[4] > 1){#this one covers everything strictly greater than 1 to +inf
    $field5[4] = $field5[4] * $seconds;
  }
  if($field5[4] <= 1 && $field5[4] >= 0){#this one covers everything greater than or equal to 0 and less than or equal 1
    $field5[4] = $field5[4] * $seconds;
  }
  if($field5[4] < 0){#finally this one covers everything strictly less than 0
    $field5[4] = $field5[4] * $seconds;
  }
  print "@field5[0..$#field5]\n";
}

close SOLAR;
