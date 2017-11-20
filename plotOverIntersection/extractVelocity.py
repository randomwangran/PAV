#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()
# create a new 'OpenFOAMReader'
a0foam = OpenFOAMReader(FileName='/scratch/orca/superran/3rd/refineMesh/0/0.foam')
a0foam.CaseType = 'Reconstructed Case'
a0foam.Expect64bitLabels = 0
a0foam.Createcelltopointfiltereddata = 1
a0foam.Adddimensionalunitstoarraynames = 0
a0foam.MeshRegions = ['CYLINDER']
a0foam.CellArrays = ['p']
a0foam.PointArrays = []
a0foam.Cachemesh = 1
a0foam.Decomposepolyhedra = 1
a0foam.ListtimestepsaccordingtocontrolDict = 0
a0foam.Readzones = 0
# get animation scene
animationScene1 = GetAnimationScene()
# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()
# Properties modified on a0foam
a0foam.CellArrays = ['p']
# create a new 'Temporal Statistics'
temporalStatistics1 = TemporalStatistics(Input=a0foam)
temporalStatistics1.ComputeAverage = 1
temporalStatistics1.ComputeMinimum = 1
temporalStatistics1.ComputeMaximum = 1
temporalStatistics1.ComputeStandardDeviation = 1
# Properties modified on temporalStatistics1
temporalStatistics1.ComputeMinimum = 0
temporalStatistics1.ComputeMaximum = 0
temporalStatistics1.ComputeStandardDeviation = 0
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
