% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lookfor.R
\name{look_for}
\alias{look_for}
\alias{lookfor}
\title{Look for keywords variable names and descriptions}
\source{
Based on the behaviour of the \code{lookfor} command in Stata.
}
\usage{
look_for(data, ..., labels = TRUE, ignore.case = TRUE, details = FALSE)

lookfor(data, ..., labels = TRUE, ignore.case = TRUE, details = FALSE)
}
\arguments{
\item{data}{a data frame}

\item{...}{list of keywords, a character string (or several character strings), which can be
formatted as a regular expression suitable for a \code{\link[base:grep]{base::grep()}} pattern, or a vector of keywords;
displays all variables if not specified}

\item{labels}{whether or not to search variable labels (descriptions); \code{TRUE} by default}

\item{ignore.case}{whether or not to make the keywords case sensitive;
\code{TRUE} by default (case is ignored during matching)}

\item{details}{add details about each variable (see examples)}
}
\value{
a data frame featuring the variable position, name and description
(if it exists) in the original data frame
}
\description{
\code{look_for} emulates the \code{lookfor} Stata command in \R. It supports
searching into the variable names of regular \R data frames as well as into
variable labels descriptions.
The command is meant to help users finding variables in large datasets.
}
\details{
The function looks into the variable names for matches to the keywords. If available,
variable labels are included in the search scope.
Variable labels of data.frame imported with \pkg{foreign} or
\pkg{memisc} packages will also be taken into account (see \code{\link[=to_labelled]{to_labelled()}}).

\code{look_for()} and \code{lookfor()} are equivalent.
}
\examples{
look_for(iris)
# Look for a single keyword.
look_for(iris, "petal")
look_for(iris, "s")
# Look for with a regular expression
look_for(iris, "petal|species")
look_for(iris, "s$")
# Look for with several keywords
look_for(iris, "pet", "sp")
look_for(iris, "pet", "sp", "width")
# Labelled data
\dontrun{require(questionr)
data(fertility)
look_for(women)
look_for(women, "date")
# Display details
look_for(women, details = TRUE)
}
}
\author{
François Briatte \href{mailto:f.briatte@gmail.com}{f.briatte@gmail.com}
}
