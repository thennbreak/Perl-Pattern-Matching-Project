my $electric = 'electricity.txt';
my $output = 'OutputFile2.txt';
open(ELE, '<', $electric) or die $!;
open(OUT, '>', $output) or die $!;

print "Alphabetically where capitallization has higher priority.\n\n";
my %table;
while(my $alpha = <ELE>){#same loops as first question without lowercase
  chomp($alpha);
  foreach(split " ", $alpha){
    $table{$_}++;
  }
}
#this sort has two cases because captial letters have greater priority than lowercase letters
#Case 1: if uppercase foudn compare with other uppercase
#Case 2: if lowercase found compare with other lowercase
foreach(sort{uc $a cmp uc $b || lc $a cmp lc $b} keys%table){
  print OUT "$_\n";
}
close ELE;
close OUT;
