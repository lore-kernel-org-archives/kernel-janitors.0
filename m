From: "Andrew Jeffery" <andrew@aj.id.au>
Date: Mon, 26 Aug 2019 23:52:37 +0000
Subject: =?UTF-8?Q?Re:_[PATCH_-next]_mmc:_aspeed:_Fix_return_value_check_in_aspee?= =?UTF-8?Q?d=5Fsdc=5Fprobe
Message-Id: <e23e0193-51c8-41a2-95f7-d48f0ef00eb5@www.fastmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190826120013.183435-1-weiyongjun1@huawei.com>
In-Reply-To: <20190826120013.183435-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: kernel-janitors@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org



On Mon, 26 Aug 2019, at 21:27, Wei Yongjun wrote:
> In case of error, the function of_platform_device_create() returns
> NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
> 
> Fixes: 09eed7fffd33 ("mmc: Add support for the ASPEED SD controller")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> b/drivers/mmc/host/sdhci-of-aspeed.c
> index 8bb095ca2fa9..d5acb5afc50f 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -261,9 +261,9 @@ static int aspeed_sdc_probe(struct platform_device 
> *pdev)
>  		struct platform_device *cpdev;
>  
>  		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
> -		if (IS_ERR(cpdev)) {
> +		if (!cpdev) {
>  			of_node_put(child);
> -			ret = PTR_ERR(cpdev);
> +			ret = -ENODEV;
>  			goto err_clk;
>  		}
>  	}

I ... have no idea why I wrote it that way. I must have just assumed it returned
an ERR_PTR(). Thanks for finding/fixing that.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
