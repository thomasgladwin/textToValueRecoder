# Usage: Adjust the function func_do_recode_specs to work for your response options.

#
# Function definitions:
#

func_recode <- function(DF, columnName, textToReplace, value) {
  rowsToRecode <- (DF[,which(colnames(DF) == columnName)] == textToReplace)
  DF[which(rowsToRecode == TRUE), which(colnames(DF) == columnName)] = value
  return(DF)
}

func_do_recode_specs <- function(DF) {

  this_varname = 'Q29'
  DF <- func_recode(DF, this_varname, "Strongly disagree", 0)
  DF <- func_recode(DF, this_varname, "Somewhat disagree", 1)
  DF <- func_recode(DF, this_varname, "Neither agree nor disagree", 2)
  DF <- func_recode(DF, this_varname, "Somewhat agree", 3)
  DF <- func_recode(DF, this_varname, "Strongly agree", 4)
  
  this_varname = 'Q30'
  DF <- func_recode(DF, this_varname, "Strongly disagree", 0)
  DF <- func_recode(DF, this_varname, "Somewhat disagree", 1)
  DF <- func_recode(DF, this_varname, "Neither agree nor disagree", 2)
  DF <- func_recode(DF, this_varname, "Somewhat agree", 3)
  DF <- func_recode(DF, this_varname, "Strongly agree", 4)
  
  return(DF)
}

#
# Script
#

# Read the data into a dataframe
library(readxl)
filename <- "example.xlsx"
DF <- read_excel(filename)

# Make any necessary manual changes, like removing a data row with questionnaire subheadings
# (This may be necessary with Qualtrics output.)
# DF <- DF[-1,]

# Run the recode function, as previously adjusted. If you adjust the function, make sure to
# run the code to redefine the function.
DF <- func_do_recode_specs(DF)

# Save the recoded dataframe to a text file
# To read this into SPSS via Reat tex Data you may need to manually replace NA values
# with a replacement value like 666, and then recode that to a System Missing in SPSS.
write.csv(DF, "recoded.csv", row.names = FALSE, quote = FALSE)
