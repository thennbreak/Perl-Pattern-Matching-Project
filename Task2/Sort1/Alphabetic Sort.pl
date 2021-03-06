my $electric = 'electricity.txt';#open target file
my $output = 'OutputFile1.txt';#open file to write to
open(ELE, '<', $electric) or die $!;#if the file to read in does not open end program
open(OUT, '>', $output) or die $!;#if the file to write to does not open end program

print "Alphabetically ignoring capitallization.\n\n";
my %table;
while(my $alpha = <ELE>){#read in the target file
  chomp($alpha);
  $lowercase = lc $alpha;#change all letters in the target file to lowercase
  foreach(split " ", $lowercase){#split the file into an array and for each element store into the hash table using the default key value
    $table{$_}++;#increment through the hash
  }
}
foreach(sort keys%table){#get the hash and for each sort the hash of its keys
  print OUT "$_\n";#write the result contents to the target write file OUT
}
close ELE;
close OUT;
