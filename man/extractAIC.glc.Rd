% File grt/man/extractAIC.Rd
\name{extractAIC}
\alias{extractAIC.glc}
\alias{extractAIC.gqc}
\title{extractAIC method for class 'glc' and 'gqc'}
\description{Extract Akaike's An Information Criteria from a General Linear or Quadratic Classifier}
\usage{
\method{extractAIC}{glc}(fit, scale, k = 2, \dots)

\method{extractAIC}{gqc}(fit, scale, k = 2, \dots)
}
\arguments{
  \item{fit}{object of class \code{glc} or \code{gqc}}
  \item{scale}{unused argument}
 \item{k}{numeric specifying the penalty per parameter to be used in calculating AIC. Default to 2.}
 \item{\dots}{further arguments (currently not used).}
}
\details{
As with the default method, the criterion used is
  \deqn{AIC = - 2\log L +  k \times \mbox{df},}{AIC = - 2*log L +  k * df,}
  where \eqn{L} is the likelihood and \eqn{df} is the degrees
  of freedom (i.e., the number of free parameters) of \code{fit}.
}
\value{
  A numeric vector of length 2 including:
  \item{df}{the degrees of freedom for the fitted model \code{fit}.}
  \item{AIC}{the Akaike's Information Criterion for \code{fit}.}
}
\examples{
data(subjdemo_2d)
#fit a 2d suboptimal model
fit.2dl <- glc(response ~ x + y, data=subjdemo_2d, 
    category=subjdemo_2d$category, zlimit=7)
extractAIC(fit.2dl)
}
\keyword{models}