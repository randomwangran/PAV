## thie script helps you extract data from a time averaged filed
## within the for loop place your varible;
## then copy the origional file with generated code together to extract data
use strict;
use warnings;


my $file = "test.py";
open my $fh,'>', $file or die "Can't open the output file: $!";
for (my $base=1; $base <= 20; $base = $base + 1) {
   my $zPosition = 1 * $base;
   print "file: $file\n";
   print $fh "# create a new 'Plot On Intersection Curves' \n";
   print $fh "plotOnIntersectionCurves$base = PlotOnIntersectionCurves(Input=temporalStatistics1) \n";
   print $fh "plotOnIntersectionCurves$base.SliceType = 'Plane' \n";
   print $fh "# Properties modified on plotOnIntersectionCurves$base.SliceType \n";
   print $fh "plotOnIntersectionCurves$base.SliceType.Origin = [0.0, 0.0, $zPosition] \n";
   print $fh "plotOnIntersectionCurves$base.SliceType.Normal = [0.0, 0.0, 1.0] \n";
   print $fh "# save data \n";
   print $fh "SaveData('/scratch/orca/superran/3rd/refineMesh/0/process/pressure/$base/timeAvgPressure.csv', proxy=plotOnIntersectionCurves$base, Precision=5, UseScientificNotation=0, WriteAllTimeSteps=0, FieldAssociation='Points') \n";
}



