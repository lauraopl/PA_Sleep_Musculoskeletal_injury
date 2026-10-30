#===========================================================
# Analyse GENEActiv data using GGIR package:
# https://wadpac.github.io/GGIR/index.html
#===========================================================

#===== set working path to source file location
library(rstudioapi)
setwd(dirname(getActiveDocumentContext()$path))
getwd()


#===== libraries 
# Load libraries or install if needed
if(!require(GGIR)) install.packages("GGIR", dependencies = TRUE) 

#===== GGIR
mode = c(1,2,3,4,5)
datadir = "Full_sample_bin"
outputdir = "output_Full_sample_bin"
studyname = "Full_Sample_bin"
f0 = 1
f1 = 0

GGIR( # START GGIR
  #-------------------------------
  # General parameters
  #-------------------------------
  mode = mode,
  datadir = datadir,
  outputdir = outputdir,
  studyname = studyname,
  f0 = f0,
  f1 = f1,
  overwrite = FALSE,
  do.imp = TRUE,
  #idloc = 1,
  print.filename = FALSE,
  storefolderstructure = FALSE,
  #-------------------------------
  # Part 1 parameters:
  #-------------------------------
  windowsizes = c(5,900,3600),
  do.cal = TRUE,
  do.enmo = TRUE,
  do.anglez = TRUE,
  chunksize = 1,
  printsummary = TRUE,
  #-------------------------------
  # Part 2 parameters:
  #-------------------------------
  data_masking_strategy = 1,
  # ndayswindow = 7,
  hrs.del.start = 0,
  hrs.del.end = 0,
  #maxdur = 7,
  includedaycrit = 16,
  # M5L5res = 10,
  #winhr = c(5,10),
  #qlevels = c(c(1380/1440),c(1410/1440)),
  qwindow = c(0,24),
  #ilevels = c(seq(0,400,by=50),8000),
  #mvpathreshold = c(100,120),
  #-------------------------------
  # Part 3 parameters:
  #-------------------------------
  #timethreshold = c(5,10),
  anglethreshold = 5,
  ignorenonwear = TRUE,
  #-------------------------------
  # Part 4 parameters:
  #-------------------------------
  excludefirstlast = FALSE,
  includenightcrit = 16,
  def.noc.sleep = c(1),
  outliers.only = FALSE,
  criterror = 3,
  relyonguider = FALSE,
  #colid = 1,
  #coln1 = 2,
  do.visual = TRUE,
  #-------------------------------
  # Part 5 parameters:
  #-------------------------------
  # Key functions: Merging physical activity with sleep analyses
  threshold.lig = c(56.3), #from published
  threshold.mod = c(191.6),
  threshold.vig = c(695.8),
  boutcriter = 0.8,
  boutcriter.in = 0.9,
  boutcriter.lig = 0.8,
  boutcriter.mvpa = 0.8,
  boutdur.in = c(10,20,30),
  boutdur.lig = c(1,5,10),
  boutdur.mvpa = c(1,5,10),
  timewindow = c("WW"),
  #-----------------------------------
  # Report generation
  #-------------------------------
  do.report = c(2,4,5)
  
) # END GGIR


