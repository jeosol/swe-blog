+++
author       = "Jerome E. Onwunalu, PhD"
date         = "2017-03-01T09:00:00"
lastmod      = "2017-09-05T14:49:00"
projname     = "watercut-pred"
assetdir     = "assets/petroleum/posts/"
draft        = false
toc          = false
#topics       = ["petroleum", "maths"]
categories   = ["reservoir simulation","reservoir engineering","optimization", "waterflood"]
tags         = ["waterflood", "control optimization", "field development optimization", "optimization"]
keywords     = ["optimization", "field development optimization"]
title        = "Olympus Optimization Challenge - Introduction"
#subtitle     = "From Cross Section Data to Economics -- Introduction"
description  = "Example article description"
disable_comments = false
thumbnail    = "/assets/olympus/introduction/olympus_perm_model.jpg"
slug         = "evaluating-waterflood-performance-reservoir-simulation-part-1"
math         = true
c3plot       = true
c3jsfiles    = ["myfunctionlisp.js"]
baseUrl      = "http://localhost:1313/"
projdir      = "{{ $.Params.partialspostpetdir }}/{{ $.Params.projname }}"
imagedir     = "/assets/petroleum/posts/watercutpred/images"
table1html   = "post/petroleum/watercut_pred/reservoir_prop_table"
satmap-width = 200
satmap-height=100
affliatelink = "http://google.com"
somelink = 100
postdir ="post/petroleum/tutorials/evaluate-waterflood/"
+++


## Introduction ##

The ISAPP field development optimization challenge has been developed with the
goal of benchmarking field development optimization workflows and
algorithms. ISAPP (Integrated Systems Approach to Petroleum Production) is a
joint project of TNO, Delft University of Technology, ENI, Statoil and
Petrobras. 

Three different optimization optimization problems have been formulated as follows:

- **Well Control Optimization** -- Optimize the controls of 7 water injection
  wells and 11 oil producers. The location of the wells are fixed for this
  problem and only the well controls are to be optimized. 
- **Well Placement Optimization** -- Determine an optimum field development
  plan optimizing one or more platform locations, well locations, well type, well
  trajectories, well schedules, etc. It is assumed that the wells will have
  fixed well controls. 
- **Joint Optimization - Well Control + Well Placement Optimization** --
  Jointly optimizing for well controls and well locations. This is essentially
  solving the above two optimization problems simultaneously. 
  

The optimization problems are challenging given the size
of the model and the number of realizations over which the optimizations are
expected to be performed. There are 50 realizations in the data set released
by ISAPP. Porosity, permeability, net-to-gross and initial saturation
distribution varies in each realization. Figure 1 shows the X-direction
permeability for layer 6 of one of the realizations.

<div class="front-container">
    <div class="row">
        <div class="figure">
            <img
            src="/assets/olympus/introduction/olympus_perm_model.jpg"
            class="img-responsive"/>
            <p class="figure-caption">Figure 1: X-direction permeability of
             for layer 6 of a realization. </p>
        </div>
    </div>
</div>

These optimization problems are computationally intensive because, in general,
each development scenario (set of well controls/well locations/well
locations + well controls) has to be evaluated over the 50 realizations of the
reservoir model and the average NPV is computed as the objective function value
for the development scenario. This approach ensures that the best development
scenarios are robust over all realizations. 

Please find more details about the problem descriptions, reservoir model, and expected
deliverables at the <a href="http://www.isapp2.com/">ISAPP</a> website.

<!--
I am partaking in ISAPP optimization challenge and given time, I plan to tackle
the above optimization problems. I will post summaries of my results here.

-->

## References ##
-- <a href="http://www.isapp2.com/">ISAPP Optimization Challenge Website</a>.

-- <a
href="http://www.isapp2.com/optimization-challenge/reservoir-model-description.html">Reservoir
model: Olympus</a> 
