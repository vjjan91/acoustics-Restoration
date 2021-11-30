## Source code for _Using acoustics to assess the impacts of forest restoration on bird communities in the Western Ghats_

<!-- badges: start -->
  [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

This repository contains code and analysis for a manuscript that uses acoustic data to understand the impacts of forest restoration on bird communities of the Western Ghats.

### [Readable version](https://vjjan91.github.io/acoustics-westernGhats/)

A readable version of this analysis is available in bookdown format by clicking on the heading above.

We describe what each script of this repository is intended to achieve below.

- _01_split-large-wavs.Rmd:_. Raw audio data is divided into smaller chunks for the purpose of annotation and downstream processing.

- _02_species-richness.Rmd:_. Species richness was estimated across all treatment types by considering all bird species, rainforest specialists and open-country generalist species. 

- _03_acoustic-detections.Rmd:_. Here, we calculated the total number of detections of each bird species across multiple temporal durations (10s, 30s, 1min, 2min and 4min). 

- _04_jackknife-scores.Rmd:_. First-order jackknife scores are extrapolated based on species richness estimates at each site and treatment type. 

- _05_nmds-indicator-analysis.Rmd:_. Non-metric multidimensional scaling of bird species richness and bird species detections and indicator species analysis on bird detections. 

- _06_vegetation-data-prep.Rmd:_. Processing vegetation data to run generalized linear mixed models in future scripts.  

- _07_glmms-jackknifeScore-vegPCA-plantingYear.Rmd:_. Running generalized linear mixed models to test for associations between first order jackknife scores, vegetation measurements and planting year.  

- _08_multiple-regression-distance-matrices-bird-detections.Rmd:_. Running multiple regression on distance matrices to test for associations between bird community compositional dissimilarity and dissimilarity in habitat structure, geographic distance and floristics.  

- _09_acoustic-space-use.Rmd_: A novel metric of acoustic space use is calculated in this script.

- _10_nmds-acoustic-space-use.Rmd_: Non-metric multidimensional scaling of acoustic space use data.  

- _11_glmms-acoustic-space-use-vegPca.Rmd_: Running generalized linear mixed models to test for associations between acoustic space use and vegetation measurements  

- _12_multiple-regression-distance-matrices-acoustic-space-use.Rmd:_. Running multiple regression on distance matrices to test for associations between dissimilarity in acoustic space use and dissimilarity in habitat structure, geographic distance and floristics.  

- _13_glms-acoustic-space-use-richness-plantingYear.Rmd_: Running generalized linear models to test for associations between acoustic space use and bird species richness as well as year since restoration began.  

### Attribution

Please contact the following in case of interest in the project.

[Vijay Ramesh (lead author)](https://evolecol.weebly.com/)  
PhD student, Columbia University