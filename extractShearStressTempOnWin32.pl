use strict;
use warnings;


##for (my $base=0.314; $base <= 2.826; $base = $base + 0.314) {
for (my $base=1; $base <= 20; $base = $base + 1) {
   my $file = "$base.py";
   my $zPosition = 0.1495 * $base;
        print "file: $file\n";

   open my $fh,'>', $file or die "Can't open the output file: $!";
        print $fh "#### import the simple module from the paraview \n";
        print $fh "from paraview.simple import * \n";
        print $fh "#### disable automatic camera reset on 'Show' \n";
        print $fh "paraview.simple._DisableFirstRenderCameraReset() \n";
        print $fh "a0foam = OpenFOAMReader(FileName='E:/GitHub/Cable-conference/DES/ReynoldNumberPowerOfFive/IP/shearStress/0/0.foam') \n";
        print $fh "a0foam.MeshRegions = ['internalMesh'] \n";
        print $fh "a0foam.CellArrays = ['wallShearStress'] \n";
        print $fh "a0foam.MeshRegions = ['CYLINDER'] \n";
        print $fh "# create a new 'Slice' \n";
        print $fh "slice1 = Slice(Input=a0foam) \n";
        print $fh "slice1.SliceType = 'Plane' \n";
        print $fh "slice1.SliceOffsetValues = [0.0] \n";
        print $fh " \n";
        print $fh "# Properties modified on slice1.SliceType \n";
        print $fh "slice1.SliceType.Origin = [0.0, 0.0, $zPosition] \n";
        print $fh "slice1.SliceType.Normal = [0.0, 0.0, 1.0] \n";
        print $fh " \n";
        print $fh "# save data \n";
        print $fh "SaveData('E:/GitHub/Cable-conference/DES/ReynoldNumberPowerOfFive/IP/shearStress/0/wallShearStress/$base/wallShearStress.csv', proxy=slice1, WriteAllTimeSteps=1) \n";
  close $fh;
}
