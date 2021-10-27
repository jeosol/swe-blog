+++
author       = "Jerome E. Onwunalu"
date         = "2016-06-01T09:00:00"
projname     = "watercut-pred"
assetdir     = "assets/petroleum/posts/"
draft        = true
topics       = ["petroleum"]
tags         = ["reservoir simulation","reservoir engineering"]
keywords     = ["watercut","reservoir simulation", "reservoir engineering","vertical equilibrium"]
title        = "Reservoir Simulation: Effect of Kv/Kh on Watercut Development - Natural Ordering Case"
description  = ""
slug         = "effect-of-kvkh-natural-ordering"
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
This post shows the summary plots from the simulations using the original reservoir section and different Kv/Kh ratios: 0.0, 0.1, and 0.5 (See <a
href="/post/petroleum/watercut-pred/predicting-well-water-cut/"> here</a> for details). The permeability-depth profile for this case is shown below.

{{% plot_one_perm_profile "watercutpred" "natural1a-permx-profile.png" "Figure 1: Natural Ordering case - original reservoir section" %}}

## Simulation Results ##
<!-- {{< importPartial "post/petroleum/watercut_pred/table_kvkh_3.html" >}} -->
<!-- <h2 class="text-left">Simulation Results</h2> -->
{{< importPartial "post/petroleum/nat-compare-kvkh/nat-compare-kvkh-partial.html" >}}
