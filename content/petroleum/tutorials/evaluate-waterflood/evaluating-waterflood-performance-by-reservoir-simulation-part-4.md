+++
author       = "Jerome E. Onwunalu, PhD"
date         = "2016-07-19T09:00:00"
lastmod      = "2017-09-05T14:49:00"
projname     = "watercut-pred"
assetdir     = "assets/petroleum/posts/"
draft        = true
toc          = false
#topics       = ["petroleum", "maths"]
categories   = ["reservoir simulation","reservoir engineering","waterflood performance"]
tags         = ["waterflood"]
keywords     = ["watercut","reservoir simulation", "reservoir engineering","vertical equilibrium"]
title        = "Evaluating Waterflood Performance in a Cross Section using Reservoir Simulation: Part 4 - Sample Results"
subtitle     = "Primary depletion vs. Waterflood"
description  = "Example article description"
disable_comments = false
thumbnail    = "assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/primary-vs-waterflood-schematic.png"
slug         = "evaluating-waterflood-performance-reservoir-simulation-part-3"
math         = true
c3plot       = true
c3jsfiles    = ["myfunctionlisp.js"]
#baseUrl      = "http://localhost:1313/"
projdir      = "{{ $.Params.partialspostpetdir }}/{{ $.Params.projname }}"
imagedir     = "/assets/petroleum/posts/watercutpred/images"
table1html   = "post/petroleum/watercut_pred/reservoir_prop_table"
satmap-width = 200
satmap-height=100
affliatelink = "http://google.com"
+++


## Previous Parts ##

[Part 1 - Overview]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-1.md" >}} "Part 1 - Overview")

[Part 2 - Reservoir Simulation Model]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-2.md" >}} "Part 2 - Reservoir Simulation Model")

[Part 3 - Depletion vs. Waterflood]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-3.md" >}} "Part 3 - Depletion vs. Waterflood")

{{% addbaseurl "results/sim-test-case/html/sim-test-case.html" "View" %}} the
results here.
## Objective
-- Evaluate the benefits of waterflooding
vs. primary depletion in our cross-section simulation
model.

## Reminders
Here, we provide some relevant details of the simulation model as a reminder.

- Simulation model type: cross-section (X-Z)
- Simulation grid: 100 x 1 x 20 grid cells 
- Grid cell dimensions: Constant DX, constant DY, DZ varies by layer and equal
  to height of cross-section layers
- Only two phases present in the simulation model - oil and water
- Reservoir rock and fluid properties (PERMX, PERMY, PERMZ, PORO, Swi, ...) vary by
  layer but are otherwise constant for each layer
- PERMX is equal to the layer permeability; PERMY = PERMX; PERMZ = 0.10 * PERMX
- All cells are active and have a net-to-gross ratio is 1.0
- All wells are simple, fully-penetrating vertical wells with zero well skin
- All wells have fixed well controls throughout duration of production
- Total production time is 15 years.

See [Part 2 - Reservoir Simulation Model]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-2.md" >}} "Part 2 - Reservoir Simulation Model") for details of the simulation model.


## Introduction ##

In the previous post, we described the simulation model that we will use for
waterflood performance evaluation in the cross-section. In this post, we focus
on applying the simulation model to evaluate the benefits of waterflood vs. primary
depletion. The simulation models for both production scenarios are similar
except for different well configurations, well locations, and well control specifications.

In the primary depletion scenario, the simulation model contains a single oil
production well (producer). For waterflooding, we will consider two different cases with different
number of water injection wells (injectors). The different production cases
are described below:

- **Primary depletion (Case 1)**: simulation model contains one producer located (approximately) in the
middle of the model.
- **Waterflooding (Case 2)**: simulation model has one producer located (approximately) in the middle
  of the model, and two, identical injectors located at leftmost and
  rightmost grid blocks of the simulation model respectively. This case is similar to
  Case 1 except that we have added two injectors to the model.
- **Waterflooding (Case 3)**: simulation model has one injector and one
  producer located at the leftmost and rightmost grid blocks of the model.
  
For consistency across the simulation moels, we use the same total production
and total injection rate across all cases. In case 2, each injector has the
same injection rate while Case 3, the single injector has twice the rate of
one the injectors in Case 2.
  
The two waterflood cases will illustrate the effect of producer-injector
distance, and the importance of including economics as part of
our evaluations. The NPV in the two cases will be different even though the
production profiles are similar.

In the next section, we provide some details about each simulation models.

## Simulation Models 

In this section, we will describe the simulation model for each production
scenario. There are three different simulation models corresponding to
the three production scenarios described earlier, one for primary
depletion and two models for the two waterflooding cases. 

The simulation models are similar in all aspects except for the
number of wells, the well locations, and the values of the well controls for
the injectors. 

The total field reservoir production and injection rate is set at 8,000
STB/D. These values correspond to an annual production of about 5% of the oil
in place (STOIIP) in the simulation model.

In the next sections, we will describe each production case and the
corresponding well configurations.


See [Part 2 - Reservoir Simulation Model]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-2.md" >}} "Part 2 - Reservoir Simulation Model") for details of the simulation model.


### Case 1: Primary Depletion - One Producer

The simulation model for this case contains only the producer located in grid
block (50,1,1-20). The control type for the well is reservoir voidage rate and
the value of the control is 8,000 STB/D.

The well configuration schematic for this case is shown in Figure 1. It is
important to note that there is no water injection in the case and the
simulation model does not contain any aquifer. The source of reservoir energy
is from the expansion of the oil. 

<div class="front-container">
    <div class="row">
        <div class="figure">
            <img
            src="/assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/case_1_well_schematic.png"
            class="img-responsive"/>
            <p class="figure-caption">Figure 1: Case 1: Well configuration for primary depletion. </p>
        </div>
    </div>
</div>

### Case 2: Waterflood - One Producer + Two Injectors
The simulation model for this case contains the producer in the same location
as in Case 1, but two injectors are completed at the leftmost (1,1,1-20) and
rightmost (100,1,1-20) grid blocks respectively (see Figure 2). The producer has the same
well control type and control value (8,000 STB/D) as in Case 1. The two
injectors each have reservoir injection rate control and the control value is
set at 4,000 STB/D. The simulation model for this case contains three
wells. 

<div class="front-container">
    <div class="row">
        <div class="figure">
            <img
            src="/assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/case_2_well_schematic.png"
            class="img-responsive"/>
            <p class="figure-caption">Figure 2: Well configuration for
    waterflood (Case 2) - 1 producer + 2 water injectors.</p>
        </div>
    </div>
</div>

### Case 3: Waterflood - One Producer + One Injector
The simulation model contains one injector at the leftmost grid block
(1,1,1-20) and one producer at the rightmost grid block (100,1,1-20). The
production rate and injection rate both wells are set at 8,000 STB/D. The well
configuration for this case is shown in Figure 3.

<div class="front-container">
    <div class="row">
        <div class="figure">
            <img
            src="/assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/case_3_well_schematic.png"
            class="img-responsive"/>
            <p class="figure-caption">Figure 3: Well configuration for
            waterflood (Case 3) - 1 producer + 1 water injector.</p>
        </div>
    </div>
</div>


The main difference in the above simulation models is the number of wells and
the well locations. Also, since we are including economic model in our
performance evaluation, the three different cases will have a different total
well costs which would be reflected in the NPV and Pay out time values. 

For simplicity, we have assumed that the drilling and completion cost per well
is the same in all cases. In addition, all wells are assumed to be pre-drilled
and ready for production/injection at the start of production.

## Simulation Runs and Results
### Simulation Runs
We perform simulation runs for all three models. After each simulation run,
the net present value (NPV) is computed using the production profiles and the
economic parameters defined previously. 

The full simulation workflow (build model, run simulation, post-process
results) takes about 12 seconds.

### Simulation Results
Table 1 shows a summary of important production parameters

    ---------------------------------------------------------------------------------------------------------
    No   Casename           WC            WOR          COP        CWP        CWI        Oil-RF  ObjFunValue 
    (Fraction)    (STB/STB)    (MMSTB)    (MMSTB)    (MMSTB)    (%)     (x10^6 $)   
    ---------------------------------------------------------------------------------------------------------
    1    CASE-1-PRIMARY     0.000         0.00         2.503      0.001      0.000      4.23    24.579      
    2    CASE-2-WATERFLOOD  0.743         2.89         35.256     9.429      42.806     59.61   372.433     
    3    CASE-3-WATERFLOOD  0.743         2.88         35.994     8.716      42.801     60.86   392.518     
    ---------------------------------------------------------------------------------------------------------

## Conclusions ##


## Nomenclature ##
    - COP          = Cumulative Oil Produced (m3 or STB)
    - NPV          = Net Present Value, $
    - PORO         = grid cell porosity, Fraction
    - PERMX        = X-direction grid cell permeability, md
    - PERMY        = Y-direction grid cell permeability, md
    - PERMZ        = Z-direction grid cell permeability, md
    - STB          = Stock Tank Barrels, volume unit
    - STOIIP       = Stock Tank Oil Initially In Place, (m3 or STB)

<a name="references"></a>
<a href="#references"></a>
## References ##

