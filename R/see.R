#' Just prints a vector in a nicer format 
#'
#' Prints a vector with entries separated by two newlines and a hashtagline.
#' Easier to read, i think.
#' @param vec Vec to see
#' @keywords convenience 
#' @export
#' @examples
#' see(rownames(mtcars)) 

see <- function(vec){
	writeLines(sample(vec,size = 5),sep = paste('\n',strrep('#',36),'\n'))
}
