Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581C8C432BE
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 09:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3959F610A4
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 09:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240868AbhHZJT7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Aug 2021 05:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240674AbhHZJTs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Aug 2021 05:19:48 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67073C0613C1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Aug 2021 02:19:00 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so1749735wml.3
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Aug 2021 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=KMJBcmq1ZbF4M7qvQIwnmFbcPOdYmPNTJCyQyrP/K4I=;
        b=HYMxJKmJI6lkK9oRwabJkJvg4BmknVTOZc6kLrTHzRnJGXKHNy8FEqyc/pVEv7AI7v
         FzXm9+8wsENdDtneykOm5Kwv7Wkqek7pHpSFvoGSt9UThVfJDY/Xjr3I8M3VHEHX0PUo
         DoWF7H0mo9TXaFpvpSbb9W/3UlLv8RvHPMGyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=KMJBcmq1ZbF4M7qvQIwnmFbcPOdYmPNTJCyQyrP/K4I=;
        b=q/piOkMaV6wBfUTQ4CRXn+gNc3R63zluq87y6ALkRkDXr1jEMy+fR3lIjJ+gGWRFCe
         1r5NjMzptQ5vvVn+54hpqlr1xNxOf9GHdXdX6q+Ln7gWHEPHKV03o1bZA8529FJO+Gnx
         Qn2mJB4jtb3Hw22uePIOtOYOPzoUIpT8oO2wN2p7eWUZz9Cekq1pdcu9vT5WLaRC4kWK
         ccj5gHA21Qqd6A5ACmXer3T+oil/xrTo07p0zSR55QKB7CnOUa5Wa2aJXYsmxst31WeC
         RD+82T/NZOH0SWogBbTvMck1G/EztEjidAqjseZE85db2WuIueIvPL7e1E6fQZ5jGQhQ
         wxrw==
X-Gm-Message-State: AOAM532sctRKL0ldLYATMX3HtxX1YVnUmDv8Fm+db9f3n/STFwSidYtQ
        IdNhBoUSz6Kv5L5hcBqAZTc0wg==
X-Google-Smtp-Source: ABdhPJyRLhnVn7qZJ+4BuVfziyV2sSG5HJDNYqpREM4DjFqEBEWHewXDa8dbxtyIY5O9FmU4npDFrA==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id o7mr12963274wmq.55.1629969538974;
        Thu, 26 Aug 2021 02:18:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u5sm2417412wrr.94.2021.08.26.02.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 02:18:58 -0700 (PDT)
Date:   Thu, 26 Aug 2021 11:18:56 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Emma Anholt <emma@anholt.net>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm: omap: remove obsolete selection of OMAP2_DSS
 in config DRM_OMAP
Message-ID: <YSdcgLcD2hOZks6l@phenom.ffwll.local>
Mail-Followup-To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Emma Anholt <emma@anholt.net>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
 <20210819112253.16484-6-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819112253.16484-6-lukas.bulwahn@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 19, 2021 at 01:22:53PM +0200, Lukas Bulwahn wrote:
> Commit 55b68fb856b5 ("drm/omap: squash omapdrm sub-modules into one")
> removes the config OMAP2_DSS in ./drivers/gpu/drm/omapdrm/dss/Kconfig,
> while moving the other configs into./drivers/gpu/drm/omapdrm/Kconfig, but
> misses to remove an obsolete selection of OMAP2_DSS in config DRM_OMAP.
> 
> Hence, ./scripts/checkkconfigsymbols.py warns:
> 
> OMAP2_DSS
> Referencing files: drivers/gpu/drm/omapdrm/Kconfig
> 
> Remove this reference in an obsolete selection.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Except the amdgpu patch all merged to drm-misc-next. amdgpu should get
picked up by Alex.
-Daniel

> ---
>  drivers/gpu/drm/omapdrm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index e7281da5bc6a..d6e4df291d6f 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -3,7 +3,6 @@ config DRM_OMAP
>  	tristate "OMAP DRM"
>  	depends on DRM
>  	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
> -	select OMAP2_DSS
>  	select DRM_KMS_HELPER
>  	select VIDEOMODE_HELPERS
>  	select HDMI
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
