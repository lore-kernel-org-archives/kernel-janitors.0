From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Apr 2015 10:27:09 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150415102708.GA16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 15, 2015 at 01:10:17PM +0300, Alexander Shishkin wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > That's not the style that the rest of this file uses.  Every function
> > uses direct returns where possible except pt_event_add() and that
> > function seems buggy.
> 
> Indeed.
> 
> > arch/x86/kernel/cpu/perf_event_intel_pt.c
> >   1000  
> >   1001          if (mode & PERF_EF_START) {
> >   1002                  pt_event_start(event, 0);
> >   1003                  if (hwc->state = PERF_HES_STOPPED) {
> >   1004                          pt_event_del(event, 0);
> >   1005                          ret = -EBUSY;
> >                                 ^^^^^^^^^^^^
> > We set "ret" here but then return zero.
> >
> >   1006                  }
> >   1007          } else {
> >   1008                  hwc->state = PERF_HES_STOPPED;
> >                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Shouldn't we set "ret" here?
> 
> No, or we'll end up returning -EBUSY where we should return zero for
> snapshot counters. It can be done above the quoted if statement.
> 
> How does the following look to you?
> 

Are you sure you want to know??  :P

> @@ -1140,9 +1142,7 @@ static int pt_event_add(struct perf_event *event, int mode)
>  		hwc->state = PERF_HES_STOPPED;
>  	}
>  
> -	ret = 0;
> -out:
> -
> +out_stop:
>  	if (ret)
>  		hwc->state = PERF_HES_STOPPED;

Of course, I would prefer:

	return 0;

out_stop:
	hwc->state = PERF_HES_STOPPED;

	return ret;

But your version is also fine.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

