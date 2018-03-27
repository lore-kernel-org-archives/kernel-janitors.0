From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Mar 2018 14:25:20 +0000
Subject: Re: [bug report] tracing: Rewrite filter logic to be simpler and faster
Message-Id: <20180327142520.gippcw3oy2zw2kin@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180327073036.GA20734@mwanda>
In-Reply-To: <20180327073036.GA20734@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 27, 2018 at 09:59:16AM -0400, Steven Rostedt wrote:
> On Tue, 27 Mar 2018 10:30:36 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > Hello Steven Rostedt (VMware),
> > 
> > The patch 80765597bc58: "tracing: Rewrite filter logic to be simpler
> > and faster" from Mar 9, 2018, leads to the following static checker
> > warning:
> > 
> >     kernel/trace/trace_events_filter.c:1794 apply_event_filter()
> >     error: uninitialized symbol 'filter'.
> > 
> >     kernel/trace/trace_events_filter.c:2052 ftrace_profile_set_filter()
> >     error: uninitialized symbol 'filter'.
> > 
> > kernel/trace/trace_events_filter.c
> >   1686  /**
> >   1687   * create_filter - create a filter for a trace_event_call
> >   1688   * @call: trace_event_call to create a filter for
> >   1689   * @filter_str: filter string
> >   1690   * @set_str: remember @filter_str and enable detailed error in filter
> >   1691   * @filterp: out param for created filter (always updated on return)
> >             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > filterp is supposed to get updated.
> 
> Wow, your static analyzer reads comments?
>

At first I complained to Tejun by mistake and he was like, "read the
comments"...

regards,
dan carpenter

