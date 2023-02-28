# CyberSecurity CRISP-DM

# Description

This project is intended to give an overview of how the CRISP-DM data science process
is applied. 2 Cycles of CRISP-DM were applied onto two main business questions towards stakeholders.
For futher information of what CRISP-DM is CRISP-DM 1.0: Step-by-step data mining guide by P. Chapman, J. Clinton, R. Kerber, T. Khabaza, T. Reinartz, C. Shearer, R. Wirth.

# Loading Project

The ProjectTemplate Library in Rstudio was used to structure all the contents in the respective files.
Write library(ProjectTemplate) in console and make sure that the working directory is set within the file name of this project "CyberSecurity". Write "load.project()" in console to get all the necessary libraries, data and visualizations required.
Libraries used: ProjectTemplate, reshape2, plyr, tidyverse, stringr, lubridate, forecast, here, ggpubr, dplyr.
Within this template there are 7 runs with multiple data sets per run which are repeated for every run. ALl these files can be found within the "data" folder. Only 2 of these repeated sets are used in this project, "cyber-security-#-_video-stats.csv" and "cyber-security-#-_enrollments.csv". The rest of the folders were left within the project for the intent of future use by other users.

# Data Wrangling
All the data wrangling was handled in the "munge" folder, using the 01-A.R script.
The data set



# Visuals
The analysis and visuals for this project can be found in the "src" folder, in the analysis.R script.
6 visuals were plotted using ggplot in this project, 3 visuals for each CRISP-DM cycle. The first cycle focuses on the following three questions:

First Cycle:
1. Which devices are most popular to follow online lectures?
2. What is the trend of the mean views as the year progresses with lectures?
3. Which continents are most popular with online learning?

Second Cycle:
1. Which countries are the most popular with online learning?
2. Drop out rate per year?
3. Total rate of Drop out over the years?

# Reports
The report of my findings for this project is located in the "reports" folder as cybersec_report.Rmd/.pdf for both the RMarkdown and pdf file. The self reflection report is also found within the same folder as "Self_reflection.pdf". 

