Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3855EC433FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Mar 2022 23:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiCHXLs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Mar 2022 18:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiCHXLr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Mar 2022 18:11:47 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9317E75635
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Mar 2022 15:10:44 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id h14so642951lfk.11
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Mar 2022 15:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tclsFaPE34TrWsSULlYvU9YsW3x7Tf6mvtJ/Ff+EAgw=;
        b=YTxtynEturtmQ9+fQ2vk4MLEzSozTMNeDRXaVWblqZvl5cNILUeHdpEsitwfPfNIzn
         uCtJuZ5NsjYf2Ok6NBtbFh9Ma45M5vV4eDFye5M5b2CqwFnkNoA8DFyU50SPmMselqV/
         q/tlUGMcxIMfJNgMyYAgT5U/xKc9hbMGY84CXSrjQz3QPryQGm3EntO5dzCPy4t1eLLM
         PJF3EWLGIRs9IQkx+NbaWBj8+A2ASwVgX7J8o5ZMMpRM0FvqYWU3ThHQDTV7BjFmtynz
         gVx61JpRkMOep1q+pQ1+vJQs7ocgJhkFT/XQnL7qiyo2bgs0+u1VgxYEfGddeAxQFlhp
         Cxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tclsFaPE34TrWsSULlYvU9YsW3x7Tf6mvtJ/Ff+EAgw=;
        b=hK4c9sf+PyI8NI/s6KJgWmL2+7ihd0snCdSPNu8a6NzFJfRXzkIStVE78lSrftTFY1
         cZ9MCwFPyOLLlwkrmEGr9fW+oN0nxg0PsWuiBH0ym2uMSbQC3hv9avk/JUC/v4i8K3vm
         phHMh+Xt8UQiSqBqpwgURyTfPOgi9HBAubCL+qjmD2dQeTnyRTw8jIfBmVDQ2axBR/KE
         CXBSD28zcuE6q4kn0mYfkEz4M5CJsGNdG69rMbb8raO+JY0g2Ln0SO+mnm/lawwj9TBC
         WQC276S18re8igvk3/AFA5XxVTKk1ip+qMW/3EvDEFpNzOlUu+9/Qh0EUgaMjorqyFit
         OXtw==
X-Gm-Message-State: AOAM532OVs7CdcL1yL/ueXdrAIzXsk5lD/Hk/boMv+BuNAwJuD0Fya/u
        u9G47TNKbMmwXzrXA/j/Av1dCjl4IeYfsSNiWDRl6w==
X-Google-Smtp-Source: ABdhPJx/fglOdwsFUXGzUPIPq1H3ZUZI8HoqBE3Dc7CpwH2vZZ4CHq8MWt1insKPhpHz2VgNI0Ys/4lxjE1mEucfOrE=
X-Received: by 2002:a05:6512:31d4:b0:445:e4ef:c0f8 with SMTP id
 j20-20020a05651231d400b00445e4efc0f8mr12498094lfe.626.1646781042694; Tue, 08
 Mar 2022 15:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20220307181704.149076-1-colin.i.king@gmail.com>
In-Reply-To: <20220307181704.149076-1-colin.i.king@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 8 Mar 2022 15:10:31 -0800
Message-ID: <CAKwvOdkXNGRJkZDd7Cg8jhL9Ex7R+VPYqEEc+VpwDyi9NJKXQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: remove redundant assignment to pointer connector
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, knaerzche@gmail.com,
        Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 7, 2022 at 10:17 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The pointer connector is being assigned a value that is never read,
> it is being re-assigned in the following statement. The assignment
> is redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/gpu/drm/rockchip/rockchip_rgb.c:153:2: warning: Value stored
> to 'connector' is never read [deadcode.DeadStores]

+ Author & reviewer of:
Fixes: 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
flag to drm_bridge_attach")

>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_rgb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> index 2494b079489d..92a727931a49 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> @@ -150,7 +150,6 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
>         if (ret)
>                 goto err_free_encoder;
>
> -       connector = &rgb->connector;
>         connector = drm_bridge_connector_init(rgb->drm_dev, encoder);
>         if (IS_ERR(connector)) {
>                 DRM_DEV_ERROR(drm_dev->dev,
> --
> 2.35.1
>
>


-- 
Thanks,
~Nick Desaulniers
