From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Fri, 05 Feb 2016 05:14:36 +0000
Subject: Re: [patch] extcon: use correct size
Message-Id: <56B42FBC.2090806@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160204113609.GA11239@mwanda>
In-Reply-To: <20160204113609.GA11239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Jaewon Kim <jaewon02.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 2016년 02월 04일 20:36, Dan Carpenter wrote:
> The info->status[] array has 3 elements.  We are using size
> MAX77843_MUIC_IRQ_NUM (16) instead of MAX77843_MUIC_STATUS_NUM (3) as
> intended.
> 
> Fixes: 135d9f7d135a ('extcon: max77843: Clear IRQ bits state before request IRQ')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis and *NOT TESTED*.  Please review carefully.
> 
> diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
> index 7bbc300..b188bd6 100644
> --- a/drivers/extcon/extcon-max77843.c
> +++ b/drivers/extcon/extcon-max77843.c
> @@ -806,7 +806,7 @@ static int max77843_muic_probe(struct platform_device *pdev)
>  	/* Clear IRQ bits before request IRQs */
>  	ret = regmap_bulk_read(max77843->regmap_muic,
>  			MAX77843_MUIC_REG_INT1, info->status,
> -			MAX77843_MUIC_IRQ_NUM);
> +			MAX77843_MUIC_STATUS_NUM);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to Clear IRQ bits\n");
>  		goto err_muic_irq;
> 
> 

The patch title should include the correct information
of specific device.

extcon: use correct size
-> extcon: max77843: Use correct size for reading the interrupt register

Applied it.

Thanks,
Chanwoo Choi
