From: Caesar Wang <wxt@rock-chips.com>
Date: Wed, 22 Apr 2015 03:07:44 +0000
Subject: Re: [patch] thermal: rockchip: fix an error code
Message-Id: <55371080.4090307@rock-chips.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150421093410.GE12098@mwanda>
In-Reply-To: <20150421093410.GE12098@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Zhang Rui <rui.zhang@intel.com>, Caesar Wang <caesar.wang@rock-chips.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Heiko Stuebner <heiko@sntech.de>, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org



在 2015年04月21日 17:34, Dan Carpenter 写道:
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
>   	thermal->pclk = devm_clk_get(&pdev->dev, "apb_pclk");
>   	if (IS_ERR(thermal->pclk)) {
> -		error = PTR_ERR(thermal->clk);
> +		error = PTR_ERR(thermal->pclk);
Yeah, you are right.
Reviewed-by: Caesar Wang <wxt@rock-chips.com>

Thanks.

Caesar
>   		dev_err(&pdev->dev, "failed to get apb_pclk clock: %d\n",
>   			error);
>   		return error;
>
>
>

-- 
**************************************************************************************
王晓腾    Caesar Wang
Product R&D Dept.III
Fuzhou Rockchip Electronics Co.Ltd
Addr：  NO.18 Building, A District, Fuzhou Software Park,Gulou District,Fuzhou, Fujian,China(Fuzhou Headquarters)
               21F,Malata Building,Kejizhongyi Avenue,Nanshan District,Shenzhen  (Shenzhen Office)
Tel：+86-591-83991906/07 - 8221
Mobile:+86 15059456742
E-mail : wxt@rock-chips.com
***************************************************************************************
***************************************************************************************
IMPORTANT NOTICE: This email is from Fuzhou Rockchip Electronics Co., Ltd .The contents of this email and any attachments may
contain information that is privileged, confidential and/or exempt from disclosure under applicable law and relevant NDA.
If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution, or use of the
information is STRICTLY PROHIBITED. Please immediately contact the sender as soon as possible and destroy the material
in its entirety in any format. Thank you.
***************************************************************************************


