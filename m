From: Caesar Wang <wxt@rock-chips.com>
Date: Tue, 28 Apr 2015 00:35:50 +0000
Subject: Re: [patch] thermal: rockchip: fix an error code
Message-Id: <553ED5E6.3090800@rock-chips.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150421093410.GE12098@mwanda> <55371080.4090307@rock-chips.com>
In-Reply-To: <55371080.4090307-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

Dan,

在 2015年04月22日 11:07, Caesar Wang 写道:
>
>
> 在 2015年04月21日 17:34, Dan Carpenter 写道:
>> There is a copy and paste bug, "->clk" vs "->pclk", so we return the
>> wrong error code here.
>>
>> Fixes: cbac8f639437 ('thermal: rockchip: add driver for thermal')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/thermal/rockchip_thermal.c 
>> b/drivers/thermal/rockchip_thermal.c
>> index 3aa46ac..cd8f5f93 100644
>> --- a/drivers/thermal/rockchip_thermal.c
>> +++ b/drivers/thermal/rockchip_thermal.c
>> @@ -529,7 +529,7 @@ static int rockchip_thermal_probe(struct 
>> platform_device *pdev)
>>         thermal->pclk = devm_clk_get(&pdev->dev, "apb_pclk");
>>       if (IS_ERR(thermal->pclk)) {
>> -        error = PTR_ERR(thermal->clk);
>> +        error = PTR_ERR(thermal->pclk);
> Yeah, you are right.
> Reviewed-by: Caesar Wang <wxt@rock-chips.com>
>

Tested-by: Caesar Wang <wxt@rock-chips.com>

> Thanks.
>
> Caesar
>>           dev_err(&pdev->dev, "failed to get apb_pclk clock: %d\n",
>>               error);
>>           return error;
>>
>>
>>
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


