From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2018 08:46:12 +0000
Subject: [bug report] tracing: Factorize filter creation
Message-Id: <20180323084612.GA23928@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tejun Heo,

The patch 38b78eb85540: "tracing: Factorize filter creation" from Dec
15, 2011, leads to the following static checker warning:

	kernel/trace/trace_events_filter.c:1794 apply_event_filter()
	error: uninitialized symbol 'filter'.

kernel/trace/trace_events_filter.c
  1764  int apply_event_filter(struct trace_event_file *file, char *filter_string)
  1765  {
  1766          struct trace_event_call *call = file->event_call;
  1767          struct event_filter *filter;
                                    ^^^^^^^
  1768          int err;
  1769  
  1770          if (!strcmp(strstrip(filter_string), "0")) {
  1771                  filter_disable(file);
  1772                  filter = event_filter(file);
  1773  
  1774                  if (!filter)
  1775                          return 0;
  1776  
  1777                  event_clear_filter(file);
  1778  
  1779                  /* Make sure the filter is not being used */
  1780                  synchronize_sched();
  1781                  __free_filter(filter);
  1782  
  1783                  return 0;
  1784          }
  1785  
  1786          err = create_filter(call, filter_string, true, &filter);
                                                               ^^^^^^^
  1787  
  1788          /*
  1789           * Always swap the call filter with the new filter
  1790           * even if there was an error. If there was an error
  1791           * in the filter, we disable the filter and show the error
  1792           * string
  1793           */
  1794          if (filter) {
                    ^^^^^^
I guess the fix is probably to set filter to NULL in create_filter()?

  1795                  struct event_filter *tmp;
  1796  
  1797                  tmp = event_filter(file);
  1798                  if (!err)
  1799                          event_set_filtered_flag(file);
  1800                  else
  1801                          filter_disable(file);
  1802  
  1803                  event_set_filter(file, filter);
  1804  
  1805                  if (tmp) {
  1806                          /* Make sure the call is done with the filter */
  1807                          synchronize_sched();

regards,
dan carpenter
