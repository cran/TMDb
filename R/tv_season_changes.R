tv_season_changes <-
function(api_key, id, start_date=NA, end_date=NA){
    
    if(!is.na(start_date) && !is.character(start_date)){
        stop("start_date must be a date string like YYYY-MM-DD")
    }
    
    if(!is.na(end_date) && !is.character(end_date)){
        stop("end_date must be a date string like YYYY-MM-DD")
    }
    
    l <- list(start_date=start_date, end_date=end_date)
    l <- l[!is.na(l)]
    
    if(length(l)>0){
        params <- paste("&", names(l), "=", stri_join_list(l, sep = ","), sep = "", collapse = "")
        url <- fromJSON(GET(url=paste("http://api.themoviedb.org/3/tv/season/", id, "/changes?api_key=", 
                                      api_key, params, sep=""))$url)
    } else{
        url <- fromJSON(GET(url=paste("http://api.themoviedb.org/3/tv/season/", id, "/changes?api_key=", 
                                      api_key, sep=""))$url)
    }
    
    return(url)
    
}
