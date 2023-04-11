Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C03C76196
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Apr 2023 18:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjDKSKE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Apr 2023 14:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjDKSJ7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Apr 2023 14:09:59 -0400
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416D76A7A
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Apr 2023 11:09:44 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id mIR2plxDOpFivmIR2p9idX; Tue, 11 Apr 2023 20:09:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
        s=t20230301; t=1681236582;
        bh=M7S+qYYKm3F1E+ZKhxHIt6xFK2OD6F3sGIISrUwFXqQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=bgdaZUdIDannUwcYDuOG2m7OtaTtOHCYjdl2FvDtWhXJRMo98O0OkPXgyoG5/7qru
         3m6wxBKJ7wcXA1vjNwb2HNODxD26r0gPI28DBUp7AqQsTQ7UsLsHN1eqEnOd1ZXVKM
         0oVcD7flwQ3loZ4xYsqejVTkA8p8mWXhAZCCh/WDEZVYhD8L2kytALajKGpjw+A4Hi
         RoR6IxsndRcpH3bmnQ/xMd/MgC95L5IUwg9VQoiFjF6Jfzsc1eezuRrskSEIhpfZli
         h/KCIZiB4FssH3Spz8mHvRAxH0IClcpCUqGxeWi0pJ37ZPTSwyqCIZwPXhnldTVDs6
         03mR4gH5lT6qg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Apr 2023 20:09:42 +0200
X-ME-IP: 86.243.2.178
Message-ID: <b3c82938-7db0-2c0b-7784-c2096570c940@wanadoo.fr>
Date:   Tue, 11 Apr 2023 20:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/armada: Fix a potential double free in an error
 handling path
Content-Language: fr, en-US
To:     linux@armlinux.org.uk, daniel@ffwll.ch,
        David Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <c4f3c9207a9fce35cb6dd2cc60e755275961588a.1640536364.git.christophe.jaillet@wanadoo.fr>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <c4f3c9207a9fce35cb6dd2cc60e755275961588a.1640536364.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 26/12/2021 à 17:34, Christophe JAILLET a écrit :
> 'priv' is a managed resource, so there is no need to free it explicitly or
> there will be a double free().
> 
> Fixes: 90ad200b4cbc ("drm/armada: Use devm_drm_dev_alloc")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/armada/armada_drv.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 8e3e98f13db4..54168134d9b9 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -99,7 +99,6 @@ static int armada_drm_bind(struct device *dev)
>   	if (ret) {
>   		dev_err(dev, "[" DRM_NAME ":%s] can't kick out simple-fb: %d\n",
>   			__func__, ret);
> -		kfree(priv);
>   		return ret;
>   	}
>   

Hi,

polite reminder. (I've updated the mails according to the output of 
get_maintainer.pl)

The patch still LGTM and should apply cleanly.

CJ
