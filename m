From: Tejun Heo <tj@kernel.org>
Date: Mon, 26 Mar 2018 14:32:26 +0000
Subject: Re: [bug report] tracing: Factorize filter creation
Message-Id: <20180326143226.GK2149215@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323084612.GA23928@mwanda>
In-Reply-To: <20180323084612.GA23928@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 23, 2018 at 11:46:12AM +0300, Dan Carpenter wrote:
> Hello Tejun Heo,
> 
> The patch 38b78eb85540: "tracing: Factorize filter creation" from Dec
> 15, 2011, leads to the following static checker warning:
> 
> 	kernel/trace/trace_events_filter.c:1794 apply_event_filter()
> 	error: uninitialized symbol 'filter'.
> 
> kernel/trace/trace_events_filter.c
>   1764  int apply_event_filter(struct trace_event_file *file, char *filter_string)
...
>   1785  
>   1786          err = create_filter(call, filter_string, true, &filter);
>                                                                ^^^^^^^
>   1787  
>   1788          /*
>   1789           * Always swap the call filter with the new filter
>   1790           * even if there was an error. If there was an error
>   1791           * in the filter, we disable the filter and show the error
>   1792           * string
>   1793           */
>   1794          if (filter) {
>                     ^^^^^^
> I guess the fix is probably to set filter to NULL in create_filter()?

@filterp is the outparam and create_filter() always sets it, so the
code doesn't look wrong to me.

Thanks.

-- 
tejun
