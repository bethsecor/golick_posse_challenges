# Read in data:
scorecard.data <- read.csv("/Users/elizabethsecor/Documents/Turing/3module/posse/college_scorecard/2013_college_scorecards.csv", header = TRUE, stringsAsFactors = FALSE)

class(scorecard.data$AVGFACSAL)
head(scorecard.data)

# Clean data:
scorecard.data$AVGFACSAL <- as.numeric(scorecard.data$AVGFACSAL)
scorecard.data$GRAD_DEBT_MDN <- as.numeric(scorecard.data$GRAD_DEBT_MDN)
scorecard.data$DEBT_MDN <- as.numeric(scorecard.data$DEBT_MDN)

# 1. Filter By State
scorecard.data$INSTNM[scorecard.data$STABBR == 'AK']

by_state = function(state){
	scorecard.data$INSTNM[scorecard.data$STABBR == state]
}
by_state('AK')

# 2. Filter By Top Average Faculty Salary
top_average_faculty_salary = function(number){
	head(scorecard.data[order(-scorecard.data$AVGFACSAL),]$INSTNM, number)
}
top_average_faculty_salary(10)

# 3. Filter By Median Debt Floor and Ceiling
median_debt_between = function(debt.floor, debt.ceiling){
	scorecard.data.debt <- subset(scorecard.data, GRAD_DEBT_MDN < debt.ceiling & GRAD_DEBT_MDN > debt.floor, select = c(INSTNM, GRAD_DEBT_MDN))
	scorecard.data.debt  <- scorecard.data.debt[order(-scorecard.data.debt$GRAD_DEBT_MDN,scorecard.data.debt$INSTNM),]
	return(paste(scorecard.data.debt$INSTNM, " ($", scorecard.data.debt$GRAD_DEBT_MDN, ")", sep=""))
	scorecard.data.debt <- NULL
}
median_debt_between(1500,2300)