movie_images <-
function(api_key, id, language=NA, append_to_response=NA, include_image_language=NA){
    
    if(!is.na(append_to_response)){
        append_to_response<-gsub(pattern = " ",replacement = "", x = append_to_response)
        v<-unlist(strsplit(append_to_response, split=","))
        movie_method <- c("alternative_titles", "credits", "images", "keywords", "releases", "videos", "translations", "similar", "reviews", "lists", "changes", "rating", "latest", "upcoming", "now_playing", "popular", "top_rated")
        for (i in v){
            if (!(i %in% movie_method))
                stop(paste(i,  "is not a valid movie_method"))
        }
    }
    
    l <- list(language=language, append_to_response=append_to_response, 
              include_image_language=include_image_language)
    l <- l[!is.na(l)]
    
    if(length(l)>0){
        params <- paste("&", names(l), "=", stri_join_list(l, sep = ","), sep = "", collapse = "")
        url <- fromJSON(GET(url=paste("http://api.themoviedb.org/3/movie/", id, "/images?api_key=", 
                                      api_key, params, sep=""))$url)
    } else{
        url <- fromJSON(GET(url=paste("http://api.themoviedb.org/3/movie/", id, "/images?api_key=", 
                                      api_key, sep=""))$url)
    }
    
    return(url)
    
}
