#Print all records that do not list a discoverer in the eighth field.

my $ephi = 'solar.txt'; #opening the file
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
close SOLAR;
