From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2018 08:49:32 +0000
Subject: Re: [bug report] tracing: Factorize filter creation
Message-Id: <20180323084932.myn2dy2hodsyesul@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323084612.GA23928@mwanda>
In-Reply-To: <20180323084612.GA23928@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hm...  No.  I get a second warning:

kernel/trace/trace_events_filter.c:2052 ftrace_profile_set_filter()
error: uninitialized symbol 'filter'.

kernel/trace/trace_events_filter.c
  2036  
  2037          err = -EEXIST;
  2038          if (event->filter)
  2039                  goto out_unlock;
  2040  
  2041          err = create_filter(call, filter_str, false, &filter);
  2042          if (err)
  2043                  goto free_filter;
                             ^^^^^^^^^^^
filter is uninitialized.  What are we supposed to be freeing?

  2044  
  2045          if (ftrace_event_is_function(call))
  2046                  err = ftrace_function_set_filter(event, filter);
  2047          else
  2048                  event->filter = filter;
  2049  
  2050  free_filter:
  2051          if (err || ftrace_event_is_function(call))
  2052                  __free_filter(filter);
  2053  
  2054  out_unlock:
  2055          mutex_unlock(&event_mutex);
  2056  
  2057          return err;
  2058  }

regards,
dan carpenter
