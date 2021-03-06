credit <-
function(api_key, credit_id, language=NA){
    
    if(!is.na(language) && !is.character(language)){
        stop("language must be a ISO639-1 code")
    }
    
    l <- list(language=language)
    l <- l[!is.na(l)]
    
    if(length(l)>0){
        params <- paste("&", names(l), "=", stri_join_list(l, sep = ","), sep = "", collapse = "")
        url <- fromJSON(GET(url=paste("http://api.themoviedb.org/3/credit/", credit_id, "?api_key=", 
                                      api_key, params, sep=""))$url)   
    } else{
        url <- fromJSON(GET(url=paste("http://api.themoviedb.org/3/company/", credit_id, "?api_key=", 
                                      api_key, sep=""))$url)        
    }
    
    return(url)
    
}
