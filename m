Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BF9C433B4
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 May 2021 07:39:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B60F6613C9
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 May 2021 07:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhEIHkq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 9 May 2021 03:40:46 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:53643 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhEIHkq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 May 2021 03:40:46 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d86 with ME
        id 2Xfi2500H21Fzsu03XfiJD; Sun, 09 May 2021 09:39:42 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 May 2021 09:39:42 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20210509004112.421100-1-eantoranz@gmail.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <e0358967-23ba-2509-2045-b29d83f8c1c1@wanadoo.fr>
Date:   Sun, 9 May 2021 09:39:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210509004112.421100-1-eantoranz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 09/05/2021 à 02:41, Edmundo Carmona Antoranz a écrit :
> Modify some error messages so that the symbolic error value be
> printed instead of a numeric value.
> ---
>   drivers/rtc/rtc-max77686.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index ce089ed934ad..470260478752 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -711,7 +711,8 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
>   						info->drv_data->regmap_config);
>   	if (IS_ERR(info->rtc_regmap)) {
>   		ret = PTR_ERR(info->rtc_regmap);
> -		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
> +		dev_err(info->dev, "Failed to allocate RTC regmap: %pe\n",
> +			info->rtc_regmap);
>   		return ret;
>   	}
>   
> @@ -763,7 +764,8 @@ static int max77686_rtc_probe(struct platform_device *pdev)
>   
>   	if (IS_ERR(info->rtc_dev)) {
>   		ret = PTR_ERR(info->rtc_dev);
> -		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
> +		dev_err(&pdev->dev, "Failed to register RTC device: %pe\n",
> +			info->rtc_dev);
>   		goto err_rtc;
>   	}
>   
> 
Hi,
both patches LGTM.

CJ
