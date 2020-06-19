# Install package from source
# upload package
library(PrescRiptions)
#######################################
#### DEFINE SETTINGS
#######################################
# Generate Root directory, month and year of interest using the following instruction
# This is the only way of making these parameters valid across all package functions

settings = PrescRiptions::setConfig(rootdir = "output",
                                    year = 2019, 
                                    month = 07, 
                                    region = "England")

# Create all paths for the package, relative to the root directory you have choosen
dirs = dirsGen(settings)

#######################################
#### DOWNLOAD & IMPORT DATA
#######################################

############ Data Download on pc
monthlyData_download(settings, sample = T)

############ Data download in the WS
# download in WD data for the specified month and year
dataAll = monthlyData_import(settings,sample = T)

# Data wrangling
# the following code attach the datasets from the list to the the WS 
# and keeps data names
# Data are loaded as data.table. 

for (i in 1:length(dataAll)){
  print(names(dataAll)[i])
  assign(names(dataAll)[i],dataAll[[i]])
}

#######################################
#### GENERATE SUMMARIES
#######################################

# Create bridge for plpd and CCG data

practiceBridge = PrescRiptions::plpdDemogBridge(get(settings$plpdName), get(settings$demogMapName))

# Generate summaries 

ccgSum = ccgSummaries(plpd=get(settings$plpdName),bnf=get(settings$bnfName),demog=get(settings$demogName),demogMap=get(settings$demogMapName), settings = settings)
gpSum = gpSummaries(plpd=get(settings$plpdName),demog=get(settings$demogName),demogMap=get(settings$demogMapName), settings = settings)

# See the CCG and GP Codes available for report customisation 

ccgSum$ccg_summary[,unique(ONS_CCG_CODE)]
gpSum[,unique(PRACTICE)]

#######################################
#### GENERATE MONTHLY REPORTS
#######################################

# Report With Customised information for Both CCG and GP

renderMonthlyReport(settings = settings, 
                    monthData = dataAll,ccg="E38000056",gp="N81097")

# Report With Customised information for CCG 

renderMonthlyReport(settings = settings, 
                    monthData = dataAll,ccg="E38000056")

# Report With Customised information for  GP

renderMonthlyReport(settings = settings, 
                    monthData = dataAll,gp="N81097")

# Report With NO Customised information

renderMonthlyReport(settings = settings, 
                    monthData = dataAll)
