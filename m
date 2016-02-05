From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Date: Fri, 05 Feb 2016 01:58:43 +0000
Subject: Re: [patch] extcon: use correct size
Message-Id: <CAJKOXPdLMM2oGprjUfktkgga8XaE2D=QKUpbT-RRTznoJUpXeQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160204113609.GA11239@mwanda>
In-Reply-To: <20160204113609.GA11239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Jaewon Kim <jaewon02.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2016-02-04 20:36 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
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
>         /* Clear IRQ bits before request IRQs */
>         ret = regmap_bulk_read(max77843->regmap_muic,
>                         MAX77843_MUIC_REG_INT1, info->status,
> -                       MAX77843_MUIC_IRQ_NUM);
> +                       MAX77843_MUIC_STATUS_NUM);
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to Clear IRQ bits\n");
>                 goto err_muic_irq;

Looks correct. Issue came from our internal tree where
MAX77843_MUIC_IRQ_NUM is redefined to a value of 3.

However the subject should be fixed to match the subsystem and more
accurately describe the error.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
