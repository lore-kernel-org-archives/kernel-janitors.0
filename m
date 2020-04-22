From: Han Xu <han.xu@nxp.com>
Date: Wed, 22 Apr 2020 05:42:35 +0000
Subject: RE: [PATCH -next v2] spi: spi-fsl-qspi: Fix return value check of devm_ioremap() in probe
Message-Id: <AM6PR0402MB37012FFCC4DC632FC3536BD597D20@AM6PR0402MB3701.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421093908.48213-1-weiyongjun1@huawei.com>
 <20200422014543.111070-1-weiyongjun1@huawei.com>
In-Reply-To: <20200422014543.111070-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Mark Brown <broonie@kernel.org>, Ashish Kumar <ashish.kumar@nxp.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



> -----Original Message-----
> From: Wei Yongjun <weiyongjun1@huawei.com>
> Sent: Tuesday, April 21, 2020 8:46 PM
> To: Han Xu <han.xu@nxp.com>; Mark Brown <broonie@kernel.org>; Ashish
> Kumar <ashish.kumar@nxp.com>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-spi@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH -next v2] spi: spi-fsl-qspi: Fix return value check of
> devm_ioremap() in probe
> 
> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be replaced with
> NULL test.
> 
> Fixes: 858e26a515c2 ("spi: spi-fsl-qspi: Reduce devm_ioremap size to 4 times AHB
> buffer size")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Ashish Kumar <Ashish.Kumar@nxp.com>

Acked-by: Han Xu <han.xu@nxp.com>

> ---
> v1 -> v2: fix the subject as Ashish's suggest
> ---
>  drivers/spi/spi-fsl-qspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c index
> 83eb8a484faf..6766262d7e75 100644
> --- a/drivers/spi/spi-fsl-qspi.c
> +++ b/drivers/spi/spi-fsl-qspi.c
> @@ -880,8 +880,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	/* Since there are 4 cs, map size required is 4 times ahb_buf_size */
>  	q->ahb_addr = devm_ioremap(dev, q->memmap_phy,
>  				   (q->devtype_data->ahb_buf_size * 4));
> -	if (IS_ERR(q->ahb_addr)) {
> -		ret = PTR_ERR(q->ahb_addr);
> +	if (!q->ahb_addr) {
> +		ret = -ENOMEM;
>  		goto err_put_ctrl;
>  	}
> 
> 
