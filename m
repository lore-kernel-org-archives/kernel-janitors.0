Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB21CC433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Dec 2021 16:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245040AbhLOQ4T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245037AbhLOQ4R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Dec 2021 11:56:17 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FCAC06173E
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Dec 2021 08:56:16 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id i63so34275230lji.3
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Dec 2021 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/mM+TtN7QigfV8F9BSaGaHszde8U6/Lni1GFCo1emVk=;
        b=dF6HpHPFiz7ifldwyihr5zXt1+h5MHmIv9Cm6jHNIH41piiiJWR0Kcf9gKAOGyiBBq
         vHACI8SjJCg/LcKAxtj5FkQXlgaz1BGK9X9usL/XZv0BH59KCm6bpWEHc+ZVlKWWAVri
         ndSOhrvG5OXK+mfw0MAcUtufp7WlyGlgtZoPyEczgyPecrOYRFGN8YWykNVL6v3iqJ9S
         WCFlq5rhTDbYjcYca4pCSiQXZ1LX7upCHqjflKi7nRxya4FTVT7wN3XxJ6UHgfN5THaZ
         Tjx/A4LFyEYjnij+NpJnefMS0sKCqYWPvVjoI74jYl8rC9/q/LEPXc3ZHD7Tzr8vw9Vi
         g+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/mM+TtN7QigfV8F9BSaGaHszde8U6/Lni1GFCo1emVk=;
        b=jweKAr7m/Ih0Jgzc5cPwiaTLsb2+i31AvNygc4k74t53wKarLfxb4098BzZnCoUJVG
         ahvHPcnz2nlGS8+fWdLyrxLfDpi0X32IOsbBwUM9KJPsgj4nzB6mA+nY+KN8TwE6TGrL
         5pBPWu6+vZIvIdhxTYtoHZuSLl+BywICnz5PAzBGP9ytek5P/vPcvlojdYGi5EuVWVMB
         efeLUInIDZw/YQ96zdBJX9Xyu0JyGWd5QZqKaGamGiCVEsfa3RMOb4PGnUEoOscSTQcV
         ex5vlvTQiwFe3IOgqPa/DVOYzScDBskdIxGzdr2QwvT2UDq8LbSsu5Lj0ITcY4fJ0H7o
         pp9g==
X-Gm-Message-State: AOAM533C/mlULjUaeTsOB9n8fTEld9f3srvw9ZGnyGSCYgnu+gKiVpQ8
        SBSmQO97luNk82TwZrSFBSCF0g==
X-Google-Smtp-Source: ABdhPJxxxdf7tgICe77qXKsLRA6dZuxeJOxmfJaSbnj2PKfJJ2ko+kcJ9hGwJfYGy/h6bpf9qOqtjg==
X-Received: by 2002:a2e:6e0d:: with SMTP id j13mr10688343ljc.124.1639587373419;
        Wed, 15 Dec 2021 08:56:13 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id m14sm550392ljg.2.2021.12.15.08.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:56:12 -0800 (PST)
Message-ID: <ec877733-7e1e-7ba8-0df9-8a7542dd0377@linaro.org>
Date:   Wed, 15 Dec 2021 19:56:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/dp: Fix double free on error in
 msm_dp_bridge_init()
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211215114900.GD14552@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211215114900.GD14552@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/12/2021 14:49, Dan Carpenter wrote:
> The "dp_bridge" pointer is allocated with devm_kzalloc() so it will be
> freed automatically.  Kfreeing it here will only lead to a double free.
> 
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 188e77c59885..d4d360d19eba 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -243,7 +243,6 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>   	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (rc) {
>   		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
> -		kfree(dp_bridge);
>   		return ERR_PTR(rc);
>   	}
>   
> 


-- 
With best wishes
Dmitry
