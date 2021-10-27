+++
author       = "Jerome E. Onwunalu, PhD"
date         = "2021-07-19T09:00:00"
lastmod      = "2021-09-05T14:49:00"
projname     = "watercut-pred"
assetdir     = "assets/petroleum/posts/"
draft        = false
toc          = false
#topics       = ["petroleum", "maths"]
categories   = ["reservoir simulation","reservoir engineering","waterflood performance"]
tags         = ["waterflood"]
keywords     = ["watercut","reservoir simulation", "reservoir engineering","vertical equilibrium"]
title        = "Evaluating Waterflood Performance in a Cross Section using Reservoir Simulation: Part 3 - Primary depletion vs. Waterflood"
subtitle     = "Primary depletion vs. Waterflood"
description  = "Example article description"
disable_comments = false
thumbnail    = "assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/primary-vs-waterflood-schematic.png"
slug         = "evaluating-waterflood-performance-reservoir-simulation-part-3"
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
+++


## Previous Parts ##

[Part 1 - Overview]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-1.md" >}} "Part 1 - Overview")

[Part 2 - Reservoir Simulation Model]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-2.md" >}} "Part 2 - Reservoir Simulation Model")

## Objective
-- Evaluate the benefits of waterflooding
vs. primary depletion in our cross-section simulation
model.

## Reservoir Simulation Model Overview
Here, we provide some relevant details of the simulation model that we use.

- Simulation model type: cross-section (X-Z)
- Simulation grid: 100 x 1 x 20 grid cells 
- Grid cell dimensions: Constant DX, constant DY, DZ varies by layer and equal
  to height of cross-section layers
- Only two phases present in the simulation model - oil and water
- Reservoir rock and fluid properties (PERMX, PERMY, PERMZ, PORO, Swi, ...) vary by
  layer but are otherwise constant in each layer
- PERMX is the layer permeability in the X-direction and PERMY = PERMX
- PERMZ is the layer permeability in the Z-direction and is equal to 10% of PERMX
- All cells are active and each cell has a net-to-gross (NTG) ratio of 1.0
- All wells are simple, fully-penetrating vertical wells with zero well skin
- All wells have fixed well controls throughout duration of production
- Total production time is 15 years.

See [Part 2 - Reservoir Simulation Model]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-2.md" >}} "Part 2 - Reservoir Simulation Model") for description of the simulation model.

## Introduction ##

In the previous post, we described the simulation model that we will use for
waterflood performance evaluation. In this post, we focus
on applying the simulation model to demonstrate the benefits of waterflood compared to primary
depletion. The simulation models for depletion scenarions are similar
except for the different well configurations and locations (arrangement of producer and injectors), and well control specifications (production and injection rates).

In the primary depletion scenario, the simulation model contains a single oil
production well (producer). For waterflooding, we will consider two different scenarios with different
number of water injection wells (injectors). All three production cases are described:

- **Primary depletion (Case 1)**: The simulation model contains one producer located (approximately) in the
middle of the model.
- **Waterflooding (Case 2)**: The simulation model has one producer located (approximately) in the middle
  of the model, and two, identical injectors located at leftmost and
  rightmost grid blocks of the simulation model respectively. This case is similar to
  Case 1 except that we have added two water injectors to the model.
- **Waterflooding (Case 3)**: The simulation model has one injector and one
  producer located at the leftmost and rightmost grid blocks of the model.
  
For consistency across the simulation models, we use the same total production
and total injection rate across all cases. In case 2, each water injector has the
same injection rate while Case 3, the single water injector has twice the rate of
one the water injectors in Case 2.
  
The two waterflood cases will illustrate the effect of producer-injector
distance, and the importance of including economics as part of
our evaluations to enable proper scenario analyses. The net present value (NPV) in the two cases will be different even though the
production profiles are similar.

In the next section, we describe the different simulation model and well configuration and well control specifications. 

## Simulation Models 

In this section, we will describe the simulation model for each production
scenario. There are three different simulation models corresponding to
the three production scenarios described earlier, one for primary
depletion and two models for the two waterflooding cases. 

The simulation models are similar in all aspects except for the
number of wells, the well locations, and the values of the well controls for
the water injectors. 

In the simulation models, all wells are fully-penetrating vertical wells, i.e., completed in all layers of the simulation model. 
A well location is specified as (I, J, K1-K2) where I and J are the grid block indices in the X- and Y-directions
respectively, and K1 and K2 represent the start and end layers where the wells are completed.

The total field reservoir production and injection rate is set at 8,000
STB/D. These values correspond to an annual production of about 5% of the oil
in place (STOIIP) in the simulation model.

In the next sections, we will describe each production case and the
corresponding well configurations.

See [Part 2 - Reservoir Simulation Model]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-2.md" >}} "Part 2 - Reservoir Simulation Model") for additional details about the reservoir simulation model.

### Case 1: Primary Depletion - One Producer

The simulation model for this case contains only the producer located in grid
block (50,1,1-20). The control type for the well is reservoir voidage rate and
the value of the control is 8,000 STB/D.

The well configuration schematic for this case is shown in Figure 1. It is
important to note that there is no water injection in this case and the
simulation model does not contain any aquifer. The source of reservoir energy
is from the expansion of the oil. 

{{< rawhtml >}}
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
{{< /rawhtml >}}

### Case 2: Waterflood - One Producer + Two Injectors
The simulation model for this case contains the producer in the same location
as in Case 1, but the two water injectors are completed at the leftmost (1,1,1-20) and
rightmost (100,1,1-20) grid blocks respectively (see Figure 2). The producer has the same
well control type and control value (8,000 STB/D) as in Case 1. The two
injectors each have reservoir injection rate control and the control value is
set at 4,000 STB/D. The simulation model for this case contains three
wells. 

{{< rawhtml >}}
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
{{< /rawhtml >}}

### Case 3: Waterflood - One Producer + One Injector
The simulation model contains one injector at the leftmost grid block
(1,1,1-20) and one producer at the rightmost grid block (100,1,1-20). Both wells are operated under reservoir voidage control and 
the production rate and injection rate are set at 8,000 STB/D. The well
configuration for this case is shown in Figure 3.

{{< rawhtml >}}
<div class="container">
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
{{< /rawhtml >}}

The main difference in the above simulation models is the number of wells and
the well locations. Also, since we are including economic model in our
performance evaluation, the three different cases will have a different total
well costs which would be reflected in the economic calculations.

For simplicity, we have assumed that the drilling and completion cost per well
is the same in all cases. In addition, all wells are assumed to be pre-drilled
and ready for production/injection at the start of production.

## Simulation Runs and Results
### Simulation Runs
We perform simulation runs for all three models. After each simulation run,
the net present value (NPV) is computed using the production profiles and the
economic parameters defined previously. 

The full simulation workflow (build model, run simulation, post-processing) takes about 12 seconds.

### Simulation Results
Table 1 shows a summary of important production parameters
<!--
---------------------------------------------------------------------------------------------------------
No   Casename           WC            WOR          COP        CWP        CWI        Oil-RF  NPV 
                     (Fraction)    (STB/STB)    (MMSTB)    (MMSTB)     (MMSTB)     (%)     (*10^6 $)   
---------------------------------------------------------------------------------------------------------
1    CASE-1-PRIMARY     0.000         0.00         2.503      0.001      0.000      4.23    24.579      
2    CASE-2-WATERFLOOD  0.743         2.89         35.256     9.429      42.806     59.61   372.433     
3    CASE-3-WATERFLOOD  0.743         2.88         35.994     8.716      42.801     60.86   392.518     
---------------------------------------------------------------------------------------------------------
-->
<!--
{{< rawhtml >}}
  <p class="speshal-fancy-custom" style="font-size: 15px">
    This is <strong>raw HTML</strong>, inside Markdown.
  </p>
{{< /rawhtml >}}
-->
{{< rawhtml >}}
<div style="font-size: 10px">
    <table style="font-size: 12px;" table="table table-stripped table-hover">
        <thead class="thead-dark", style="font-size: 19px">
            <tr>            
            <td>Case</td>
            <td>WC</td>
            <td>WOR</td>
            <td>COP</td>
            <td>CWP</td>
            <td>CWI</td>
            <td>RF</td>
            <td>NPV</td>
            </tr>
        </thead>
        <tr>
        <th></th>
        <td>(Fraction)</th>
        <td>(STB/STB)</th>
        <td>(MMSTB)</th>
        <td>(MMSTB)</th>
        <td>(MMSTB)</th>
        <td>(%)</th>
        <td>(*10^6$)</th>
        </tr>
        <tr>            
            <td>PRIMARY (C1) </td>
            <td>0.000</td>
            <td>0.00</td>
            <td>2.503</td>
            <td>0.001</td>
            <td>0.000</td>
            <td>4.23</td>
            <td>24.579</td>
        </tr>
        <tr>        
            <td>WATERFLOOD (C2)</td>
            <td>0.743</td>
            <td>2.89</td>
            <td>35.256</td>
            <td>9.429</td>
            <td>42.806</td>
            <td>59.61</td>
            <td>372.433</td>
        </tr>
          <tr>        
            <td>WATERFLOOD (C3)</td>
            <td>0.743</td>
            <td>2.88</td>
            <td>35.994</td>
            <td>8.716</td>
            <td>42.801</td>
            <td>60.86</td>
            <td>392.518</td>
        </tr>
    </table>
</div>
{{< /rawhtml >}}

{{< rawhtml >}}
<br>
<br>
{{< /rawhtml >}}

## Nomenclature ##    
    - WC           = Water cut, Fraction
    - WOR          = Water-oil ratio, STB/STB
    - COP          = Cumulative oil produced, STB
    - CWP          = Cumulative water Produced, STB
    - CWI          = Cumulative water Injected, STB
    - RF           = Oil Recovery Factor, %
    - NPV          = Net present value, $
    - PORO         = Grid cell porosity, Fraction
    - PERMX        = X-direction grid cell permeability, md
    - PERMY        = Y-direction grid cell permeability, md
    - PERMZ        = Z-direction grid cell permeability, md
    - NTG          = Net-to-gross ratio, Fraction
    - STB          = Stock Tank Barrels, volume unit
    - STOIIP       = Stock Tank Oil Initially In Place, STB

<a name="references"></a>
<a href="#references"></a>
<!-- ## References ## -->

