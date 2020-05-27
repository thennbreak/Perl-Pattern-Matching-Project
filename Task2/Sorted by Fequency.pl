my $electric = 'electricity.txt';
my $output = 'OutputFile3.txt';
open(ELE, '<', $electric) or die $!;
open(OUT, '>', $output) or die $!;

print "Sorted by frequency.\n\n";
my %table;
while(my $alpha = <ELE>){#similar loops to previous two questions
  chomp($alpha);
  $lowercase = lc $alpha;#again lowercase all letters because it is non case sensitive
  foreach(split " ", $lowercase){
    $table{$_}++;
  }
}

#for this sort I am sorting by the hash keys which is the number of occurrences of each word
#table is my hash and the key values are represented by the $a and $b where b is compared against a so it is high to low
foreach(sort{$table{$b} <=> $table{$a}} keys%table){
  print OUT $_, " - number of occurrences: ", $table{$_}, "\n";
}
close ELE;
close OUT;
