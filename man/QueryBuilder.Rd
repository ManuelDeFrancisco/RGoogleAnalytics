% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/QueryBuilder.R
\name{QueryBuilder}
\alias{QueryBuilder}
\title{Initialize a QueryBuilder object with the given parameters and perform validation}
\usage{
QueryBuilder(query.params.list)
}
\arguments{
\item{query.params.list}{List of all the Query Parameters. See \code{\link{Init}} for the
entire list}

\item{start.date.param}{Optional. A start date of the form "YYYY-MM-DD"
                     as a string. If NULL is used, the start.date
                     parameter will be unset. If no parameter is
                     specified, the current start.date value is
                     returned.

 @return None The start.date value if start.date.param is not set.
 Un-set the parameter if the value NULL is used.
Sets the end date.
Optional.
All Analytics feed requests must specify a beginning and ending date
range. If you do not indicate start- and end-date values for the
request, the server returns a request error.
Date values are in the form YYYY-MM-DD.
The earliest valid start-date is 2005-01-01. There is no upper limit
restriction for a start-date. However, setting a start-date that is
too far in the future will most likely return empty results.}

\item{metrics.param}{A vector of up to 10 metrics, either as
a single string or a vector or strings. E.g.
"ga:sessions" or c("ga:sessions", "ga:bounces")
If NULL is used, the metrics parameter will be
unset. If no parameter is specified, the current
metrics value is returned.}

\item{segment}{An advanced segment definition to slice and dice your
Analytics data. If NULL is used, the segment parameter will be
unset. If no parameter is specified, the current segment value
is returned.}

\item{sort}{The sorting order for the data to be returned.
e.g. "ga:sessions" or c("ga:sessions", "-ga:browser")
If NULL is used, the sort parameter will be
unset. If no parameter is specified, the current sort value
is returned.}

\item{filters}{The filter string for the GA request.
e.g. "ga:medium==referral".
If NULL is used, the filters parameter will be unset.
If no parameter is specified, the current filters value
is returned.}

\item{max.results}{Maximum number of entries to include in the data feed.
If not specified we return the default of 1000.}

\item{start.index.param}{The starting point of pagination for results to be
 returned. If NULL is used, the start.index parameter
 will be unset. If no parameter is specified, the
current start.index value is returned.}

\item{table.id.param}{This value is the table ID of the profile,
e.g "ga:1234".
If NULL is used, the table.id parameter will
be unset. If no parameter is specified, the
current table.id value is returned.}

\item{Start}{Date}

\item{End}{Date}

\item{End}{Date}

\item{caching.dir}{String Direcotry where caching files are stored}

\item{caching}{Boolean Caching required?

 @return None}
}
\value{
The builder object to process the query parameters.

Sets the Query Parameters for the Query Builder Object and performs validation


Sets the start date.
Optional.
All Analytics feed requests must specify a beginning and ending date
range. If you do not indicate start- and end-date values for the
request, the server returns a request error.
Date values are in the form YYYY-MM-DD.
The earliest valid start-date is 2005-01-01. There is no upper limit
restriction for a start-date. However, setting a start-date that is
too  far in the future will most likely return empty results.

The metrics value if metrics.param is not set.
Sets the segments, see dxp:segment in the Account Feed Response section
in the GA literature online.
http://code.google.com/apis/analytics/docs/gdata/gdataDeveloperGuide.html

None The segment value if segment.param is not set.

Sets the sorting criteria.

None The sort value if sort.param is not set.

Sets the filters used.
Optional.
The filters query string parameter restricts the data returned from
your request to the Analytics servers. When you use the filters
parameter, you supply a dimension or metric you want to filter,
followed by the filter expression. For example, the following feed
query requests ga:pageviews and ga:browser from profile 12134, where
the ga:browser dimension starts with the string Firefox:

None The filters value if filters.param is not set.
Sets the maximum number of results to return.
Optional.
Maximum number of entries to include in this feed. You can use this in
combination with start-index to retrieve a subset of elements, or use
it alone to restrict the number of returned elements, starting with
the first.

If you do not use the max-results parameter in your query, your feed
returns the default maximum of 1000 entries.

The Analytics Data Export API returns a maximum of 10,000 entries per
request, no matter how many you ask for. It can also return fewer
entries than requested, if there aren't as many dimension segments as
you expect. For instance, there are fewer than 300 possible values for
ga:country, so when segmenting only by country, you can't get more
than 300 entries, even if you set max-results to a higher value.

None The max.results value if max.results.param is not set.

Sets the table id for a user.
Optional.

None The start.index value if start.index.param is not set.

Sets the table id for a user based on the profile ID entered by the user
Optional.
The unique table ID used to retrieve the Analytics Report data. 
We run a series of checks that the form of the data is
being correctly entered.

NOTE: This function does not test the table.id is valid from the account
      profile.

None The table.id value if table.id.param is not set.

Returns whether the Query has all the required parameters set. These are
the start.date, end.date, metrics, and table.id parameters.

TRUE if the query has all the required parameters. Otherwise stops the
  program execution.
A function to reset all the data values to NULL, for a new query.f
The ClearData() function allows a user to reset the query parameters,
(start.date, metrics, etc) back to NULL.

Resets all the query parameters to NULL.
Checks whether a valid authorization token exists.

None A stop call if the access_token is not valid or not present.

This function updates the start date in the query builder object

None Sets the Start Date 
This function updates the end date in the query builder object

None Sets the End Date 
This function updates the start index in the query builder object

None Sets the Start Index in the Query Builder Object 
Sets and creates caching directory.
If caching is required the caching directory is set up. Default directory ist "cache" in 
the current working directory.
}
\description{
Initialize a QueryBuilder object with the given parameters and perform validation
}
\seealso{
http://code.google.com/apis/analytics/docs/gdata/
       gdataReferenceDimensionsMetrics.html#validCombinations

NOTE: This method does not check for invalid dimensions or combinations.

 @param
   dimensions.param A vector of up to 7 dimensions, either as
                     a single string or a vector or strings, E.g.
                     "ga:source,ga:medium" or c("ga:source", "ga:medium")
                     If NULL is used, the dimensions parameter will be
                     unset. If no parameter is specified, the current
                     dimension value is returned.

 @return None The dimensions value if dimensions.param is not set.

Sets the metrics of interest (clicks, pageviews, etc)
Optional.
The aggregated statistics for user activity in a profile, such as
clicks or pageviews. When queried by alone, metrics provide aggregate
values for the requested date range, such as overall pageviews or
total bounces. However, when requested with dimensions, values are
segmented by the dimension. For example, ga:pageviews requested with
ga:country returns the total pageviews per country rather than the
total pageviews for the entire profile. When requesting metrics, keep
in mind:

Any request must supply at least one metric because a request cannot
consist only of dimensions.
You can supply a maximum of 10 metrics for any query.
Most combinations of metrics from multiple categories can be used
together, provided no dimensions are specified.
The exception to the above is the ga:visitors metric, which can only
be used in combination with a subset of metrics.
Any given metric can be used in combination with other dimensions or
metrics, but only where Valid Combinations apply for that metric.
Metric values are always reported as an aggregate because the Data
Export API does not provide calculated metrics. For a list of common
calculations based on aggregate metrics.

NOTE: We do check for valid metrics.
}
\keyword{'YYYY-MM-DD'}
\keyword{(-)}
\keyword{(1)}
\keyword{(2)}
\keyword{7}
\keyword{@param}
\keyword{@return}
\keyword{AND}
\keyword{API}
\keyword{Account}
\keyword{Advanced}
\keyword{An}
\keyword{Analytics}
\keyword{Any}
\keyword{Center.}
\keyword{Chrome,}
\keyword{Combinations}
\keyword{Dimensions/metrics}
\keyword{Dynamic}
\keyword{Example:}
\keyword{Except}
\keyword{Explorer,}
\keyword{Expressions}
\keyword{Feed}
\keyword{Firefox,}
\keyword{For}
\keyword{GA}
\keyword{Google}
\keyword{Help}
\keyword{ID}
\keyword{IDs,}
\keyword{If}
\keyword{In}
\keyword{Indicates}
\keyword{Internet}
\keyword{NOTE:}
\keyword{NULL}
\keyword{None}
\keyword{Note:}
\keyword{OR}
\keyword{Operators}
\keyword{Optional.}
\keyword{Response}
\keyword{Segmentation}
\keyword{Sets}
\keyword{Sort}
\keyword{The}
\keyword{This}
\keyword{Use}
\keyword{Valid}
\keyword{We}
\keyword{When}
\keyword{You}
\keyword{a}
\keyword{account}
\keyword{account.}
\keyword{advanced}
\keyword{again}
\keyword{all}
\keyword{alphabetical}
\keyword{also}
\keyword{an}
\keyword{and}
\keyword{and/or}
\keyword{another}
\keyword{any}
\keyword{apply}
\keyword{are}
\keyword{as}
\keyword{ascending}
\keyword{ask}
\keyword{at}
\keyword{aware}
\keyword{be}
\keyword{boolean}
\keyword{both}
\keyword{browser.}
\keyword{but}
\keyword{by}
\keyword{can}
\keyword{case,}
\keyword{changed}
\keyword{check}
\keyword{checks}
\keyword{combination}
\keyword{combinations}
\keyword{combine}
\keyword{comprised}
\keyword{constraints:}
\keyword{current}
\keyword{custom}
\keyword{data}
\keyword{data.}
\keyword{date}
\keyword{default}
\keyword{defined}
\keyword{defines}
\keyword{descending}
\keyword{difficult}
\keyword{dimension}
\keyword{dimension.}
\keyword{dimensions}
\keyword{dimensions.}
\keyword{dimensions:}
\keyword{direction}
\keyword{do}
\keyword{does}
\keyword{dxp:segment}
\keyword{dynamic}
\keyword{dynamic::ga:medium==referral}
\keyword{either}
\keyword{en-US}
\keyword{end}
\keyword{end.date}
\keyword{end.date.param}
\keyword{error.}
\keyword{errors}
\keyword{example,}
\keyword{except}
\keyword{expression}
\keyword{expressions}
\keyword{feed}
\keyword{fewer}
\keyword{field}
\keyword{field.}
\keyword{filter.}
\keyword{filters}
\keyword{first}
\keyword{follow}
\keyword{following}
\keyword{following:}
\keyword{for}
\keyword{for,}
\keyword{form}
\keyword{forth.}
\keyword{from}
\keyword{function}
\keyword{ga:browser}
\keyword{ga:city.}
\keyword{ga:pageviews}
\keyword{gaid::10}
\keyword{general}
\keyword{given}
\keyword{handler}
\keyword{have}
\keyword{if}
\keyword{in}
\keyword{indicate}
\keyword{indicated}
\keyword{information}
\keyword{interesting}
\keyword{internal}
\keyword{is}
\keyword{it}
\keyword{just}
\keyword{keep}
\keyword{keys}
\keyword{least}
\keyword{left}
\keyword{listed.}
\keyword{locale.}
\keyword{logic}
\keyword{logic,}
\keyword{maximum}
\keyword{may}
\keyword{method}
\keyword{metric}
\keyword{metric.}
\keyword{metrics}
\keyword{metrics,}
\keyword{metrics.}
\keyword{might}
\keyword{mind}
\keyword{minus}
\keyword{more}
\keyword{must}
\keyword{no}
\keyword{not}
\keyword{noted}
\keyword{number}
\keyword{numbers,}
\keyword{numeric}
\keyword{of}
\keyword{on}
\keyword{once}
\keyword{one}
\keyword{only}
\keyword{or}
\keyword{order}
\keyword{order.}
\keyword{other}
\keyword{pageviews}
\keyword{parameter}
\keyword{parameter,}
\keyword{parameter.}
\keyword{parameters}
\keyword{parameters.}
\keyword{prefix}
\keyword{primary}
\keyword{profile.}
\keyword{property}
\keyword{query}
\keyword{query,}
\keyword{query.}
\keyword{receive}
\keyword{regular}
\keyword{rely}
\keyword{report}
\keyword{report,}
\keyword{request}
\keyword{request,}
\keyword{request.}
\keyword{requested}
\keyword{restrictions.}
\keyword{returned}
\keyword{returned.}
\keyword{returns}
\keyword{right}
\keyword{rules}
\keyword{same}
\keyword{section.}
\keyword{see}
\keyword{segment}
\keyword{segment.}
\keyword{segmented}
\keyword{segments}
\keyword{segments,}
\keyword{send}
\keyword{set.}
\keyword{sign}
\keyword{site,}
\keyword{so}
\keyword{sort}
\keyword{sorted}
\keyword{sorting}
\keyword{sorts}
\keyword{specified,}
\keyword{string.}
\keyword{strings,}
\keyword{such}
\keyword{supply}
\keyword{table,}
\keyword{table.id}
\keyword{test}
\keyword{that}
\keyword{the}
\keyword{their}
\keyword{then}
\keyword{this}
\keyword{to}
\keyword{total}
\keyword{treats}
\keyword{two}
\keyword{unset.}
\keyword{use}
\keyword{used}
\keyword{used,}
\keyword{using}
\keyword{valid}
\keyword{value}
\keyword{ways:}
\keyword{we}
\keyword{web}
\keyword{well}
\keyword{where}
\keyword{while}
\keyword{will}
\keyword{with}
\keyword{would}
\keyword{write}
\keyword{you}
\keyword{you'll}
\keyword{your}
