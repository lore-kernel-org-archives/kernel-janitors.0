From: Marc Dietrich <marvin24@gmx.de>
Date: Fri, 20 Apr 2018 08:45:42 +0000
Subject: Re: [PATCH 49/61] staging: nvec: simplify getting .drvdata
Message-Id: <1534139.KRlJX3jJQi@ax5200p>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com> <20180419140641.27926-50-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-50-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org

Am Donnerstag, 19. April 2018, 16:06:19 CEST schrieb Wolfram Sang:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Marc Dietrich <marvin24@gmx.de>

> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/staging/nvec/nvec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 52054a528723..2a5e0dcf4162 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -925,8 +925,7 @@ static int tegra_nvec_remove(struct platform_device
> *pdev) static int nvec_suspend(struct device *dev)
>  {
>  	int err;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct nvec_chip *nvec = platform_get_drvdata(pdev);
> +	struct nvec_chip *nvec = dev_get_drvdata(dev);
>  	struct nvec_msg *msg;
>  	char ap_suspend[] = { NVEC_SLEEP, AP_SUSPEND };
> 
> @@ -946,8 +945,7 @@ static int nvec_suspend(struct device *dev)
> 
>  static int nvec_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct nvec_chip *nvec = platform_get_drvdata(pdev);
> +	struct nvec_chip *nvec = dev_get_drvdata(dev);
> 
>  	dev_dbg(nvec->dev, "resuming\n");
>  	tegra_init_i2c_slave(nvec);




