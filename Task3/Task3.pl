my $file = 'Input.txt';
my $file2 = 'Output.txt';
open(INPUT, '<', $file) or die $!;
open(OUTPUT, '>', $file2) or die $!;

while(my $change = <INPUT>){
  my %changes = ('0' => 'zero', '1' => 'one', '2' => 'two', '3' => 'three', '4' => 'four',
                  '5' => 'five', '6' => 'six', '7' => 'seven', '8' => 'eight', '9' => 'nine');#created my own hash table with keys
  my @new = split("", $change);#grabbed the value of from the hash and stored into an array
  for my $key(@new){#for each element in my arrary
    $key =~ s/[0-9]/$changes{$key}/g; #check if the key = 0-9 and substitute with the keys value. It is global so all occurances are changed
    print OUTPUT "$key";
  }
}
close INPUT;
close OUTPUT;
