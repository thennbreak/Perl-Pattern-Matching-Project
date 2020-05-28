my $ephi = 'solar.txt'; #opening the file
open(SOLAR, '<', $ephi) or die $!; #either open the file or end the program if the file cannot open

#print all records after erasing the second field.

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
close SOLAR;
