import Mads

problemdir = Mads.getmadsdir()
if isdefined(:yaml)
	md = Mads.loadmadsfile(problemdir * "source_termination.mads", check_missing_targets=false)
else
	md = Mads.loadmadsfile(problemdir * "source_termination_json.mads", format="json", check_missing_targets=false)
end
nsample = 10
bigdtresults = Mads.dobigdt(md, nsample; maxHorizon=0.8, numlikelihoods=2)
if !haskey(ENV, "MADS_NO_PLOT") && Mads.long_tests
	Mads.plotrobustnesscurves(md, bigdtresults; filename=problemdir * "source_termination-robustness-$nsample")
end