\name{pipe_with}
\alias{pipe_with}
\title{Create a pipe operator with a fixed side-effect.}
\usage{
pipe_with(fun)
}
\arguments{
  \item{fun}{a function which will be evaluated with
  left-hand side of a pipe expression as argument.}
}
\value{
a pipe operator with the attached side effect.
}
\description{
This is useful e.g. for logging, plotting, or printing each
step in a pipeline.
}
\examples{
# Define a logging function
logger <- function(x)
  cat(as.character(Sys.time()), ":", nrow(x), "\\n")

# Create a pipe using the logger.
`\%L>\%` <- pipe_with(logger)

# Test it:
iris \%L>\%
   subset(Species == "setosa") \%L>\%
   subset(Sepal.Length > 5) \%L>\%
   tail(10)
}

