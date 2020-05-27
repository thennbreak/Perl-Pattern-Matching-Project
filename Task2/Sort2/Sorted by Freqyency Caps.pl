my $electric = 'electricity.txt';
my $output = 'OutputFile4.txt';
open(ELE, '<', $electric) or die $!;
open(OUT, '>', $output) or die $!;

print "Sorted by frequency, with same number of occurrences being alphabetically sorted.\n\n";
my %table;
while(my $alpha = <ELE>){#same loops as previous questions
  chomp($alpha);
  $lowercase = lc $alpha;
  foreach(split " ", $lowercase){
    $table{$_}++;
  }
}

#for this sort we were asked to sort by frequency and if the same frequency occured than sort by alphabetically
#so my first case is checking the occurrences similar to the previous question.
#case 2 handles the problem if case 1 finds two comparisons with the same occurrences, which then is determined alphabetically
foreach(sort{$table{$a} <=> $table{$b} || $a cmp $b} keys%table){
  print OUT $_, " - number of occurrences: ", $table{$_}, "\n";
}
close ELE;
close OUT;
