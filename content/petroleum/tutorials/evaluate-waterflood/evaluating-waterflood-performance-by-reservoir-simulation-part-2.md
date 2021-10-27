+++
author       = "Jerome E. Onwunalu, PhD"
date         = "2021-07-12T09:00:00"
lastmod      = "2021-09-08T14:49:00"
projname     = "watercut-pred"
assetdir     = "assets/petroleum/posts/"
draft        = false
toc          = false
#topics       = ["petroleum", "maths"]
categories   = ["reservoir simulation","reservoir engineering","waterflood performance"]
tags         = ["waterflood"]
keywords     = ["watercut","reservoir simulation", "reservoir engineering","vertical equilibrium"]
title        = "Evaluating Waterflood Performance in a Cross Section using Reservoir Simulation: Part 2 - Simulation Model"
subtitle     = "Reservoir Simulation Model"
description  = "Example article description"
disable_comments = false
thumbnail    = "assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/base_well_schematic.png"
slug         = "evaluating-waterflood-performance-reservoir-simulation-part-2"
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


## Previous Part(s)

[Part 1 - Overview]({{< ref "petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-1.md" >}} "Part 1 - Overview")

## Objective
-- Describe the simulation model and economic model that we will use for the waterflood
performance evaluation of the reservoir cross section.


## Introduction ##

In this post, we will briefly describe the simulation model that we will use for
the waterflood performance evaluation.

The reservoir simulation model described here represents a base case. We will make adjustments to this base
case model (e.g., the change the Kv/Kh ratio, tilt the reservoir, etc) to illustrate the
effect of different factors (e.g., vertical communication between layers, gravity, etc.) on the
waterflood performance. 

## Simulation Model 

A simple cross-section (X-Z) simulation model is used to describe
fluid flow in the reservoir cross-section. The simulation model is constructed
mainly using the cross-section reservoir properties including permeability,
porosity, and initial water saturation. We have made assumptions for the other parameters
required to build a simulation model (e.g., relative permeability curves, well
data, well controls, fluid and rock-fluid properties). These assumptions will
be described later. 

### Cross-section Data
The cross-section data contains 20 layers. Relevant rock and rock-fluid properties, e.g., layer
thickness, permeability, porosity and initial water saturation
vary for each layer. Figure 1 shows the permeability vs. depth profile of the
cross-section data. 

{{< rawhtml >}}
<div class="front-container">
    <div class="row">
        <div class="figure">
            <img
            src="/assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/perm_cross_section.png"
            class="img-responsive"/>
            <p class="figure-caption">Figure 1: Logarithm of permeability
    vs. depth for the cross-section.</p>
        </div>
    </div>
</div>
{{< /rawhtml >}}

### Simulation Grid

The simulation model is consistent with the cross section data. The simulation grid contains 20 layers, each layer corresponding to a layer in the cross-section.


For our base case simulation model, we will assume a simulation grid of
100 x 1 x 20 cells. The
dimension of each grid cell in the X-direction is **100ft** and for
the Y-direction, it is **500ft**. The thickness (height) of each grid cell varies and
is equal to the thickness of the corresponding layer in the
cross-section. The dimension of the simulation grid is **10,000ft** by **500ft** by
**439ft** (this is the sum of all layer heights). 

Figure 2 shows the
simulation grid with the X-direction permeability property displayed. The
highest permeabilities (approximately 900md) are found in layers 9 and 10 indicated by the red
colored layers.

{{< rawhtml >}}
<div class="front-container">
    <div class="row">
        <div class="figure">
            <img
            src="/assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/base_case_perm.png"
            class="img-responsive"/>
            <p class="figure-caption">Figure 2: Simulation grid showing the
    X-direction permeability values (md).</p>
        </div>
    </div>
</div>
{{< /rawhtml >}}

The base case simulation model is horizontal. In later series, we will tilt the reservoir to investigate gravity effects. 

### Relative Permeability
The cross-section data contains different initial water saturation (Swi)
values for each
layer. We have assumed that the oil phase makes up the rest of the saturation,
i.e., Soi = 1- Swi. As a result, our simulation model will contain only two
phases, oil and water. 

Corey relative permeability model was used to generate a base relative
permeability curve. This base curve is then end-point adjusted for each layer
to obtain the relative permeability curve for each layer. The adjustment
ensures that the water phase is initially immobile in each layer. The
relative permeability curves for the 20 layers is shown in Figure 3.

{{< rawhtml >}}
<div class="front-container">
    <div class="row">
        <div class="figure">
            <img
            src="/assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/oil-water-relperm.png"
            class="img-responsive"/>
            <p class="figure-caption">Figure 3: Relative permeability curves
                      for the different layers</p>
        </div>
    </div>
</div>
{{< /rawhtml >}}

### Wells
We assume that all wells are simple, fully-penetrating vertical wells, i.e.,
the wells are completed in all the layers of the simulation model. A well location is specified as (I, J, K1-K2) where I and J are the grid block indices in the X- and Y-directions
respectively, and K1 and K2 represent the start and end layers where the wells are completed. Also, the well control
type and control values specified for each well remains constant throughout the
production period. 

For the simulations, we will assume reservoir voidage
controls for simplicity, and the total reservoir injection rate from the
injector(s) is set equal to the total reservoir voidage rate from the producer.

#### Waterflooding well configuration

The base simulation model contains only two wells, a water injection well (injector) and an
oil production well (producer).

Figure 3 shows the well configuration for waterflooding the cross-section. In
Figure 3, L = 10,000 ft, W = 500 ft and H = 439 ft as described in the
simulation grid section. The
injector is located at the left end of the simulation model, completed in grid
blocks (1,1,1-20), and the producer at the right end of the model and
completed in grid blocks (100,1,1-20). 

{{< rawhtml >}}
<div class="front-container">
    <div class="row">
        <div class="figure">
            <img
            src="/assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/base_well_schematic.png"
            class="img-responsive"/>
            <p class="figure-caption">Figure 3: Well configuration for
            waterflooding. </p>
        </div>
    </div>
</div>
{{< /rawhtml >}}

Water is injected from the surface (indicated by blue
arrow(s)) into the reservoir (via the injector's wellbore). Water in the
reservoir then displaces the oil (indicated by green arrows) towards the
producer. Fluids in the producer then flows subsequently to the surface. In this
setup, water is normally referred to as the
**displacing** phase and oil as the **displaced** phase.

The fluids produced in
the producer depends on the stage of the waterflood. Before water
breakthrough (i.e., before the water reaches the producer), only oil is
produced in the producer. After water breakthrough (water has reached the producer),
both oil and water are produced with the oil rate decreasing and the water
rate increasing with time. 


## Production Schedule
We have assumed a total production time of 15 years in the base model. As
described earlier, the well controls are fixed and constant throughout the production period. Later, 
we will remove this limitation and allow the well control to vary within fixed time intervals. 

## Economic model 

We will use an economic model to evaluate different production scenarios,
e.g., primary depletion, waterflooding. A simple economic
model is used to compute net present value (NPV). NPV is an important economic criterion
for evaluating and comparing different projects. Projects with higher NPV
values are (generally) better. There are other important economic indicators,
e.g., discounted cash flow rate of return (ROR, DCFROR), development cost, pay
out time, etc. However for simplicity, we will focus more on NPV.

The economic model we use accounts for well drilling and
completion costs, royalty rate, tax rate, and operating expense related to
production and injection of oil and water phases. The parameter values assumed
in the economic model are shown in Table 1.

{{< rawhtml >}}
<div class="front-container">
    <table class="table-stripped table-hover table-responsive"
    style="width:50%">
    <p> Table 1: Economic parameters for computing NPV </p>
    <tr>
      <th class="table-header" style="font-weight:bold">Parameters</th>
      <th class="table-header" style="font-weight:bold">Value</th>
    </tr>
    <tr>
      <td> Well Costs </td> <td> 12.0x10^6 $ </td>
    </tr>
    <tr>
      <td> Oil Price </td> <td> 40 $/bbl </td>
    </tr>
    <tr>
      <td> Water production costs </td> <td> 6 $/bbl </td>
    </tr>
    <tr>
        <td> Water injection costs </td> <td> 3 $/bbl </td>
    </tr>
    <tr>
        <td> Royalty rate </td> <td> 12.5% </td>
    </tr>
    <tr>
        <td> Discount rate </td> <td> 8% </td>
    </tr>
    <tr>
        <td> Tax rate </td> <td> 40% </td>
    </tr>
    </table>
</div>

<br/>
<br/>
{{< /rawhtml >}}

All wells are pre-drilled and are fully operational prior to start of
production. Hence, the well drilling and
completion costs are incurred in the first year of production. 

In the economic model, the operating expenses and fluid prices and costs are assumed to be
fixed throughout the production period. For the rest of the series, we will assume these economic parameters for
computing NPV. 

## Simulation Model Assumptions

Other assumptions in the simulation model include: 

-  all grid cells have a net-to-gross (NTG) of 1.0.

-  all grid cells in the model are active.

-  rock properties (PERMX, PERMY, PERMZ, PORO, ...) are constant for each layer.

-  each grid cell's X-direction permeability (PERMX) is set equal to corresponding
   layer value from the cross-section. Porosity and initial water saturation
   are defined similarly.

-  permeability in the X (PERMX) and Y (PERMY) directions are equal, while the permeability in
   the Z-direction (PERMZ) is 10% of PERMX.
   
-  relative permeability curves are generated using Corey model, then end-point
   adjusted for each layer.

-  dead oil PVT model, i.e., no gas is dissolved in the oil phase. There is no
   gas in the simulation model.

-  no artificial lift curves and hence pressure losses in the tubing are not
   modeled.

-  constant well controls throughout production period.


## Conclusion ##

In this post, we have described the (base) simulation model that we will use
for the waterflood performance evaluation of the cross-section. The description is at a high-level
and does not include details of the simulation deck. We have chosen this approach
because there are different reservoir simulators with different requirements,
file formats/layouts, and also not to burden non reservoir engineers with too
much technical details. However, if there is enough interest, we will
make a separate post showing how the different components are put together to
obtain the simulation deck. 

While the simulation model can be built by hand, we use an automatic
workflow tool for generating (and running) the simulation models. There are many
simulation cases (hence simulation models) that we will consider in the tutorial series,
so it will be too time consuming to build each simulation model, submit the
simulations, and post-process the results manually. These tasks (and others) are performed
automatically by the tool. 

## What's Next
Having described the simulation model, we can now make simulation runs to model fluid flow in the cross sections. In our next post, we will consider different production scenarios and compare the benefits of waterflooding over primary depletion. We will use
cumulative oil produced (COP) and net present value as metrics for our comparisons.

Do not hesitate to contact me with feedbacks and comments. 

<a name="references"></a>
<a href="#references"></a>

## Nomenclature ##
    - COP          = Cumulative oil produced (m3 or STB)
    - DCFROR, ROR  = Discounted cash flow rate of return, Rate of Return
    - Kv/Kh        = Vertical to horizontal permeability ratio, Fraction
    - md           = milliDarcy, unit of permeability measurement
    - NPV          = Net Present Value, $
    - NTG          = Net-to-gross ratio, Fraction
    - PORO         = Grid cell porosity, Fraction
    - PERMX        = X-direction grid cell permeability, md
    - PERMY        = Y-direction grid cell permeability, md
    - PERMZ        = Z-direction grid cell permeability, md
    - PVT          = Pressure volume temperature
    - Swi          = Initial water saturation, Fraction.
    - Soi          = Initial oil satuation, Fraction.

## References ##
Here is a (contnuously updated) list of some useful references for additional
reading or for understanding concepts described here. 


- **Willhite, G.P.** *Waterflooding*, SPE Textbook Series Volume 3, (1986), Society
  of Petroleum Engineers, Richardson, TX. ISBN 978-1-55563-005-8

- **Oystein Pettersen** *Basics of Reservoir Simulation the Eclipse Reervoir
  Simulator*, Lecture Notes (2006), Department of Mathematics, University of
  Bergen. http://folk.uib.no/fciop/index_htm_files/ResSimNotes.pdf

- <a href="http://petrowiki.org/Relative_permeability_models">Petrowiki Relative
     Permeability Models</a>
