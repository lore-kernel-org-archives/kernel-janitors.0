Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E73C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 11:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAE4E610E5
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 11:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbhDHLUi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Apr 2021 07:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhDHLUh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 07:20:37 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187E7C061761
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Apr 2021 04:20:23 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so1030468wmi.3
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Apr 2021 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=p9/vcGnQMibF9rkDWZtUMCI7BNJHmwZHzupvVKqVu3E=;
        b=YnHMsaO2s1KNWHEyZA+FBnXLbzo0kKMYlmU9l9iP1g4DGl7O4FRzWyFDCE5BWmlipe
         byHjyxws/nm6+Um0woHg/dDHbRJEKezIUFT3iWU5a8w1PU2e7m+WM6pVFy2MfWlfxoAa
         LoEdm8nFSDszG2vkXnarWkoZ7cVvGd0uGCunY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=p9/vcGnQMibF9rkDWZtUMCI7BNJHmwZHzupvVKqVu3E=;
        b=EV2neR6F2p+QvAfNDMhi+tttd0Gj/R4eT82wyMdsCEWcu8dTWYGZcw8W+bnCcw77Gx
         DoOQ3S/Ca8+z12TUlrv4AeknOkHToyV4UKhzg0sNrC5PKXCWfzxXUoZbBjPCjCQ9V9b9
         jdB5UdxhmEVm0K0a7Z5k9qGs+8L21kROt1/YSO3l4P4/1P84V3Cumsi/PyPhk7B7rLFG
         7LY9vRAB27zHLtzjohIX7UP+qLLknDOAVSxHods9k3vwk0QY38Sqv5uP8ncIszSRT+jz
         xEcfHJdeFixC0auESKi8zgMpXpDqtWwxnl3jjPs/rxbugy5qYWfx4O9MPRl3KurhBk0d
         +z9A==
X-Gm-Message-State: AOAM533B7zwC8mFBQc37YoZqIUfHJV2tb6bpHlpfnr3QCDBrdInpbFLe
        eH4WLFJTAhcvgj4RGdJaXIx3/A==
X-Google-Smtp-Source: ABdhPJyGIebRl0LCNGA8cQnrb+fYGQT/Pf+/l14E/xAG36Cx4IwUC+NrIjreWsTLESHVxP3rRmlSCQ==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id o16mr7872267wmq.123.1617880821826;
        Thu, 08 Apr 2021 04:20:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c16sm55234757wrs.81.2021.04.08.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:20:21 -0700 (PDT)
Date:   Thu, 8 Apr 2021 13:20:19 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Huang Guobin <huangguobin4@huawei.com>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] gma500: Use DEFINE_SPINLOCK() for spinlock
Message-ID: <YG7m8z5n223DqDht@phenom.ffwll.local>
Mail-Followup-To: Huang Guobin <huangguobin4@huawei.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1617710114-48071-1-git-send-email-huangguobin4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617710114-48071-1-git-send-email-huangguobin4@huawei.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 06, 2021 at 07:55:14PM +0800, Huang Guobin wrote:
> From: Guobin Huang <huangguobin4@huawei.com>
> 
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Guobin Huang <huangguobin4@huawei.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/gma500/power.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
> index 56ef88237ef6..f07641dfa5a4 100644
> --- a/drivers/gpu/drm/gma500/power.c
> +++ b/drivers/gpu/drm/gma500/power.c
> @@ -36,7 +36,7 @@
>  #include <linux/pm_runtime.h>
>  
>  static struct mutex power_mutex;	/* Serialize power ops */
> -static spinlock_t power_ctrl_lock;	/* Serialize power claim */
> +static DEFINE_SPINLOCK(power_ctrl_lock);	/* Serialize power claim */
>  
>  /**
>   *	gma_power_init		-	initialise power manager
> @@ -55,7 +55,6 @@ void gma_power_init(struct drm_device *dev)
>  	dev_priv->display_power = true;	/* We start active */
>  	dev_priv->display_count = 0;	/* Currently no users */
>  	dev_priv->suspended = false;	/* And not suspended */
> -	spin_lock_init(&power_ctrl_lock);
>  	mutex_init(&power_mutex);
>  
>  	if (dev_priv->ops->init_pm)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
