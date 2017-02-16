From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Feb 2017 11:53:07 +0000
Subject: Re: [patch] drm/msm/dsi: free first element on error
Message-Id: <20170216115307.GD4108@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170216105042.GA25544@mwanda>
 <87a89mnznw.fsf@intel.com>
In-Reply-To: <87a89mnznw.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

On Thu, Feb 16, 2017 at 01:27:47PM +0200, Jani Nikula wrote:
> On Thu, 16 Feb 2017, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > We want to free msm_host->bus_clks[0] so the > should be >=.
> >
> > Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 1fc07ce24686..239e79b39a45 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -437,7 +437,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
> >  
> >  	return 0;
> >  err:
> > -	for (; i > 0; i--)
> > +	for (; i >= 0; i--)
> >  		clk_disable_unprepare(msm_host->bus_clks[i]);
> 
> By the looks of it this is also wrong. I didn't look at the functions,
> but you probably don't want to unprepare something where prepare failed,
> i.e. you want to -1 both the start and end offsets. Perhaps the right
> fix is
> 
> 	while (i--)
> 		clk_disable_unprepare(msm_host->bus_clks[i]);
> 
> which also seems to be widely used on error paths.
> 

Ah yeah.  You're right.  I'll resend.

regards,
dan carpenter

