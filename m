Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C637C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Oct 2021 17:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54715619F8
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Oct 2021 17:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354755AbhJARo4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 1 Oct 2021 13:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354596AbhJARo4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 Oct 2021 13:44:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F7AC061775
        for <kernel-janitors@vger.kernel.org>; Fri,  1 Oct 2021 10:43:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y26so41909914lfa.11
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Oct 2021 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=trOpTX3fPgPSfjOpDMDPYXwd4LNjI9d/+tq2q/EXfXQ=;
        b=KI3fJiRswZHK7JIIXimHTd8OowVIiXi/9S53GbwPQ83bF/hY52XkV0A9vlrTu+XBf6
         Y63wVv35AvDlsSlaO6hsekVqxNao1ElfQNxyhV8XtgGYuZS7p3RCZSy27g2Vm9ErDf4c
         AKLSENXIget1Mxj9It9IJBJFVM7fA5r1hVRrzLfyGI+UeHSCWlx8b4N+FHesI8dCOn+Y
         jVVqYwwcBZ4LPGR8DFafriSOG78Tuov+fIPsyruyJ/p6h5mrTwHUOctS/ioY2nN5zl76
         Fdx1siPDvoxni6Hvn3dPpXzTLCD/83TR630uVYjaQAWvTqiHgA2XqKyd8azozC1SGmWf
         owTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=trOpTX3fPgPSfjOpDMDPYXwd4LNjI9d/+tq2q/EXfXQ=;
        b=eFwl/6L+bs8vGGqQfzGQ4OUjDZrgwzoBX7tYrtfdXK8TJWWj9BGUdwhmM0mDr83ZFk
         lCeCuOkTtiNh1SbSVGQoynzDow9OEGZmChZW+l+LyzPA3np4fg4WZW+0Hpd+TMJT2zno
         d6gwsbygcaolkGsW+0gX4p5Wbp9bwOOHumLLaK0Isa5+pVR6uk7lxyJTDxaOpaAwJsl7
         JbrpEO/aT7PGVfIjPW6A4qq9gEpNxLRHqGKFg4nzoEhuTOolJo/Ri6CONAF5+HnqcVCW
         CPCygDtoGt8d1c0/dPpZVT/Iljfc1Y0E1RBAaqNL6nolv7nsh/UvvFp97Nl32l64xq4U
         SpEA==
X-Gm-Message-State: AOAM533u42SUamQJETNugqjGawCu2fDaUPgs6XYrVBGrAIjzeSV5lPOB
        lPfC/fJ1QQHCkVeR3ksQ7A+PCA==
X-Google-Smtp-Source: ABdhPJwnqJ4zOBa3TwxdlBctEXCtk8ih+ennQVb4Li8mAsgMGpf5gT3g7NpA8Y+kGCVKPaXiLBBb9A==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr6563941lfc.43.1633110189970;
        Fri, 01 Oct 2021 10:43:09 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v3sm873116lfq.70.2021.10.01.10.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 10:43:09 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dp: Remove redundant initialization of variable
 bpp
To:     Colin King <colin.king@canonical.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210929105458.209895-1-colin.king@canonical.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f0d9d9f5-2f6f-8936-1a6d-825ce07a5d65@linaro.org>
Date:   Fri, 1 Oct 2021 20:43:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929105458.209895-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 29/09/2021 13:54, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable bpp is being initialized with a value that is never
> read, it is being updated later on in both paths of an if statement.
> The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 2181b60e1d1d..71db10c0f262 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -234,7 +234,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
>   		u32 mode_edid_bpp, u32 mode_pclk_khz)
>   {
>   	struct dp_panel_private *panel;
> -	u32 bpp = mode_edid_bpp;
> +	u32 bpp;
>   
>   	if (!dp_panel || !mode_edid_bpp || !mode_pclk_khz) {
>   		DRM_ERROR("invalid input\n");
> 


-- 
With best wishes
Dmitry
