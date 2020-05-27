#Print all records that do not list a discoverer in the eighth field. (1-1)

my $ephi = 'input.txt'; #opening the file
open(SOLAR, '<', $ephi) or die $!; #either open the file or end the program if the file cannot open

print "All records that do not list a discoverer in the eighth field.\n";
while(my $one = <SOLAR>){ #read in the file
  chomp($one);#remove \n from the file
  my @field = split(" ", $one);#seperate the file into an array
  my $eighth = $field[7];#look at the 8th field where the discoverer is
  if($eighth eq "-"){#if the 8th field has a - there is no discoverer so print the data
    print "$one\n";
  }
}


#print all records after erasing the second field. (2-1)

print "Every record after erasing the second field.\n";
while(my $two = <SOLAR>){#read in the file
  chomp($two);
  my @field2 = split(" ", $two);
  #using translation this pattern match will find all roman numerals are replace them with a -
  #(XC|XL|L?X{0,3}) = the tens 0-90 empty X XX XXX XL L LX LXX LXXX XC
  #(IX|IV|V?I{0,3}) = the ones 0-9 empty I II III IV V VI VII VIII IX X
  $field2[1] =~ tr/^(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})/-/;
  print "@field2[0..$#field2]\n";
}



#print all records that have negative orbital periods (3-1)

print "All the records for satellites that have negative orbital periods.\n";
while(my $three = <SOLAR>){#read in the file
  chomp($three);
  my @field3 = split(" ", $three);#again splitting into an array
  if($field3[4] < 0){ #checking the fourth field of the array where the orbital period is located and checking if the int < 0 or negative
    print "@field3[0..$#field3]\n";
  }
}

#(4-1)
print "All the records for objects discovered by Voyager2.\n";
while(my $four = <SOLAR>){
  my @field4 = split(" ", $four);
  if($field4[7] eq "Voyager2"){#After splitting the file into an array check the 8th field for the exact discoverer
    print "@field4[0..$#field4]\n";
  }
}

#(5-1)
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
