From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Thu, 20 Dec 2018 10:45:50 +0000
Subject: Re: [PATCH -next] regulator: act8945a-regulator: make symbol act8945a_pm static
Message-Id: <20181220114550.782cdddc@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545117021-178814-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545117021-178814-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 18 Dec 2018 07:10:21 +0000
Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fixes the following sparse warning:
> 
> drivers/regulator/act8945a-regulator.c:340:1: warning:
>  symbol 'act8945a_pm' was not declared. Should it be static?
> 
> Fixes: 7482d6ecc68e ("regulator: act8945a-regulator: Implement PM functionalities")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/regulator/act8945a-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/act8945a-regulator.c b/drivers/regulator/act8945a-regulator.c
> index 90572b6..dc3942b 100644
> --- a/drivers/regulator/act8945a-regulator.c
> +++ b/drivers/regulator/act8945a-regulator.c
> @@ -337,7 +337,7 @@ static int act8945a_suspend(struct device *pdev)
>  	return regmap_write(act8945a->regmap, ACT8945A_SYS_CTRL, 0x42);
>  }
>  
> -SIMPLE_DEV_PM_OPS(act8945a_pm, act8945a_suspend, NULL);
> +static SIMPLE_DEV_PM_OPS(act8945a_pm, act8945a_suspend, NULL);
>  
>  static void act8945a_pmic_shutdown(struct platform_device *pdev)
>  {
> 
> 
> 
