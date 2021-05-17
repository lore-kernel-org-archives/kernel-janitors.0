Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52973C433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 08:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31516611BF
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 08:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235286AbhEQIn7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 04:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235446AbhEQIn6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 04:43:58 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC83C061760
        for <kernel-janitors@vger.kernel.org>; Mon, 17 May 2021 01:42:42 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so3069599wmn.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 May 2021 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zXxaT8nwWGbSA3y71Sv2dFK7xUB5sHLPcIFAVGVS5/o=;
        b=xKt2I5INi0ltOoKuJqoyxEaSp+X9Itm/nppkVkA2uNvGcJa98/ZsMPQOTzXP5a6xkX
         sDR5uJyjuz4zrQOplIHLLKDvMlBMuLeKCJBY3xwwRiW1G1tp3NRY9T8l+yVvWZLp+nAp
         hQaZhGEQmfOyHbztaPk+bf/zWzu2tEt/gZwVl1UeOEjcKg+z/rLbugGdcrvFMj5srlXu
         cfgXToN4KCjFtiWgHamsSc0oVVmQ/ualErnm2+xuwiJLq9MM73zYtmxpJnUi7CW1NU0S
         t6m1ESXgfDzjx/VS3YurE6B8Q5kWMIsd9CufeAhKcn4OQnt7CcQD7nJzv4xggGCHDm+h
         yZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zXxaT8nwWGbSA3y71Sv2dFK7xUB5sHLPcIFAVGVS5/o=;
        b=nr9Z5UIRVK/YctJ2FHkmJVjKUPWRf2OrK4yyWgDvF9QF8OBV8CPfXtuUkLdufRq3EA
         4lJS/DboP5Gr3MFpaKv7e0EwpIF2ZmkN51r0QJNWSk7CztcKu8HUtTQhXNj4XBKSM7gL
         vkORAn6l0J57O2wyHX3xoj4X8YuvAaAe7W0xPxuRCzWVuJWl8v7LuYZICy9CIFA3cybI
         yZG+lvqST4xWuPDx0LzkDOP6jspnhmI6xJB4l7vfapF9xvjNXESG9zShCkwsft94Mxlx
         NUyDbfrcxvTh1G+BKrcBAUVvZOfxWMOF93GGr8Vk5e2GL+z0gOTrYY6+C64sk0kUUIWi
         hSqg==
X-Gm-Message-State: AOAM533uP/B8klq0+/SP+yWbw3TKZKwkVZvMH6rH3xTFQHNofle4y1XP
        i/VcvnhTe5Xm0IFQ4D1WLKxkYz0o64YlZmOE
X-Google-Smtp-Source: ABdhPJxnfbUUFBq8SHWIEOb1yzYUGtz36OYX9EnYlPiOSVu236fyQ9xAjk6p3KB12c/i/XwvElJEXA==
X-Received: by 2002:a05:600c:35d2:: with SMTP id r18mr22409712wmq.133.1621240960771;
        Mon, 17 May 2021 01:42:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:3044:ffc:eaa9:6a70? ([2a01:e0a:90c:e290:3044:ffc:eaa9:6a70])
        by smtp.gmail.com with ESMTPSA id 6sm15759027wry.60.2021.05.17.01.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 01:42:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm: bridge: it66121: fix an error code in
 it66121_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Phong LE <ple@baylibre.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YJ+ZX3BdKPAN0pUZ@mwanda>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <638a3344-3222-87a1-d500-0d49960088a1@baylibre.com>
Date:   Mon, 17 May 2021 10:42:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJ+ZX3BdKPAN0pUZ@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/05/2021 11:50, Dan Carpenter wrote:
> This code is passing the wrong variable to PTR_ERR() so it doesn't
> return the correct error code.
> 
> Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index d8a60691fd32..6980c9801d0d 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -943,7 +943,7 @@ static int it66121_probe(struct i2c_client *client,
>  	ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
>  	if (IS_ERR(ctx->regmap)) {
>  		ite66121_power_off(ctx);
> -		return PTR_ERR(ctx);
> +		return PTR_ERR(ctx->regmap);
>  	}
>  
>  	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
> 

Thanks !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applying to drm-misc-fixes
