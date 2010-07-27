% File grt/man/dprime.Rd
\name{dprime}
\alias{dprime}
\alias{dprimef}
\title{Calculate d' (d-prime)}
\description{Obtain the standardized distance between the two probability distributions, known as d' or sensitivity index.
}
\usage{
dprime(x,
    category,
    response,
    par = list(),
    zlimit = Inf,
    type = c("SampleIdeal", "Observer"))

dprimef(means, covs, noise=NULL)
}
\arguments{
\item{x}{a data frame or matrix containing samples from two multivariate normal distributions.}
\item{category}{a vector or factor of labels of populations to which the samples belong}
\item{response}{a vector or factor specifying the participant's classification responses for each samples}
\item{par}{object of class \code{glcStruct} or a named list containing a set of parameters that speficy a general linear decision bound. The list should contain \code{noise}, \code{coeffs}, \code{bias}.}
\item{zlimit}{numeric. The z-scores (or discriminant scores) beyond the speficied value will be truncated and replaced with that value. Default to \code{Inf}}
\item{type}{a character string specifying the type of d' to be returned. If \code{SampleIdeal}, d' is calculated based on ideal (or true) category membership as specified in \code{category}. If \code{Observer}, d' is calculated using the \code{response} vector as a grouping factor.}
\item{means}{a list of numeric vectors containing the means of two distributions}
\item{covs}{a matrix or a list of matrices containig the variance-covariance matrix of the two discributions}
\item{noise}{numeric. perceptual and criterial noise expressed as standard diviation. Default to \code{NULL}}
}
\details{
The function \code{dprime} estimate d' from sample data sets, whereas the function \code{dprimef} calculate it from population parameters.

In \code{dprime}, if any parts of the argument \code{par} is missing, the function will easimate an optimal linear decision bound from supplied \code{x} and \code{category}. The arguemnt \code{response} is not used if \code{type} is \code{SampleIdeal}.
}
\author{
Author of the original Matlab routines: Leola Alfonso-Reese

Author of R adaptation: Kazunaga Matsuki
}
\references{
  Alfonso-Reese, L. A. (2006)
  \emph{General recognition theory of categorization: A MATLAB toolbox}.
  Behavior Research Methods, 38, 579-583.
}
\examples{
data(subjdemo_2d)
d2 <- subjdemo_2d
db <- glcStruct(noise=10, coeffs=c(0.514,-0.857),bias=-0.000154)
dprime(d2[,2:3], d2$category, d2$response, par = db, zlimit=7, type='SampleIdeal')

mc <- mcovs(category ~ x + y, data=d2)
dprimef(mc$means, mc$covs)
}
\keyword{misc}
