From: Shawn Guo <shawn.guo@linaro.org>
Date: Wed, 19 Sep 2012 02:25:53 +0000
Subject: Re: [PATCH 4/4] drivers/mmc/host/mxs-mmc.c: fix error return code
Message-Id: <20120919022550.GA6145@S2100-06.ap.freescale.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347869728-2696-1-git-send-email-peter.senna@gmail.com>
 <1347869728-2696-4-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347869728-2696-4-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: cjb@laptop.org, marex@denx.de, broonie@opensource.wolfsonmicro.com, vinod.koul@linux.intel.com, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 17, 2012 at 10:15:28AM +0200, Peter Senna Tschudin wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
> // </smpl>
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

> ---
>  drivers/mmc/host/mxs-mmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> index 80d1e6d..afd8fdd 100644
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -674,6 +674,7 @@ static int mxs_mmc_probe(struct platform_device *pdev)
>  	if (!ssp->dmach) {
>  		dev_err(mmc_dev(host->mmc),
>  			"%s: failed to request dma\n", __func__);
> +		ret = -ENODEV;
>  		goto out_clk_put;
>  	}
>  
> -- 
> 1.7.11.4
> 

