From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 16 Feb 2017 11:27:47 +0000
Subject: Re: [patch] drm/msm/dsi: free first element on error
Message-Id: <87a89mnznw.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170216105042.GA25544@mwanda>
In-Reply-To: <20170216105042.GA25544@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark <robdclark@gmail.com>, Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Thu, 16 Feb 2017, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We want to free msm_host->bus_clks[0] so the > should be >=.
>
> Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 1fc07ce24686..239e79b39a45 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -437,7 +437,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>  
>  	return 0;
>  err:
> -	for (; i > 0; i--)
> +	for (; i >= 0; i--)
>  		clk_disable_unprepare(msm_host->bus_clks[i]);

By the looks of it this is also wrong. I didn't look at the functions,
but you probably don't want to unprepare something where prepare failed,
i.e. you want to -1 both the start and end offsets. Perhaps the right
fix is

	while (i--)
		clk_disable_unprepare(msm_host->bus_clks[i]);

which also seems to be widely used on error paths.

BR,
Jani.


>  
>  	return ret;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
