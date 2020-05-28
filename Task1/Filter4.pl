#Print all records for objects discovered by Voyager2

my $ephi = 'solar.txt'; #opening the file
open(SOLAR, '<', $ephi) or die $!; #either open the file or end the program if the file cannot open

print "All the records for objects discovered by Voyager2.\n";
while(my $four = <SOLAR>){
  my @field4 = split(" ", $four);
  if($field4[7] eq "Voyager2"){#After splitting the file into an array check the 8th field for the exact discoverer
    print "@field4[0..$#field4]\n";
  }
}
close SOLAR;
