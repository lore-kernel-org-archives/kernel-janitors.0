From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 May 2016 21:05:05 +0000
Subject: Re: perf/core: Introduce address range filtering
Message-Id: <20160530210505.GX11011@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160510103827.GA28299@mwanda>
In-Reply-To: <20160510103827.GA28299@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I was looking through old warnings and this is still present in current
linux-next.

regards,
dan carpenter

On Tue, May 10, 2016 at 01:38:27PM +0300, Dan Carpenter wrote:
> Hello Alexander Shishkin,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 375637bc5249: "perf/core: Introduce address range 
> filtering" from Apr 27, 2016, leads to the following Smatch complaint:
> 
> kernel/events/core.c:3865 _free_event()
> 	 warn: variable dereferenced before check 'event->pmu' (see line 3856)
> 
> kernel/events/core.c
>   3855		perf_event_free_bpf_prog(event);
>   3856		perf_addr_filters_splice(event, NULL);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> New code adds an unchecked "event->pmu" dereference inside function.
> 
>   3857		kfree(event->addr_filters_offs);
>   3858	
>   3859		if (event->destroy)
>   3860			event->destroy(event);
>   3861	
>   3862		if (event->ctx)
>   3863			put_ctx(event->ctx);
>   3864	
>   3865		if (event->pmu) {
>                     ^^^^^^^^^^
> Existing code assumes this can be NULL.
> 
>   3866			exclusive_event_destroy(event);
>   3867			module_put(event->pmu->module);
> 
> regards,
> dan carpenter
