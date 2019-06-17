From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 17 Jun 2019 19:27:19 +0000
Subject: Re: [PATCH] coresight: potential uninitialized variable in probe()
Message-Id: <CANLsYkxnze-aJXwr6ogR_AjcXefjufgOnwgqnX0vVtkzkzAsVw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065815.GF16334@mwanda>
In-Reply-To: <20190613065815.GF16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leo Yan <leo.yan@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Thu, 13 Jun 2019 at 00:59, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "drvdata->atclk" clock is optional, but if it gets set to an error
> pointer then we're accidentally return an uninitialized variable instead
> of success.
>
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
>         }
>
>         pm_runtime_put(dev);
> +       ret = 0;

Applied - thanks.

>
>  out_disable_clk:
>         if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
> --
> 2.20.1
>
