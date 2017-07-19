## Name: generates python scripts to extract section pressure distribution.
## Input: In the # Do stuff with handle section, it was generated using ParaView.
## Output: 10 scripts to extract ten sectional pressure distribution.
## Notes: Using ParaView and perl as a glue language;
## Creator: Ran Wang 
## Create Data: <2017-07-17 Mon 15:19>
## Modified History:
## Warning: Becareful with the omission. 

use strict;
use warnings;


for (my $base=0.314; $base <= 2.826; $base = $base + 0.314) {

   my $file = "planeZPosition$base.py";
   print "file: $file\n";


   open my $fh,'>', $file or die "Can't open the output file: $!";

   # Do stuff with handle.
    print $fh "#### import the simple module from the paraview \n";
    print $fh "from paraview.simple import * \n";
    print $fh "#### disable automatic camera reset on 'Show' \n";
    print $fh "paraview.simple._DisableFirstRenderCameraReset() \n";
    print $fh "# create a new 'OpenFOAMReader' \n";
    print $fh "a6020Dfoam = OpenFOAMReader(FileName='/scratch/orca/superran/Cable-conference/DES/ReynoldNumberPowerOfFive/IP/0/0.foam') \n";
    print $fh "a6020Dfoam.CaseType = 'Reconstructed Case' \n";
    print $fh "a6020Dfoam.Expect64bitLabels = 0 \n";
    print $fh "a6020Dfoam.Createcelltopointfiltereddata = 1 \n";
    print $fh "a6020Dfoam.Adddimensionalunitstoarraynames = 0 \n";
    print $fh "a6020Dfoam.MeshRegions = ['internalMesh'] \n";
    print $fh "a6020Dfoam.CellArrays = ['U', 'U_0', 'nuTilda', 'nuTilda_0', 'nut', 'p', 's', 's_0'] \n";
    print $fh "a6020Dfoam.PointArrays = [] \n";
    print $fh "a6020Dfoam.LagrangianArrays = [] \n";
    print $fh "a6020Dfoam.Cachemesh = 1 \n";
    print $fh "a6020Dfoam.Decomposepolyhedra = 1 \n";
    print $fh "a6020Dfoam.ListtimestepsaccordingtocontrolDict = 0 \n";
    print $fh "a6020Dfoam.LagrangianpositionsareinOF13binaryformat = 0 \n";
    print $fh "a6020Dfoam.Readzones = 0 \n";
    print $fh "# Properties modified on a6020Dfoam \n";
    print $fh "a6020Dfoam.MeshRegions = ['CYLINDER'] \n";
    print $fh "a6020Dfoam.CellArrays = ['p'] \n";
    print $fh "# get color transfer function/color map for 'p' \n";
    print $fh "pLUT = GetColorTransferFunction('p') \n";
    print $fh "# create a new 'Plot On Intersection Curves' \n";
    print $fh "plotOnIntersectionCurves1 = PlotOnIntersectionCurves(Input=a6020Dfoam) \n";
    print $fh "plotOnIntersectionCurves1.SliceType = 'Plane' \n";
    print $fh "# Properties modified on plotOnIntersectionCurves1.SliceType \n";
    print $fh "plotOnIntersectionCurves1.SliceType.Origin = [0.0, 0.0, $base] \n";
    print $fh "plotOnIntersectionCurves1.SliceType.Normal = [0.0, 0.0, 1.0] \n";
    print $fh "# Create a new 'Line Chart View' \n";
    print $fh "# save data \n";
    print $fh "SaveData('/scratch/orca/superran/Cable-conference/DES/ReynoldNumberPowerOfFive/IP/0/pressure/planeNum$base/IP0.csv', proxy=plotOnIntersectionCurves1, Precision=5, \n";
    print $fh "    UseScientificNotation=0, \n";
    print $fh "    WriteAllTimeSteps=1, \n";
    print $fh "    FieldAssociation='Points') \n";
    close $fh;
}
