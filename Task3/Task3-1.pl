my $file = 'Input2.txt';
my $file2 = 'Output2.txt';
open(INPUT, '<', $file) or die $!;
open(OUTPUT, '>', $file2) or die $!;

while(my $change = <INPUT>){
  my %changes = ('0' => 'zero', '1' => 'one', '2' => 'two', '3' => 'three', '4' => 'four',
                  '5' => 'five', '6' => 'six', '7' => 'seven', '8' => 'eight', '9' => 'nine');
  my @new = split("", $change);
  for my $key(@new){
    $key =~ s/[0-9]/$changes{$key}/g;
    print OUTPUT "$key";
  }
}
close INPUT;
close OUTPUT;
