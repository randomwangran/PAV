use strict;
use warnings;



my $file = "test.py";
open my $fh,'>', $file or die "Can't open the output file: $!";
for (my $base=1; $base <= 20; $base = $base + 1) {
   my $zPosition = 1 * $base;
   print "file: $file\n";
   print $fh "# create a new 'Plot Over Line' \n";
   print $fh "plotOverLine1 = PlotOverLine(Input=temporalStatistics1, Source='High Resolution Line Source') \n";
   print $fh "plotOverLine1.PassPartialArrays = 1 \n";
   print $fh "plotOverLine1.ComputeTolerance = 1 \n";
   print $fh "plotOverLine1.Tolerance = 2.220446049250313e-16 \n";
   print $fh "# Properties modified on plotOverLine1.Source \n";
   print $fh "plotOverLine1.Source.Point1 = [1.0, -3.0, $zPosition] \n";
   print $fh "plotOverLine1.Source.Point2 = [1.0, 3.0, $zPosition] \n";
   print $fh "plotOverLine1.Source.Resolution = 100 \n";
   print $fh "# Properties modified on plotOverLine1 \n";
   print $fh "plotOverLine1.Tolerance = 2.22044604925031e-16 \n";
   print $fh "# save data \n";
   print $fh "SaveData('/scratch/orca/superran/3rd/refineMesh/0/process/velocity/1/$base/velocity.csv', proxy=plotOverLine1, Precision=5, UseScientificNotation=0, WriteAllTimeSteps=0, FieldAssociation='Points') \n";
}
  close $fh;
