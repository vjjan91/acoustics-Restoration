## Source code for _Using passive acoustic monitoring to examine the impacts of ecological restoration on faunal biodiversity in the Western Ghats_

<!-- badges: start -->
  [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

This repository contains code and analysis for a manuscript that uses acoustic data to examine the impacts of active forest restoration on vocalizing biodiversity in the Western Ghats biodiversity hotspot.  

This manuscript is currently in _review_. Please reach out to the lead author if you have questions.  

### [Readable version](https://vjjan91.github.io/acoustics-Restoration/)

A readable version of this analysis is available in bookdown format by clicking on the heading above.

### Source code for the analyses

We describe what each script (`.Rmd`) of this repository is intended to achieve below.  
- _01_site-selection.Rmd:_. Here, we carry out exploratory data analyses to show that the sites across treatment types (naturally regenerating (NR), actively restored (AR) and benchmark (BM)) are comparable. We examined elevation, distance to the nearest road, and distance between AR-NR site pairs. We also followed site selection criteria outlined by Osuri et al., (2019) and Hariharan and Raman (2021) to ensure that sites are similar in terms of physiognomy and climate.  

- _02_vegetation-data.Rmd:_. Here, we process vegetation data and examine differences in vegetation (habitat) structure and composition across treatment types.  

- _03_acoustic-space-use.Rmd_: A novel metric of acoustic space use is calculated in this script. In this study, acoustic space use reflects the amount and pattern of vocalizations within each frequency bin for a given time period (please see Aide et al. 2017; Marconi-Cerqueira et al. 2019).  

- _04_nmds-acoustic-space-use.Rmd_: Non-metric multidimensional scaling of acoustic space use data.  

- _05_glmms-acoustic-space-use-vegPca.Rmd_: Running generalized linear mixed models to test for associations between acoustic space use and restoration type. In addition, we run generalized linear mixed models to test associations between acoustic space use and habitat (vegetation structure).  

- _06_split-large-wavs.Rmd_: Raw audio data is divided into smaller chunks for the purpose of annotation and downstream processing. This is solely done to examine bird diversity across our recordings.  

- _07_species-richness-birds.Rmd:_. Species richness was estimated across all treatment types by considering all bird species, rainforest specialists and open-country generalist species. 

- _08_cumulative-acoustic-detections-birds.Rmd:_. Here, we calculated the total number of detections of each bird species across multiple temporal durations (10s, 30s, 1min, 2min and 4min).  

- _09_proportion-acoustic-detections-birds.Rmd:_. Here, we calculated the proportion of acoustic detections of rainforest and open-country bird species at each site.  

- _10_nmds-bird-detections.Rmd:_. Non-metric multidimensional scaling of bird species detections.   

- _11_jackknife-scores-birds.Rmd:_. First-order jackknife scores are extrapolated based on species richness estimates at each site and treatment type.   

- _12_glmms-jackknifeScore-vegPCA-plantingYear.Rmd:_. Running generalized linear mixed models to test for associations between first order jackknife scores, vegetation measurements and planting year.    

- _13_glmms-acousticDetections-vegPCA-plantingYear.Rmd_: Running generalized linear mixed models to test for associations between bird species proportions (rainforest and open-country species) and restoration type. In addition, we run generalized linear mixed models to test associations between species proportions and habitat (vegetation structure) as well as the effect of planting year.    

- _14_glmms-acoustic-space-use-birdDetections-plantingYear.Rmd_: Running generalized linear mixed models to test for associations between acoustic space use and bird species detections as well as year since restoration began.    

### Data 

The `data/` folder contains the following datasets required to reproduce the above scripts.   

- `species-trait-dat.csv`: Contains a list of species detected in our study, along with habitat affiliations (RF = Rainforest birds and OC = Open-country birds)   

- `list-of-sites.csv`: Contains the list of sites across which audio recorders were deployed along with ancillary information, including latitude, longitude.  

- `2020-vegetation-data.csv`: Contains habitat structural variables recorded across each site in 2020. This data was collected by scientists and research assistants at the Nature Conservation Foundation (Western Ghats Team). For more information regarding the same, please see Hariharan and Raman (2021) and Osuri et al. (2019).  

### Results

This folder contains outputs that were obtained by running the above scripts. Here, the files are described in alphabetical order and not in the order in which they were obtained after running the above scripts.    

- `acoustic-detections-across-visits.csv`: The proportion of rainforest and open-country bird species detections at the point count level.  

- `acoustic-detections.csv`: The proportion of rainforest and open-country bird species detections across all 10-s clips analyzed.  

- `datSubset.csv`: This file contains a list of species detected for every 10-s audio clip analyzed. In total, we analyzed ~69 hours of data. If you would like to use this dataset for your analysis, please write to the lead author of the study.  

- `jackAll.csv`: First-order jacknife estimates for all species at each site.  

- `jackOpencountry.csv`: First-order jacknife estimates for open-country species at each site.   

- `jackRainforest.csv`: First-order jacknife estimates for rainforest species at each site.   

- `nmds-acousticSpaceUse-diurnal.csv`: NMDS ordination scores of diurnal acoustic space use across sites (times chosen: 6AM to 6PM).  

- `nmds-acousticSpaceUse-nocturnal.csv`: NMDS ordination scores of nocturnal acoustic space use across sites (times chosen: 6PM to 6AM).  

- `nmds-acousticSpaceUse.csv`: NMDS ordination scores of overall acoustic space use across sites (times chosen: midnight to midnight).   

- `nmdsBrayCurtis-bird-detections.csv`: NMDS ordination scores of bird species detections.  

- `pcaLoadings.csv`: PCA loadings of the habitat structural variables.  

- `pcaVeg.csv`: PCA scores of the habitat structural variables.  

- `pcaLoadings.csv`: PCA loadings of the habitat structural variables.  

- `summaryVeg.csv`: A summary sheet of the vegetation data.  

- `site-by-day.csv` and `site_date_asu.rdata`: Acoustic space use values for each site and day.  

- `site-wise-asu.csv` and `site_asu.rdata`: Acoustic space use values (averaged) at the site level.  

### Figures  

The `figs\` folder contains figures accompanying the main text, as well as supplementary material figures. The main text figures are suffixed with numbers (example:`fig01`).  

### Graphical abstract

![Representative panels that depict the bird community composition and habitat structure for a naturally regenerating (NR), actively restored, and a benchmark site (BM) is shown here. On the left is an illustration of the bird communities of an NR site - the canopy is exposed and the site is dominated by open-country bird species such as the Chestnut-headed bee-eater _Merops leschenaulti_, Common tailorbird _Orthotomus sutorius_ and the Rufous babbler _Argya subrufa_. In the middle is an illustration of an AR site - here, the canopy is closing in and a larger number of rainforest bird species such as the Southern hill myna _Gracula indica_ and the Greater racket-tailed drongo _Dicrurus paradiseus_ are observed here. In the far right is an illustration of a BM site - here, the canopy is largely closed with little light penetrating to the ground. Rainforest specialist birds like the Malabar trogon _Harpactes fasciatus_ and the Great hornbill _Buceros bicornis_ are observed here. The illustrations were made by Chayant Gonsalves, based on data from this study and Hariharan and Raman 2021.](figs/graphicalAbstract.png)    

### Attribution

Please contact the following in case of interest in the project.

[Vijay Ramesh (lead author)](https://evolecol.weebly.com/)  
PhD student, Columbia University