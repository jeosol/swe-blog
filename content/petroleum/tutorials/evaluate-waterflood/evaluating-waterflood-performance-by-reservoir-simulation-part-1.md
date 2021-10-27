+++
author       = "Jerome E. Onwunalu, PhD"
date         = "2021-07-05T09:00:00"
lastmod      = "2021-09-09T07:06:00"
projname     = "watercut-pred"
assetdir     = "assets/petroleum/posts/"
draft        = false
toc          = false
#topics       = ["petroleum", "maths"]
categories   = ["reservoir simulation","reservoir engineering","waterflood performance"]
tags         = ["waterflood"]
keywords     = ["watercut","reservoir simulation", "reservoir engineering","vertical equilibrium"]
title        = "Evaluating Waterflood Performance in a Cross Section using Reservoir Simulation: Part 1 - Introduction"
subtitle     = "From Cross Section Data to Economics -- Introduction"
description  = "Example article description"
disable_comments = false
thumbnail    = "assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/tutorial-figure-slide-figure-template.png"
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

This post is the first in a series that focuses on evaluating waterflood
performance in a reservoir cross-section. The main objective of the series of posts is
educational. There will be several posts, each 
describing a different aspect of waterflood performance evaluation in the cross-section. We will
consider different tasks including building the reservoir simulation model, performing
different sensitivity and economic analyses. For all these tasks, we will be using the same
base simulation model or perform adjustments to the model to illustrate relevant ideas.

We will consider two different approaches for evaluating waterflood
performance: **analytical** and **reservoir simulation**, and compare the results from both approaches. The two approaches will be considered in
separate tutorial series. In this series, we will consider **reservoir simulation** for the waterflood performance evaluation.

## Objective ##
As described previously, the focus of the series is educational. As a result,
I have chosen to use a cross-section model (X-Z) for faster computation and
post-processing; ease of illustrating and understanding the
waterflooding concepts discussed; and ease of comparing analytical and
reservoir simulation approaches. 

Our main objective is to perform a waterflooding evaluation of the
cross-section. We will work our way from reviewing the cross-section data
to performing economic analyses using the production profiles obtained from the
simulation runs.

### Sample workflow

A sample workflow is illustrated in Figure 1. From the figure in the top left
(then clockwise), we have the permeability vs. depth profile of the reservoir
cross-section. 

![Workflow schematic](/assets/petroleum/posts/tutorials/evaluate-waterflood-simulation/tutorial-figure-slide-figure-template.png)
Figure 1: Sample workflow steps.

The next figure shows the well configuration we will adopt for waterflooding
the cross-section. There are two types of well, a water injection well (injector) on the left side
and an oil production well (producer) on the right side of the schematic. Injected water goes into the
injector from the surface through the tubing, and into the
reservoir (via the injector wellbore) where it displaces oil towards the producer. The oil
follows a similar, but reversed path, from the producer wellbore into the
tubing and then to the surface processing facilities. 

Next, is a cross-section (X-Z) simulation model showing the **X**-direction
permeability which is constant across each layer. The layer properties
(thickness, PERMX, porosity, ...) in the simulation
model correspond to those from the cross-section. The flooding
is modeled in two directions: **X**-direction (horizontal) and **Z**-direction
(vertical). It is assumed that only two phases, oil and water, are
present in the reservoir, the water phase in the reservoir is initially immobile, and there is no natural aquifer. Also, both
wells are vertical and fully-penetrating, i.e, they are completed in all the grid blocks
in the Z-direction. We perform a reservoir simulation run (using a simulator) to
obtain the results from the waterflood simulation.

The next two figures (fourth and fifth) show example of simulation results that are obtained. The
first of these figures is a water saturation map and shows the saturation fronts in each
layer after 4.0 years of injection. The injected water moves from left side of
model to the right towards the producer. The scenario modeled here is one
where the layers are hydrodynamically isolated from each other, i.e., no
communication between adjacent layers. Assuming continuous injection, the
saturation map changes with time with subsequent maps showing higher water
saturations.

The fifth figure shows the oil and water production rates obtained after the
simulation run. The production rate profiles are typical of waterflooding
operations. In this case, the oil production rate is constant for
approximately 5 years (called plateau period)
and then water breakthrough occurs, i.e., the injected water reaches the producer. This
event is marked by a reduction in the oil production rate and an increase in the
water production rate and water cut (fraction of water in total production stream). The bumps in the production curves corresponding
to the successive flooding of the layers with the order of flooding depending on the layers' flood
velocities. 

Finally, from the production rate profiles, we compute economic indicators for the
particular scenario represented by the simulation model. The economic
model takes as input the production profiles from the simulation run and
pre-defined economic parameters including oil price, water disposal/treatment cost, water injection
costs, etc.

The different components in described Figure 1 will be studied
and described in detail later on, so there is no need to worry if something is
not clear at this time. 


## Tasks ##
The different tasks will be addressed in separate posts to reduce mental
load. They are grouped as follows: 

- **Data Analysis**: Review cross-section data and assemble data required to build the simulation model
  
- **Model Construction**: Building the simulation model

- **Sensitivity Analysis**: Different sensitivity analyses to evaluate different
  factors that affect waterflood performance including relative permeability,
  mobility ratio, gravity, reservoir dip, offtake rates, etc. These set of
  tasks is a slight detour from our plan to move from the cross-section data to
  economic analyses. 
  In practice, data is not known with
  certainty, and sensitivity analyses will be carried out to quantify
  uncertainties and risks to the project. The sensitivity analyses tasks have been included to show how
  the these factors can alter waterflood performance results. 
  
- **Economic Analysis** - Compute economic indicators using the simulation
  results.  Economic indicators that we will compute include **payout time**, **net present value (NPV)**, **Rate
  of Return (RoR)**. **NPV** and **RoR** (discounted) are used to rank
  projects and a project with higher **NPV** and **RoR** is usually better. These terms will be described in detail
  later when we get to the Economic Analyses. Additionally, we will
  perform some economic sensitivity analyses to investigate the effect of
  changes in our economic parameters, e.g., oil price, cost of water
  injection, cost of processing unwanted fluids, etc., on the economic
  indicators. 
  
  In practice, computing a project's economic indicators often require a
  three-dimensional, full-field simulation model containing multiple wells
  (producers and injectors) and the simulation model is much larger in size compared to the
  cross-section model considered in the series. However, I have decided to include economic calculations here
  for a more complete analyses and to demonstrate its important in waterflood project evaluation.
    

## Theme of Series ##
  The theme of the series is described as follows: 

- **Educational** 
   - Focus on learning.
   - Improve understanding of waterflooding evaluation and concepts for other
   colleagues (Managers, Geo-scientists, Drillers, Students, etc) and other
   stake holders.
   
- **Simple**
   - Keep the steps, descriptions and workflows reasonably simple. Different
   companies and operators have specific workflow adjustments and processes,
   e.g., choosing optimal well locations, well completions and controls for the wells. Also, the project would often (and
   should) involve multi-disciplinary teams who contribute different expertise to
   the overall project evaluation.


- **Agnostic**
   - Keep descriptions largely agnostic, i.e., without reference to specific
   company tools. However, I am using an automated workflow processing tool
   for all the analyses in this tutorial series.
   - Focus on the main ideas relevant to the topic of evaluating waterflood
     performance

## Format ##

The different tasks involved in evaluating the waterflood performance in the
cross-section will be described and analyzed in separate posts with each post
adding different pieces as we move from the cross-section data to economic
analyses. This (temporary) website will contain full details and analyses of
the different tasks. All things being equal, I will make shorter versions
available as LinkedIn posts. 


## Feedback and comments

Feedback and comments are welcome but the
previously described theme (educational, simple, and agnostic) should be kept
in mind. The feedback and comments should be constructive and should not lead
to unnecessary arguments and/or detract from the objectives of the series. 

I will do my best to respond  to comments in a timely fashion. Also, I will gladly
modify content to incorporate useful comments and feedback. However, please expect
some delays if incorporating comments and/or feedback require workflow
modification and/or code implementation.

## What's next
In the next post, we will describe the cross-section data and the reservoir simulation
model that we will use for the waterflood performance evaluation. 

<!--
## Background ##

Jerome holds MSc and PhD degrees from Stanford University and B.Eng degree
from University of Port Harcourt (Nigeria) all in Petroleum Engineering. My
research and work activities focus on field development optimization,
history-matching, data analysis, developing of algorithms and workflow tools
for efficient optimization of large scale problems. 

He worked at BP Upstream Technology Technology Group in a variety of
projects ranging from Research and Development (R&D), Reservoir Simulation
Support, Analogue Reservoir and Production Benchmarking, and Merger and Acquisition roles. During this
time, he worked on various reservoir simulation problems including
history-matching, field development optimization problems for large fields in the
Gulf of Mexico (e.g, Atlantis, Thunder Horse), Alaska (Liberty, Prudhoe Bay)
amongst others. He has also developed and implemented different optimization
algorithms and workflow tools some of which are used in this tutorial series. 

## Acknowledgments ##
I have worked with different advisors and leaders who have influenced me
over the years from the University of Port Harcourt, Stanford University, BP,
etc, to whom I am grateful for the opportunities granted. These will be too
numerous to mention here. 

However, of particular relevance to this tutorial series are advisors I
collaborated with on different projects. These include:

- **Mike Litvak** -  different (large-scale) field development optimization projects
<!-- - **Gary Jerauld** - reservoir simulation modeling of EOR/IOR processes 
- **Robert (Bob) Merrill** -- development and implementation of specifications for a Reservoir
Engineering Toolkit: Relative Permeability and Waterflood modules

-->
