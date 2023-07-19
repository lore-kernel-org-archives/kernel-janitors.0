Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8F2C0015E
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Jul 2023 10:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjGSKiX convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Jul 2023 06:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjGSKiS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jul 2023 06:38:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EF71BDC
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 03:38:09 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1qM4ZE-00082e-VV; Wed, 19 Jul 2023 12:38:01 +0200
Message-ID: <94b5ccf8f10e51426bd410705ce1260d006f9b37.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix error code in event_alloc()
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Date:   Wed, 19 Jul 2023 12:37:59 +0200
In-Reply-To: <53fc5292-669a-4fca-8b99-e35a49da0b0f@moroto.mountain>
References: <53fc5292-669a-4fca-8b99-e35a49da0b0f@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Am Mittwoch, dem 19.07.2023 um 13:17 +0300 schrieb Dan Carpenter:
> There are two "ret" variables declared in this function so setting
> "ret = -EBUSY;" sets the wrong one.  The function ends up returning an
> uninitialized variable.
> 
Thanks for the fix. Applied to the etnaviv/next branch where the
offending commit sits right now.

Regards,
Lucas

> Fixes: f098f9b8042a ("drm/etnaviv: move runtime PM handling to events")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index f54f12090685..0382cd91eebf 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1158,18 +1158,18 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
>  	int ret;
>  
>  	for (i = 0; i < nr_events; i++) {
> -		unsigned long ret;
> +		unsigned long remaining;
>  
> -		ret = wait_for_completion_timeout(&gpu->event_free, timeout);
> +		remaining = wait_for_completion_timeout(&gpu->event_free, timeout);
>  
> -		if (!ret) {
> +		if (!remaining) {
>  			dev_err(gpu->dev, "wait_for_completion_timeout failed");
>  			ret = -EBUSY;
>  			goto out;
>  		}
>  
>  		acquired++;
> -		timeout = ret;
> +		timeout = remaining;
>  	}
>  
>  	spin_lock(&gpu->event_spinlock);

