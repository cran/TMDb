\name{movie_similar}
\alias{movie_similar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Retrieve similar movies.
}
\description{
Get the similar movies for a specific movie id.
}
\usage{
movie_similar(api_key, id, page = 1, language = NA, append_to_response = NA)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{api_key}{
Your TMDb Consumer Key.
}
  \item{id}{
The movie ID.
}
  \item{page}{
The number of the page to show. Minimum 1, maximum 1000.
}
  \item{language}{
A ISO 639-1 code.
}
  \item{append_to_response}{
A comma separated, any movie method.
}
}
\value{
A list with the following fields:
\item{page}{The current page for the results.}
\item{results}{The similar movies, with a brief description.}
\item{total_pages}{The number of pages for the results.}
\item{total_results}{The number of results.}
}
\references{
https://developers.themoviedb.org/3/getting-started
}
\author{
Andrea Capozio
}
\examples{
\dontrun{
## An example of an authenticated request,
## where api_key is fictitious.
## You can obtain your own at https://www.themoviedb.org/documentation/api

api_key <- "key"

movie_similar(api_key = api_key, id = 578, language = "de", append_to_response = "credits")
} 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{movie_similar}
