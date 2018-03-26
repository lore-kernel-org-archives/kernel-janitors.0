From: Tejun Heo <tj@kernel.org>
Date: Mon, 26 Mar 2018 14:36:47 +0000
Subject: Re: [bug report] tracing: Factorize filter creation
Message-Id: <20180326143647.GA1840639@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323084612.GA23928@mwanda>
In-Reply-To: <20180323084612.GA23928@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hey, Dan.

On Fri, Mar 23, 2018 at 11:49:32AM +0300, Dan Carpenter wrote:
> Hm...  No.  I get a second warning:
> 
> kernel/trace/trace_events_filter.c:2052 ftrace_profile_set_filter()
> error: uninitialized symbol 'filter'.
> 
> kernel/trace/trace_events_filter.c
>   2036  
>   2037          err = -EEXIST;
>   2038          if (event->filter)
>   2039                  goto out_unlock;
>   2040  
>   2041          err = create_filter(call, filter_str, false, &filter);
>   2042          if (err)
>   2043                  goto free_filter;
>                              ^^^^^^^^^^^
> filter is uninitialized.  What are we supposed to be freeing?
> 
>   2044  
>   2045          if (ftrace_event_is_function(call))
>   2046                  err = ftrace_function_set_filter(event, filter);
>   2047          else
>   2048                  event->filter = filter;
>   2049  
>   2050  free_filter:
>   2051          if (err || ftrace_event_is_function(call))
>   2052                  __free_filter(filter);

This does look suspicious but __free_filter() checks for NULL input
and please take a look at the following comment from create_filter().

 * On success, returns 0 and *@filterp points to the new filter.  On
 * failure, returns -errno and *@filterp may point to %NULL or to a new
 * filter.  In the latter case, the returned filter contains error
 * information if @set_str is %true and the caller is responsible for
 * freeing it.

It looks like the function could return !NULL filter w/ error.  Kinda
confusing but the code doesn't look wrong.

Thanks.

-- 
tejun
