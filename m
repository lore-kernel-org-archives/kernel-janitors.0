From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Apr 2015 17:50:14 +0000
Subject: Re: [patch] thermal: rockchip: fix an error code
Message-Id: <CAD=FV=VT5v_X=yXKF+WooFpHy=9=x6jVMp3RKhVGfrP1e_S81w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150421093410.GE12098@mwanda>
In-Reply-To: <20150421093410.GE12098@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Caesar Wang <caesar.wang@rock-chips.com>, Eduardo Valentin <edubezval@gmail.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, kernel-janitors@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

Dan,

On Tue, Apr 21, 2015 at 2:34 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> There is a copy and paste bug, "->clk" vs "->pclk", so we return the
> wrong error code here.
>
> Fixes: cbac8f639437 ('thermal: rockchip: add driver for thermal')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index 3aa46ac..cd8f5f93 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -529,7 +529,7 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
>
>         thermal->pclk = devm_clk_get(&pdev->dev, "apb_pclk");
>         if (IS_ERR(thermal->pclk)) {
> -               error = PTR_ERR(thermal->clk);
> +               error = PTR_ERR(thermal->pclk);
>                 dev_err(&pdev->dev, "failed to get apb_pclk clock: %d\n",
>                         error);
>                 return error;

Thanks!  :)  An obvious fix, but just in case it helps feel free to add:

Reviewed-by: Doug Anderson <dianders@chromium.org>
