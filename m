From: Leo Yan <leo.yan@linaro.org>
Date: Thu, 13 Jun 2019 07:49:22 +0000
Subject: Re: [PATCH] coresight: potential uninitialized variable in probe()
Message-Id: <20190613074922.GB21113@leoy-ThinkPad-X240s>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065815.GF16334@mwanda>
In-Reply-To: <20190613065815.GF16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Dan,

On Wed, Jun 12, 2019 at 11:58:15PM -0700, Dan Carpenter wrote:
> The "drvdata->atclk" clock is optional, but if it gets set to an error
> pointer then we're accidentally return an uninitialized variable instead
> of success.

You are right, thanks a lot for pointing out.

I'd like to initialize 'ret = 0' at the head of function, so we can
has the same fashion with other CoreSight drivers (e.g. replicator).

 static int funnel_probe(struct device *dev, struct resource *res)
 {
-	int ret;
+	int ret = 0;

If you agree, could you send a new patch for this?

Thanks,
Leo Yan

> Fixes: 78e6427b4e7b ("coresight: funnel: Support static funnel")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/hwtracing/coresight/coresight-funnel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 5867fcb4503b..fa97cb9ab4f9 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -244,6 +244,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	}
>  
>  	pm_runtime_put(dev);
> +	ret = 0;
>  
>  out_disable_clk:
>  	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
> -- 
> 2.20.1
> 
