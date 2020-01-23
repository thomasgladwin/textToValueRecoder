# textToValueRecoder

A little utility function (in R), originally made for when questionnaire responses were saved as the original response-option text rather than as a numerical code.

Your recodings can be specified for all necessary variables by specifying:
- the variable name
- the text of all response options
- the value to assign to each response option

In the example code, the raw data are assumed to come from an Excel file including a row with headers, one of which is Q29. The responses stored in that column were on a 5-point Likert scale. To recode all response options of this column, the following lines of code were put in the "func_do_recode_specs" function:

this_varname = 'Q29'
DF <- func_recode(DF, this_varname, "Strongly disagree", 0)
DF <- func_recode(DF, this_varname, "Somewhat disagree", 1)
DF <- func_recode(DF, this_varname, "Neither agree nor disagree", 2)
DF <- func_recode(DF, this_varname, "Somewhat agree", 3)
DF <- func_recode(DF, this_varname, "Strongly agree", 4)

Once this is specified for all the columns that need to be recoded (i.e., the func_do_recode_specs function will contain a possibly long list of all the recodings), the script can be run. It will produce a text file called recoded.csv for further processing.

Make sure you adjust the data if needed; for instance, there may be an unnecessary line of "sub-header" information that could get in the way. The line 

DF <- DF[-1,]

can be un-commented to remove this extra top-line from the raw data.
