complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    #directory = "specdata"
    #id= 1:3
    
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
    nobs_final = data.frame()

    for (i in 1:length (myfiles)){
        nobs_raw = myfiles[i]
        for (j in nobs_raw){
            nobs_raw1 = j[!is.na(j$sulfate) & !is.na(j$nitrate),]

        }
        obs_id = nobs_raw[[1]]

        nobs_final <- rbind (nobs_final, data.frame(id = obs_id[1,4], nobs = nrow(nobs_raw1)))
    }
    
    nobs_final
    

}