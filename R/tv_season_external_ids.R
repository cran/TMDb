tv_season_external_ids <-
function(api_key, id, season_number, language=NA){
    
    if(!is.na(language) && !is.character(language)){
        stop("language must be a ISO639-1 code")
    }
    
    l <- list(language=language)
    l <- l[!is.na(l)]
    
    if(length(l)>0){
        params <- paste("&", names(l), "=", stri_join_list(l, sep = ","), sep = "", collapse = "")
        url <- fromJSON(GET(url=paste("http://api.themoviedb.org/3/tv/", id, "/season/", season_number, 
                                      "/external_ids?api_key=", api_key, params, sep=""))$url)
    } else{
        url <- fromJSON(GET(url=paste("http://api.themoviedb.org/3/tv/", id, "/season/", season_number, 
                                      "/external_ids?api_key=", api_key, sep=""))$url)
    }
    
    return(url)
    
}
