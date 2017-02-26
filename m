From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 26 Feb 2017 20:52:10 +0000
Subject: Re: [patch v2] drm/msm/dsi: free first element on error
Message-Id: <20170226205210.nalhhhxmosn4ndci@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87a89mnznw.fsf@intel.com>
 <20170216120028.GA29698@mwanda>
 <CAF6AEGuaYjRQCpLxade_Htm6tS8Zvy6JQG8dRt973C-aaPCP5g@mail.gmail.com>
 <871suynwwz.fsf@intel.com>
In-Reply-To: <871suynwwz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, kernel-janitors@vger.kernel.org, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, freedreno@lists.freedesktop.org

On Thu, Feb 16, 2017 at 02:27:08PM +0200, Jani Nikula wrote:
> On Thu, 16 Feb 2017, Rob Clark <robdclark@gmail.com> wrote:
> > On Thu, Feb 16, 2017 at 7:00 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >> We're off by one here.  We free something that wasn't allocated and we
> >> don't free msm_host->bus_clks[].
> >>
> >> Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks
> >
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
> And for good measure,
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

So 2 r-b from maintainers, no one said he'll apply. This isn't really
great coordination :-) Note that drm-misc-next is always open, so you
could always smash it in there, irrespective of merge window state. hint,
hint ...
-Daniel

> 
> 
> >
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 1fc07ce24686..4fa32296162e 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -437,7 +437,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
> >>
> >>         return 0;
> >>  err:
> >> -       for (; i > 0; i--)
> >> +       while (i--)
> >>                 clk_disable_unprepare(msm_host->bus_clks[i]);
> >>
> >>         return ret;
> 
> -- 
> Jani Nikula, Intel Open Source Technology Center
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
