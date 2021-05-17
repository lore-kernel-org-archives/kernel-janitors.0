Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3025C43461
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 08:43:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B935E61029
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 08:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235363AbhEQIol (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 04:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhEQIok (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 04:44:40 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FEDC061573
        for <kernel-janitors@vger.kernel.org>; Mon, 17 May 2021 01:43:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so869910wmc.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 May 2021 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HsGrTTXSqy1R5BsWlfd1YsU0RFI4WeeaWkJklgir48U=;
        b=0hE5O+GscDy8Nn4rYBiNbO80WVKdf2MQMu1/ZGp+wCPqj71c1zOsJkxvhm92HFfh9D
         A5Xpa4k+L15JPEr7KVv/BlG5uTR41DCDIzsz3ZA4bk+oFWtSIxLox9X9ioQIuLtX96K1
         6X5pWg5MWQCpHll9ELZSrPLOyVFmu9nFR1IAk5M+GHtXP+8NW/bQ+SC3xSl9XmRR306s
         SfYHuPTBAVgOaJUDACDY4MyyxQvxucaRM75v4ue//VMt1IHOlpuXwu9EnXsE8tisjjmN
         vwhzQCMmlREj1E+EmxAtnfvj7TP13MV8Q/UpVpQnHFgeJvEHOhipIwPbGZNwM49i0mgE
         7m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HsGrTTXSqy1R5BsWlfd1YsU0RFI4WeeaWkJklgir48U=;
        b=Q2YFb6gpN2zkOIVNcb1dfIZmPscg7dEWBoN+5uPwN10+PrE3PNbGyPMtIbkmPF1cAF
         dlgdukbir23fIaiBc0Gnvx07QrGhaRuYWreLJOKjwsheKT7Q774I4v0MU4A7dVr6ljb8
         eZkFiQUNNsDzKlV2cjUU73cSXnGv15y8jO/y7XYKUz3aa2+Xpt3orZd9KIgjV7evIxqe
         4etS+Ztg874XLmib37ZXQ0VWB+dPgSskF2R/jcjLvWq4ct+9a7+iIFax3aPv7Gk9ODXc
         wTUf1TiYwBKJx6CeBwOvzucCvozlzqQOVB6Dyproi+X9tmFJJv/+yh3n/SsnocQLIiQ+
         Aeqw==
X-Gm-Message-State: AOAM532rcHWJ/Z7gKQCGRs7G9f77rDUUd37jua9Sdtvg+Y9bIqb1IMf3
        bK2+XWB/Eia2D8p+XgmJAkt3yVlFwVFxdrq9
X-Google-Smtp-Source: ABdhPJx2rtb2czAZLf2iwucJaJ228xdmBB8ZpCH4PIXiaefI7VBHYklQgRZAQYZ4EVToF5rVF1PYNw==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr62673858wml.123.1621241002792;
        Mon, 17 May 2021 01:43:22 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:3044:ffc:eaa9:6a70? ([2a01:e0a:90c:e290:3044:ffc:eaa9:6a70])
        by smtp.gmail.com with ESMTPSA id q186sm588870wme.20.2021.05.17.01.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 01:43:22 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm: bridge: it66121: fix a resource leak in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Phong LE <ple@baylibre.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <YJ+ZgXTFa6voZuJG@mwanda>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <873d476b-d8b2-8757-47ba-4588231ceac3@baylibre.com>
Date:   Mon, 17 May 2021 10:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJ+ZgXTFa6voZuJG@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/05/2021 11:50, Dan Carpenter wrote:
> In the original code if the "ctx = devm_kzalloc()" allocation failed
> then we should have called of_node_put(ep); before returning.  It's
> actually a bit easier to do the allocation first before assigning
> ep = of_graph_get_endpoint_by_regs().
> 
> Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 6980c9801d0d..7149ed40af83 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -898,14 +898,14 @@ static int it66121_probe(struct i2c_client *client,
>  		return -ENXIO;
>  	}
>  
> -	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> -	if (!ep)
> -		return -EINVAL;
> -
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return -ENOMEM;
>  
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +	if (!ep)
> +		return -EINVAL;
> +
>  	ctx->dev = dev;
>  	ctx->client = client;
>  
> 

Thanks !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applying to drm-misc-fixes
