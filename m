Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80ED9C48BD1
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Jun 2021 10:32:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62A22613E7
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Jun 2021 10:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhFKKei (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 11 Jun 2021 06:34:38 -0400
Received: from foss.arm.com ([217.140.110.172]:54322 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhFKKeh (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Jun 2021 06:34:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B56CF1396;
        Fri, 11 Jun 2021 03:32:39 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23E2C3F694;
        Fri, 11 Jun 2021 03:32:38 -0700 (PDT)
Subject: Re: [PATCH -next] drm/panfrost: Fix missing clk_disable_unprepare()
 on error in panfrost_clk_init()
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210608143856.4154766-1-weiyongjun1@huawei.com>
From:   Steven Price <steven.price@arm.com>
Message-ID: <cd7573bb-8323-0069-6caa-5bc6a6ea6297@arm.com>
Date:   Fri, 11 Jun 2021 11:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608143856.4154766-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08/06/2021 15:38, Wei Yongjun wrote:
> Fix the missing clk_disable_unprepare() before return
> from panfrost_clk_init() in the error handling case.
> 
> Fixes: b681af0bc1cc ("drm: panfrost: add optional bus_clock")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 125ed973feaa..a2a09c51eed7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -54,7 +54,8 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
>  	if (IS_ERR(pfdev->bus_clock)) {
>  		dev_err(pfdev->dev, "get bus_clock failed %ld\n",
>  			PTR_ERR(pfdev->bus_clock));
> -		return PTR_ERR(pfdev->bus_clock);
> +		err = PTR_ERR(pfdev->bus_clock);
> +		goto disable_clock;
>  	}
>  
>  	if (pfdev->bus_clock) {
> 

