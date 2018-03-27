From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Mar 2018 07:30:36 +0000
Subject: [bug report] tracing: Rewrite filter logic to be simpler and faster
Message-Id: <20180327073036.GA20734@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Steven Rostedt (VMware),

The patch 80765597bc58: "tracing: Rewrite filter logic to be simpler
and faster" from Mar 9, 2018, leads to the following static checker
warning:

    kernel/trace/trace_events_filter.c:1794 apply_event_filter()
    error: uninitialized symbol 'filter'.

    kernel/trace/trace_events_filter.c:2052 ftrace_profile_set_filter()
    error: uninitialized symbol 'filter'.

kernel/trace/trace_events_filter.c
  1686  /**
  1687   * create_filter - create a filter for a trace_event_call
  1688   * @call: trace_event_call to create a filter for
  1689   * @filter_str: filter string
  1690   * @set_str: remember @filter_str and enable detailed error in filter
  1691   * @filterp: out param for created filter (always updated on return)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
filterp is supposed to get updated.

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
                        ^^^^^^^^^^^
But it's not on this new error path.

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
