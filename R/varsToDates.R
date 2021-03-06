#' Merges Variables Into a Date Variable 
#'
#' A function that merges several variables containing year, month and day into a single
#' date variable. The function can also substitute missing values with means, like middle
#' of month and so on.
#' @param varlist list of date variables, like  
#' @keywords dates 
#' @export
#' @importFrom magrittr "%>%"
#' @examples
#' df$date <- varsToDates(list(year = df$year,month = df$month,day = df$day) 

varsToDates <- function(varlist,fixNaDay = TRUE,fixNaMonth = FALSE){

	if(!all(c('year','month','day') %in% names(varlist))){
		stop('usage: varsToDates(list(year=year,month=month,day=day))')
		}


	fixNa <- function(x,replacement){
		if(is.na(x)) warning('Replacing ',names(x))
		x <- ifelse(is.na(x),replacement,x) 
		}

	vtd <- function(varlist){

		vars <- lapply(varlist,as.numeric)%>%
		as.data.frame(stringsAsFactors = FALSE)

		apply(vars,1,function(r){

		r <- lapply(r,function(v){ifelse(v > 0,v,NA)})

		if(fixNaDay){
			r['day'] <- fixNa(r['day'],15)
		}
		if(fixNaMonth){
			r['month'] <- fixNa(r['month'],6)
		}

		if(all(!is.na(r))){
		paste(r['year'],r['month'],r['day'],sep = '-')
		}

		else {
		NA
		}

		})
	}
	as.Date(vtd(varlist))
}

