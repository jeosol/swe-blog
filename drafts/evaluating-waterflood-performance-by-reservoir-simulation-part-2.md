+++
author       = "Jerome E. Onwunalu, PhD"
date         = "2016-08-29T09:00:00"
lastmod      = "2017-09-05T14:49:00"
projname     = "watercut-pred"
assetdir     = "assets/petroleum/posts/"
draft        = false
toc          = false
#topics       = ["petroleum", "maths"]
categories   = ["reservoir simulation","reservoir engineering","waterflood performance"]
tags         = ["waterflood"]
keywords     = ["watercut","reservoir simulation", "reservoir engineering","vertical equilibrium"]
title        = "Evaluating Waterflood Performance in a Cross Section using Reservoir Simulation: Part 2"
subtitle     = "Primary depletion vs. Waterflood"
description  = "Example article description"
disable_comments = false
thumbnail    = "img/portrait.jpg"
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

## Introduction ##

<a href={{< ref
"post/petroleum/tutorials/evaluate-waterflood/evaluating-waterflood-performance-by-reservoir-simulation-part-1.md"
>}}>Part 1 - Introduction </a>


This post is part of the series focused on evaluating wateflood performance in
a cross section. Links to the other parts can be found above. See Part 1 for
the introductory post to the series.

In this post, we will demonstrate the benefits of waterflooding over primary
depletion. As described earlier in the series, all simulation is carried out
using the cross-section model. 

## Objective 

The primary objective in this post is to compare the
performance of primary depletion and waterflood in the cross-section. We will
perform two sets of simulation runs. In the first set, we perform simulations
corresponding to primary depletion and in the second set, we perform several
simulations corresponding to the waterflood case. 

The secondary objective is to illustrate the effect of varying producer-injector distance on the flood
performance. In the simulations for the waterflood cases, we vary the producer
and injector locations. 

## Tasks ##
As described above, we will perform two sets of simulations. The first case
corresponds to the primary depletion scenario and the other four cases (with
varying producer-injector distances) correspond to
the waterflood scenario. Unless otherwise stated, all wells
are vertical and fully penetrating and the references to producer means oil
production well and injector means water injection well. The simulation cases
are described next.

- **Case 1**: **Primary depletion** - The simulation model contains a single
oil producer that is completed in the middle of the simulation
(x-direction). There is no water injection into the simulation model hence,
there is no extraneous source of water into the model (initial water
saturation is immobile in each layer). The location of the producer is at
approximately **5000 ft** from the left end. 

- **Case 2**: **Waterflood** - Using the model from **Case 1**, we will add a
water injection at the leftmost grid block
of the model. The producer location is not changed. The distance between the producer and injector is approximately
**5000 ft**.

- **Case 3**: **Waterflood** - Using the model from **Case 2**, we will move the
  producer towards the right to a distance of about **7500 ft** from the left edge.
     
- **Case 4**: **Waterflood** - Using the model from **Case 3**, we will move the
     producer to a distance of about **10000 ft** from the injector. Now the
     producer is at the rightmost grid in the simulation model.
     
- **Case 5**: **Waterflood** - Using the model from **Case 1**, we will add two
  injectors to the rightmost and leftmost grids in the simulation
  models. In order to make the results equivalent to the other waterflood
  cases, we will share the total injection rates from the previous cases
  between the two wells, i.e., each injector in **Case 5** injects at half the
  rate of the injectors in **Cases 2**, **3**, and **4**. This case is added to provide
  another comparison to Case 1 with the producer in the same location and the
  water injectors on either side of the producer.
  
###### Notes 

- In **Cases 2** and **3**, the grid blocks to the right of the producer are not
  flooded.
  
- We do not perform economic calculations at this point, so we will only compare
the simulation results. Economic analyses will be considered later in the
series and this will be important while **Case 5** is similar to **Case 4**,
it requires one more injector. 
  

## Results ##

Here will be describe the results from the simulation
We will first focus on using reservoir simulation to evaluate the waterflood
performance. Several tasks will be performed and they will be described in
different posts. The tasks are group into the following:

- **Data Analysis**: Analyse all data required to build the simulation model
  
- **Model Construction**: Building the simulation model
- **Sensivitity Analysis**: Different sensitivity analyses to evaluate different
  factors that affect waterflood performance including relative permeability,
  mobility ratio, gravity, reservoir dip, offtake rates, etc. 
  
- **Economic Analysis** - Use the simulation results to compute different economic
  indicators including **payout time**, **net present value (NPV)**, **Rate
  of Return (RoR)**. Payout time, NPV, and RoR are examples of economic
  indicators used to rank projects. These terms will be described in detail
  later when we get to Economic Analyses tasks. Additionally, we will
  investigate sensivities, e.g., variabilities in oil price, cost of water
  injection, cost of processing unwanted fluids.
  
  Note that computing project economic indicators often requires a
  three-dimensional, full-field simulation model which contains multiple wells
  (producers and injectors) and is much larger in size compared to the
  cross-section model considered in the series. However, I have decided to include economic analyses here
  for illustration purposes and complete the process of evaluating waterflood performance.

## Theme of Series ##
Three themes of the series include:

- **Educational** 
   - Focus is on learning
   - Improve understanding of waterflooding evaluation and concepts for other
   colleagues (Managers, Geoscientists, Drillers, Students, etc) and other
   stake holders.
   
- **Simple**
   - Keep the steps, descriptions and workflows reasonable simple. Different
   companies and operators have specific workflow adjustments and processes,
   e.g., choosing the best (i.e., optimizing) the location of the oil
   prodution and water injection wells. Also, the project would often (and
   should) involve multi-disciplinary teams.

- **Agnostic**
   - Keep descriptions largely agnostic, i.e., without reference to specific
   company tools. However, I am using an automated workflow processing tools
   for all the analyses in this tutorial series. This tool will be described
   later. 
   - Focus on the main ideas relevant to the topic of evaluating waterflood
     performance

## Format ##

The different tasks involved in evaluating the waterflood performance in the
cross-section will be described and analyzed in separate posts with each post
adding different pieces as we move from the cross-section data to economic
analyses. All things being equal, I will post short descriptions as LinkedIn
posts but this website will contain full details and analyses of the different
tasks. 

## Feedback and comments ##
Feedback and comments are welcome but the previously describe theme
(educational, simple, and agnostic) should be kept in mind. The feedback and
comments should be constructive and devoid of specific tools. All feedback
should be sent to jerome@onwunalu.com or as comments in the respective
LinkedIn post. I will do my best to respont to comments in a timely fashion
and also will gladly modify content to incorporate comments and feedback that
are deemed useful. However, expect some delay if comments and/or feedback
involve some code modification or implmentation. 

## Background ##

Jerome holds MSc and PhD degrees from Stanford University and B.Eng degree
from University of Port Harcourt (Nigeria) all in Petroleum Engineering. My
research and work activities focus on field development optimization,
history-matching, data analysis, developing of algorithms and workflow tools
for efficient optimization of large scale problems. 

I have worked at BP Upstream Technology Technology Group in a variety of
projects ranging from Research and Development (R&D), Reservoir Simulation
Support, Analogue Benchmarking, and Merger and Acquisition roles. During this
time, I worked on various reservoir simulation problems including
history-matching, field development optimization problems for large fields in the
Gulf of Mexico (.e.g, Atlantis, Thunder Horse), Alaska (Liberty, Prudhoe Bay)
amongst others. I have also developed and implemented different optimization
algorithms and workflow tools some of which are used in the tutorial series. 

## Acknowledgements ##
Jerome has worked with different advisors and leaders who have influenced him
over the years from the University of Port Harcourt, Stanford University, BP,
etc, to whom he is grateful for the opportunity granted. These will be too
numerous to mention here. 

However, of particular relevance to this tutorial series are reservoir
engineering advisors that Jerome collaborated with on different
projects. These include:

- **Mike Litvak** -  different field development optimization problems
- **Gary Jerauld** - reservoir simulation modeling of EOR/IOR processes
- **Robert (Bob) Merrill** -- development of specifications for a Reservoir
Engineering Toolkit -- relative permeability modeling and waterflood modules

## Conclusion ##

Throughout thepost is the first in a series showing the application of reservoir simulation to predict watercut development for a producer in a reservoir section under waterflood. A workflow flow automation tool is used to perform all the analyses.

Reservoir simulation is an important tool used by reservoir engineers to
generate production profiles, determine reserves and recovery
efficiency. Usually a reservoir model and a depletion scenario are
provided. However, reservoir simulation may not be preferred for very quick
specialized prospect evaluation studies because of project time constraints,
simulation model construction requirements, limited or missing model inputs,
etc. Some of these issues could be addressed. 

We could address the issue of project time constraints and model construction requirements  by using an automated tool to manage the
overall workflow. Such a tool would do all the work required, e.g., building
the simulation model, submitting the simulation run(s), and post-processing
results after simulations. Overall
workflow runtime would generally depend on the size of the simulation model
and the available computing resources. The total run time for the cases
described here takes about 10-20 seconds (on a 64-bit machine running Linux)
and depends on the type of output requested, e.g., plots, saturation maps,
saturation profiles, etc.

Lack of data could be addressed by considering uncertainty in inputs by incorporating several reservoir models. In this case, the automated workflow tool would save more time by using parallel processing to handle the additional model runs. An example of a use case for this type of workflow is quick assessment and analysis of a prospect where different reservoir depletion scenarios have to be evaluated quickly.

There are many factors that affect watercut development in a reservoir
including relative permeability, mobility ratio, gravity, reservoir
heterogeneity, reservoir dip, degree of vertical communication, etc. We will
consider these factors as we progress through the tutorial series.


We will keep things very simple and only consider two of these factors for the example described here. The two factors are reservoir heterogeneity and degree of vertical communication between the layers (other factors will be considered in subsequent posts in the series). We assess the impact of reservoir heterogeneity by considering different permeability-depth profiles, and the degree of vertical communication by considering different vertical permeability (Kv) to horizontal permeability (Kh) ratios, hereafter referred to as Kv/Kh. We will use a simple reservoir section for illustration and pedagogical purposes.


<!-- I am using a custom tool developed to performed all the stages of workflow.
The reader is referred to standard petroleum engineering textbooks some of which are listed in the reference section. -->
Please use the {{% commentlink "comment" %}} section to leave any useful comments, feedback and suggestions.
<!-- If the reader has a set of realistic reservoir description data (.e.g, permeability, porosity, etc) they want to share, they could send it to the author. -->

## Model description ##

We will use a simple heterogeneous reservoir section for our analysis. The section is comprised of 20 layers with varying properties. Each layer has a different porosity, permeability, thickness, initial water saturation, and end-point relative permeability to the water phase. The dimensions of our reservoir section will be used in the simulation model construction. <!-- is 10000 ft x 100 ft x 439 ft. -->

The permeability vs. depth profile for the reservoir section is shown in Figure {{% figlink "1a" %}}. We will refer to this permeability trend as <strong>Natural</strong> ordering case to differentiate it from the other cases. We will consider three other permeability-depth profiles that are obtained by sorting the layers (according to permeability) of the original reservoir section. These new cases are referred to as <strong>Coarsening Up</strong> (permeability decreasing with depth, Figure {{% figlink "1b" %}}), <strong>Fining Up</strong> (permeability increasing with with depth, Figure {{% figlink "1c" %}}), and <strong>Combination</strong> (reservoir section is comprised of Fining Up and Coarsening Up sequences, Figure {{% figlink "1d" %}}).

<!-- <a href="#showpermprofiles" class="btn btn-info" data-toggle="collapse"> -->
<!-- Show/Hide Permeability Profiles</a> -->
{{% plot_perm_profiles "watercutpred" "natural1a-permx-profile.png" "coarseup-permx-profile.png" "finingup-permx-profile.png"
    "combination-permx-profile.png" %}}
## Reservoir Simulation Model ##

A simple cross-section (X-Z) reservoir simulation model is used to describe fluid flow behavior in the reservoir section. The simulation model has the same layer rock and fluid properties as the reservoir section described earlier. We
will assume that the reservoir contains only oil and water phases. The relative permeability curves are end-point adjusted to honor the initial water saturation (Swi) in each layer, ensuring that the water phase is initially immobile.

The simulation grid dimensions is modeled after the reservoir section. The grid has length of 10,000 ft, width of 100 ft, and height of 439 ft (sum of all layer thickness). The simulation grid then is discretized uniformly into 100 grid blocks in the X-direction, 1 grid block in the Y-direction, and 20 grid blocks in the Z-direction (one for each layer). The height of the grid blocks vary by layer and is equal to the thickness of its corresponding layer in the reservoir section. The total
number of grid blocks in the simulation model is 2000 grid blocks.

The injector and producer wells are fully penetrating vertical wells and are
completed at the extreme left (100, 1, 1-20) and the right (1,1,1-20) grid blocks
respectively. The total production time is 5 years. Note that the simulations do not include lift curves to model vertical lift performance.

For each simulation case, the workflow tool builds the appropriate simulation input deck for the simulator using input parameters, submits the simulation run, post-processes the simulation results.

We perform simulations for two different depletion scenarios. In the first scenario, we assume no vertical communication (Kv/Kh = 0), and any injected water that enters a layer is confined to that layer. In the second scenario, we allow vertical communication by setting Kv/Kh = 0.1. In both scenarios, the Kv/Kh values are constant for any two adjacent layers. Also, for each scenario, we performed simulations for the different permeability-depth profiles described earlier (see  <a href="#1a">Figure 1</a>).

## Simulation Results ##

We run the workflow and output standard production plots (watercut vs. time, watercut vs. cumulative oil produced, etc) in addition to the saturation maps (at 6 month intervals) and the corresponding saturation profiles. The different plots are discussed briefly in the following sections.
<!--
<ol>
<li><a href="/post/petroleum/naturalcompare-kvkh/effect-of-kvkh-natural-ordering/">Natural Ordering </a> </li>
<li><a href="/post/petroleum/coarseupcompare-kvkh/effect-of-kvkh-coarsening-up/">Coarsening Up</a></li>
<li><a href="/post/petroleum/finingupcompare-kvkh/effect-of-kvkh-fining-up/">Fining Up</a></li>
<li><a href="/post/petroleum/combinationcompare-kvkh/effect-of-kvkh-combination/">Combination</a></li>
</ol>
-->
<!-- <a href="#non-communicating-layers" class="btn btn-info"
data-toggle="collapse"> Show/Hide Results</a> -->

<!-- <div id="non-communicating-layers" class="collapse">
    <h4> Saturation Maps (kv/kh=0.0) </h4>
    <a href="#non-comm-sat-maps" class="btn btn-info" data-toggle="collapse"> Show/Hide Saturation Maps </a>
    <div id="non-comm-sat-maps" class="collapse">
    -->


### Production Plots

The production plots for both Kv/Kh scenarios (0.0 and 0.1) are shown in Figures <a href="#2a">2</a>. The production plots are grouped in two with the top plot corresponding to Kv/Kh = 0 and the bottom plot to Kv/Kh = 0.1. Each production plot shows the profile for the different permeability-depth profiles.

Figures {{% figlink "2a" %}} and {{% figlink "2b" %}} compare watercut vs. time for the different permeability distributions. With no vertical communication, the simulation results are "similar". This is because the order in which the layers flood is independent of their position in the reservoir sequence. In Figure {{% figlink "2b" %}}, when there is there is vertical communication between the layers, we observe that the breakthrough times vary with reservoir section as expected. Note that I have included the natural ordering case with Kv/Kh = 0.0 (denoted by the green line, legend "natural") for comparison with the other cases when Kv/Kh = 0.1.

The impact of Kv/Kh can be noticed in the other production quantities, e.g., watercut vs. cumulative oil produced (Figures {{% figlink "2c" %}},{{% figlink "2d" %}}), oil production rate vs. time (Figures {{% figlink "2e" %}}, {{% figlink "2f" %}}), and cumulative oil produced vs. time (Figures {{% figlink "2g" %}},{{% figlink "2h" %}}).

{{% compareprods "comparekvkh" "Kv/Kh = 0.0" "Kv/Kh = 0.1" "2" %}}
<a id="saturation-profiles"></a>
<a id="#saturation-profiles"></a>
### Saturation Profile Plots
<!-- The saturation profile plots are obtained by depth-averaging of the saturation maps-->
Plots of water saturation as a function of injector-producer distance provides an indication of the sweep efficiency in the reservoir section. For each simulation, we can plot the saturation profile vs. distance for
different timesteps. For each permeability distribution, we compute the saturation profiles at intervals of 6 months (0.5 years). Figure <a href="#saturation-profile-figs">3</a> shows the water saturation profiles for the Natural ordering (Figures {{% figlink "3a" %}}, {{% figlink "3b" %}}), Coarsening Up (Figures {{% figlink "3c" %}}, {{% figlink "3d" %}}), Fining Up (Figures {{% figlink "3e" %}}, {{% figlink "3f" %}}) and Combination (Figures {{% figlink "3g" %}}, {{% figlink "3h" %}}) cases respectively. In each case, the top plot corresponds to simulations with Kv/Kh = 0.0 and the bottom plot with Kv/Kh = 0.1. The saturation profile with the dotted line gives an indication of the water breakthrough time.

<a name=saturation-profile-figs></a>
<a id="#saturation-profiles"></a>
{{% comparesatprofiles2 "kvkh0pt0" "kvkh0pt1" "Kv/Kh = 0.0" "Kv/Kh = 0.1" "3" "a c e g" "b d f h" "Saturation Profiles" %}}

<a id="saturation-maps"></a>
<a id="#saturation-maps"></a>
### Saturation Maps
The saturation maps from the simulation runs are shown below for the two depletion (Kv/Kh = 0.0 and 0.1) scenarios considered. The effect of heterogeneity and degree of vertical communication is clearly visible in the saturation maps. As described earlier, the simulations with Kv/Kh = 0, shows that the injected water in a layer is confined to that layer and the overall saturation distribution is impacted by the permeability-depth profile. The position of the water front is furthest in the layer with the highest permeability. With Kv/Kh = 0.1, the water phase sinks to the lower layers as the front advances to the producer resulting in a relatively smoother front and better performance.


{{% casefigures3 "kvkh0pt0" "Kv/Kh = 0.0" "kvkh0pt0maps" "4" %}}
<br/>
<br/>
{{% casefigures3 "kvkh0pt1" "Kv/Kh = 0.1" "kvkh0pt1maps" "5" %}}
<!--
{{% casefigures2 "kvkh0pt0" "Saturation Maps for Kv/Kh = 0.0" "kvkh0pt0maps" %}}
{{% casefigures2 "kvkh0pt1" "Saturation Maps for Kv/Kh = 0.1" "kvkh0pt1maps" %}}
-->
<br />
<a name="conclusions"></a>
<a href="#conclusions"></a>

## Conclusions ##

The use of automated workflow for these type of tasks can significantly reduce
work load and overall analysis time. A simple example is used
to show the effect of reservoir heterogeneity (via different
permeability-depth profiles) and the effect of degree of vertical communication (via
different Kv/Kh ratios) on watercut development. Additional factors affecting
watercut development, e.g., reservoir dip, mobility ratios, can be easily
incorporated in the workflow. The examples considered above take only a few
seconds to evaluate all cases using parallel processing (distributed
computing). In future post in the series, we will consider the other factors,
e.g., reservoir dip, relative permeability. We will also perform a similar analysis using analytical methods to predict watercut development and compare the results to those obtained from reservoir simulation.

<a name="references"></a>
<a href="#references"></a>

## References ##

