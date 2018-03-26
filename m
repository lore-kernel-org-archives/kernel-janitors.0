From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Mar 2018 16:07:35 +0000
Subject: Re: [bug report] tracing: Factorize filter creation
Message-Id: <20180326160735.3fsg6hwrffrvek3k@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323084612.GA23928@mwanda>
In-Reply-To: <20180323084612.GA23928@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Mar 26, 2018 at 07:32:26AM -0700, Tejun Heo wrote:
> On Fri, Mar 23, 2018 at 11:46:12AM +0300, Dan Carpenter wrote:
> > Hello Tejun Heo,
> > 
> > The patch 38b78eb85540: "tracing: Factorize filter creation" from Dec
> > 15, 2011, leads to the following static checker warning:
> > 
> > 	kernel/trace/trace_events_filter.c:1794 apply_event_filter()
> > 	error: uninitialized symbol 'filter'.
> > 
> > kernel/trace/trace_events_filter.c
> >   1764  int apply_event_filter(struct trace_event_file *file, char *filter_string)
> ...
> >   1785  
> >   1786          err = create_filter(call, filter_string, true, &filter);
> >                                                                ^^^^^^^
> >   1787  
> >   1788          /*
> >   1789           * Always swap the call filter with the new filter
> >   1790           * even if there was an error. If there was an error
> >   1791           * in the filter, we disable the filter and show the error
> >   1792           * string
> >   1793           */
> >   1794          if (filter) {
> >                     ^^^^^^
> > I guess the fix is probably to set filter to NULL in create_filter()?
> 
> @filterp is the outparam and create_filter() always sets it, so the
> code doesn't look wrong to me.

It's not set if create_filter_start() fails at the start of
create_filter().  I'm looking at today's linux-next.

  1686  /**
  1687   * create_filter - create a filter for a trace_event_call
  1688   * @call: trace_event_call to create a filter for
  1689   * @filter_str: filter string
  1690   * @set_str: remember @filter_str and enable detailed error in filter
  1691   * @filterp: out param for created filter (always updated on return)
                                                   ^^^^^^^^^^^^^^^^^^^^^^^^
Ah...  You're right about the comment.

  1692   *
  1693   * Creates a filter for @call with @filter_str.  If @set_str is %true,
  1694   * @filter_str is copied and recorded in the new filter.
  1695   *
  1696   * On success, returns 0 and *@filterp points to the new filter.  On
  1697   * failure, returns -errno and *@filterp may point to %NULL or to a new
  1698   * filter.  In the latter case, the returned filter contains error
  1699   * information if @set_str is %true and the caller is responsible for
  1700   * freeing it.
  1701   */
  1702  static int create_filter(struct trace_event_call *call,
  1703                           char *filter_string, bool set_str,
  1704                           struct event_filter **filterp)
  1705  {
  1706          struct filter_parse_error *pe = NULL;
  1707          struct event_filter *filter = NULL;
  1708          int err;
  1709  
  1710          err = create_filter_start(filter_string, set_str, &pe, &filter);
  1711          if (err)
  1712                  return err;
                        ^^^^^^^^^^
But it's not set here.

  1713  
  1714          err = process_preds(call, filter_string, filter, pe);
  1715          if (err && set_str)
  1716                  append_filter_err(pe, filter);
  1717  
  1718          *filterp = filter;
  1719          return err;
  1720  }

regards,
dan carpenter
