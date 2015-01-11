pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

    files = list()
    for(i in id){
        if(i<10){
            files = c(files,paste(directory,"/","00",i,".csv",sep="")) 
         }
        else if (i<100){
            files = c(files,paste(directory,"/","0",i,".csv",sep="")) 
        }
        else {
            files = c(files,paste(directory,"/",i,".csv",sep="")) 
        }
     }
    
    myfiles = lapply(files, read.csv, header = TRUE)
    alldata_frame = do.call(rbind, myfiles)

    sel_pollutant = alldata_frame[[pollutant]]
    bad <- is.na(sel_pollutant)
    mean(sel_pollutant[!bad])

  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}