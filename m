From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Sun, 05 Apr 2020 23:51:29 +0000
Subject: Re: [PATCH] PM / devfreq: tegra30: Delete an error message in tegra_devfreq_probe()
Message-Id: <924a6012-985e-b22d-6f85-e9eb3f03e88b@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200404184602epcas1p1e0188779ade7c393f9e37a4757e1b6cc@epcas1p1.samsung.com>
        <ba67e238-43a7-6c53-363e-7a2c12f09949@web.de>
In-Reply-To: <ba67e238-43a7-6c53-363e-7a2c12f09949@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

On 4/5/20 3:45 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 4 Apr 2020 20:34:02 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 28b2c7ca416e..93e6f4b25b04 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -807,10 +807,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
> 
>  	err = platform_get_irq(pdev, 0);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", err);
> +	if (err < 0)
>  		return err;
> -	}
> +
>  	tegra->irq = err;
> 
>  	irq_set_status_flags(tegra->irq, IRQ_NOAUTOEN);
> --
> 2.26.0
> 
> 
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
