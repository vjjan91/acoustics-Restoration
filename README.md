## Source code for _Using passive acoustic monitoring to examine the impacts of active restoration on vocalizing biodiversity in the Western Ghats_

<!-- badges: start -->
  [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

This repository contains code and analysis for a manuscript that uses acoustic data to examine the impacts of active forest restoration on vocalizing biodiversity in the Western Ghats biodiversity hotspot.  

## ** IN CONSTRUCTION BELOW **

### [Readable version](https://vjjan91.github.io/acoustics-Restoration/)

A readable version of this analysis is available in bookdown format by clicking on the heading above.

## Source code for the analyses

We describe what each script (`.Rmd`) of this repository is intended to achieve below.  

- _01_site-selection.Rmd:_. Here, we carry out exploratory data analyses to show that the sites across treatment types (naturally regenerating (NR), actively restored (AR) and benchmark (BM)) are comparable. We examined elevation, distance to the nearest road, and distance between AR-NR site pairs. We also followed site selection criteria outlined by Osuri et al., (2019) and Hariharan and Raman (2021) to ensure that sites are similar in terms of physiognomy and climate.  

- _02_vegetation-data.Rmd:_. Here, we process vegetation data and examine differences in vegetation (habitat) structure and composition across treatment types.  

- _03_acoustic-space-use.Rmd_: A novel metric of acoustic space use is calculated in this script. In this study, acoustic space use reflects the amount and pattern of vocalizations within each frequency bin for a given time period (please see Aide et al. 2017; Marconi-Cerqueira et al. 2019).  

- _04_nmds-acoustic-space-use.Rmd_: Non-metric multidimensional scaling of acoustic space use data.  

- _05_glmms-acoustic-space-use-vegPca.Rmd_: Running generalized linear mixed models to test for associations between acoustic space use and restoration type. In addition, we run generalized linear mixed models to test associations between acoustic space use and habitat (vegetation structure).  

- _06_split-large-wavs.Rmd_: Raw audio data is divided into smaller chunks for the purpose of annotation and downstream processing. This is solely done to examine bird diversity across our recordings.  

- _07_species-richness-birds.Rmd:_. Species richness was estimated across all treatment types by considering all bird species, rainforest specialists and open-country generalist species. 

- _08_acoustic-detections-birds.Rmd:_. Here, we calculated the total number of detections of each bird species across multiple temporal durations (10s, 30s, 1min, 2min and 4min).  

- _09_jackknife-scores-birds.Rmd:_. First-order jackknife scores are extrapolated based on species richness estimates at each site and treatment type.   

- _10_nmds-bird-detections.Rmd:_. Non-metric multidimensional scaling of bird species detections.  

- _11_glmms-jackknifeScore-vegPCA-plantingYear.Rmd:_. Running generalized linear mixed models to test for associations between first order jackknife scores, vegetation measurements and planting year.    

- _12_glmms-acoustic-space-use-birdRichness-plantingYear.Rmd_: Running generalized linear mixed models to test for associations between acoustic space use and bird species richness as well as year since restoration began.    

## Data 

The `data/` folder contains the following datasets required to reproduce the above scripts.   

### Attribution

Please contact the following in case of interest in the project.

[Vijay Ramesh (lead author)](https://evolecol.weebly.com/)  
PhD student, Columbia University