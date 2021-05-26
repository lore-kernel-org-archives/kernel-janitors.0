Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E0BC47082
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 19:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADC57613C3
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 19:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbhEZTPn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 15:15:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:4652 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232133AbhEZTPn (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 15:15:43 -0400
IronPort-SDR: QMnrwOW15NHCyKQUcsXfEyhKaN+YGpvhU6sYZi0ZHs1jIhYip7cWpAEC84qDsGjnmiqjiybzm3
 yINYXocnJ7fg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202559565"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="202559565"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 12:13:59 -0700
IronPort-SDR: dyeO1+srfGdFjB+wH7cI5+UrmQuk0122MlJYispTQe+At95uTTZDMU/dpNC4Zzf+NKevovnIJv
 /X0b4qLx/8Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="444220112"
Received: from marshy.an.intel.com (HELO [10.122.105.143]) ([10.122.105.143])
  by fmsmga008.fm.intel.com with ESMTP; 26 May 2021 12:13:58 -0700
Subject: Re: [PATCH] firmware: stratix10-svc: Fix a resource leak in an error
 handling path
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        gregkh@linuxfoundation.org, atull@kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <0ca3f3ab139c53e846804455a1e7599ee8ae896a.1621621271.git.christophe.jaillet@wanadoo.fr>
From:   Richard Gong <richard.gong@linux.intel.com>
Message-ID: <f669ed42-348f-808b-afeb-9528d2ece6ee@linux.intel.com>
Date:   Wed, 26 May 2021 14:13:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ca3f3ab139c53e846804455a1e7599ee8ae896a.1621621271.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Hi Jaillet,

Thanks!

On 5/21/21 1:22 PM, Christophe JAILLET wrote:
> If an error occurs after a successful 'kfifo_alloc()' call, it must be
> undone by a corresponding 'kfifo_free()' call, as already done in the
> remove function.
> 
> While at it, move the 'platform_device_put()' call to this new error
> handling path and explicitly return 0 in the success path.
> 
> Fixes: b5dc75c915cd ("firmware: stratix10-svc: extend svc to support new RSU features")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/firmware/stratix10-svc.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index 3aa489dba30a..2a7687911c09 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -1034,24 +1034,32 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
>   
>   	/* add svc client device(s) */
>   	svc = devm_kzalloc(dev, sizeof(*svc), GFP_KERNEL);
> -	if (!svc)
> -		return -ENOMEM;
> +	if (!svc) {
> +		ret = -ENOMEM;
> +		goto err_free_kfifo;
> +	}
>   
>   	svc->stratix10_svc_rsu = platform_device_alloc(STRATIX10_RSU, 0);
>   	if (!svc->stratix10_svc_rsu) {
>   		dev_err(dev, "failed to allocate %s device\n", STRATIX10_RSU);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto err_free_kfifo;
>   	}
>   
>   	ret = platform_device_add(svc->stratix10_svc_rsu);
> -	if (ret) {
> -		platform_device_put(svc->stratix10_svc_rsu);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_put_device;
> +
>   	dev_set_drvdata(dev, svc);
>   
>   	pr_info("Intel Service Layer Driver Initialized\n");
>   
> +	return 0;
> +
> +err_put_device:
> +	platform_device_put(svc->stratix10_svc_rsu);
> +err_free_kfifo:
> +	kfifo_free(&controller->svc_fifo);

Need for the allocated memory pool as well,
	if (ctrl->genpool)
                 gen_pool_destroy(ctrl->genpool);

Rename err_free_kfifo to include both.

>   	return ret;
>   }
>   
> 

Regards,
Richard
