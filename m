Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CACC433F5
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Oct 2021 22:46:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22A4B6108E
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Oct 2021 22:46:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356317AbhJAWsh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 1 Oct 2021 18:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356365AbhJAWsT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 Oct 2021 18:48:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F02C0617AA
        for <kernel-janitors@vger.kernel.org>; Fri,  1 Oct 2021 15:45:55 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g41so43936076lfv.1
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Oct 2021 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j+kPWhijK9ZE/26VUbCAEecJmq5SRMajLA/PCOWEcsE=;
        b=Bg5MG4XDDPuBh92Vk/tlS5dIVM7MtzTS0Ismt29VYAaBr+IFpXSm932DPSRRnvfdIt
         Nyx8Q2fiuKp+UI5YyOuqAJRvFg+LDUK3bdBvAvkIWD2o7XkIhzNaPHCWnsfmmP87Xxtm
         a/phJ1mWw8iRyPbyoBUiCPfQ2pIDi8SkbLnZaLQZt3cZ0ea0mqo0hl0IrxoDSQbiQPzm
         g9mPn14LMLU2RArV3CvPlxS87UJOsRw0gYaCMa2ZjaLzRYF/mCbLAb2qZ8jLpUjdaavC
         /W4OgTJEwQuWJD26fnYirpU4xszFu67Sbkzn1fB13ED04WQ5cQE9QDE5JltP23dS5SM5
         hatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j+kPWhijK9ZE/26VUbCAEecJmq5SRMajLA/PCOWEcsE=;
        b=VqK128m394lwNEV8aY5MLfcWRt+9f+a4FP9/CCH+/V0A4U2Xrcj6GPuWOwf1vK313N
         123n9/srEm1wVYGGJx2d2jBcKiXZdWci/4YiRXo/T6Nm4XYi6iwOxAi5NP8WdQ5WHPN1
         VYe0weFL5JQs4vMzpa/DnTJIApeC8VUz/Ung6u8Drdt74UvRWZ9vIrKsPFM9WIFilf/m
         bIIsblhIS9FaAJL5CpwCL1rujTpBS3k/LxBtityak2S/CkEo7BBPvtsFwA6L6dLaJmyy
         xKbg7XzPLT9oRe8TCWQTeMH5V9pqcZU3kADk1PyoLIfZnsRtcPpi4Ltuoj5RHC44eP1M
         gA9g==
X-Gm-Message-State: AOAM530hn+iPD6PRIjCzkPWrx0/RB87cMcfoNIHuHeZ3svxowqvjx/dP
        otpnMsymMdcgXivB1jMs3Z5mrJ9dsbdhXw==
X-Google-Smtp-Source: ABdhPJzCU0y+2PqtP5/oarv1W4DPLeJhO+Y0HVBwtEqk8HTHDm58RH+SjkVFlxeTeBxkQqkbaYRGRA==
X-Received: by 2002:a05:6512:3d91:: with SMTP id k17mr585010lfv.430.1633128353444;
        Fri, 01 Oct 2021 15:45:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28sm868966lfo.47.2021.10.01.15.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 15:45:52 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/msm/dsi: Fix an error code in
 msm_dsi_modeset_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Archit Taneja <architt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211001123308.GF2283@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b5016410-4e26-cbc5-0794-db9482aa3a71@linaro.org>
Date:   Sat, 2 Oct 2021 01:45:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001123308.GF2283@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 01/10/2021 15:33, Dan Carpenter wrote:
> Return an error code if msm_dsi_manager_validate_current_config().
> Don't return success.
> 
> Fixes: 8b03ad30e314 ("drm/msm/dsi: Use one connector for dual DSI mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 614dc7f26f2c..75ae3008b68f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -215,8 +215,10 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   		goto fail;
>   	}
>   
> -	if (!msm_dsi_manager_validate_current_config(msm_dsi->id))
> +	if (!msm_dsi_manager_validate_current_config(msm_dsi->id)) {
> +		ret = -EINVAL;
>   		goto fail;
> +	}
>   
>   	msm_dsi->encoder = encoder;
>   
> 


-- 
With best wishes
Dmitry
