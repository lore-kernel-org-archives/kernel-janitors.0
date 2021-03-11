Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA26CC433DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 13:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EA8B64FDE
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 13:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhCKNKg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 08:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbhCKNKU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 08:10:20 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3639C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 05:10:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso13170001wmq.1
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 05:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+hhpCW4NXZ2+Io3IMxIPYt+lYnp9sm+v1Ci9SUk4a3o=;
        b=JNpInhzYi/QnLCeOhXJx5y7ODz0WDyvNCzDUaEHpOk3MmBIeniVihqSRcfAx5GJ7px
         Jr+zQJ+o5Qlg1Vhf6G4z1e+jH7desHi3Dbn82MxKmS1Nq+qSx+mmW4AVXBigDJ/G0YuZ
         pGbslCB6D3BwYRFru3GF5x9gCIm9fC2/1MXxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=+hhpCW4NXZ2+Io3IMxIPYt+lYnp9sm+v1Ci9SUk4a3o=;
        b=RdDeFwe4Yh/KEegjvD95WnIh/xYRN1R4t0LN0MB1tsyy8Ad7RIwv1mslbQmZ0P/3oF
         wuXW6n70HbagKIyWEuufi3MVYHnTpogpBp3nnz2qwJ8Qgk43cUe9Poj7PAP+UUXag912
         3h1zZZrcQf46VtfU+cVDFsAGfoHNP8rueiktFasJjXa9UjtMDisHbKMsB0h6z1Fstv6S
         nJSCaElxSljW+tLoshrA5R7T3+xaRU5jrsD66NEdam4NxODveOjxbNlnKFl/Ta096EGa
         1RkVk+UrR249ZpzEa895xNOHp2Rca6ooCZHAShX+fPuMNia7QOCIvWozY1njtqS+Vuf0
         0CHw==
X-Gm-Message-State: AOAM5312ix2kACMehhGx+ISuhp3Hh717guyyxNShJ7rmXsjk193MRkS9
        PJ2OOvHGodRorGn5hT/obFg7XQ==
X-Google-Smtp-Source: ABdhPJy51Lb+MAwQ+byf24AEh2DP5jP8rj5VHu5rcUu4pEdw0ULIAaT7cZjaXYbs9Ol1mcprLfnklA==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr8189532wmc.126.1615468218741;
        Thu, 11 Mar 2021 05:10:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g5sm3782504wrq.30.2021.03.11.05.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 05:10:18 -0800 (PST)
Date:   Thu, 11 Mar 2021 14:10:16 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Colin King <colin.king@canonical.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/radeon: fix copy of uninitialized variable back to
 userspace
Message-ID: <YEoWuBOCf8nr5tZn@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin King <colin.king@canonical.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210303002759.28752-1-colin.king@canonical.com>
 <490409f2-9fcb-d402-a6ae-b45c80bae3d2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <490409f2-9fcb-d402-a6ae-b45c80bae3d2@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Mar 03, 2021 at 08:42:31AM +0100, Christian König wrote:
> Am 03.03.21 um 01:27 schrieb Colin King:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the ioctl command RADEON_INFO_SI_BACKEND_ENABLED_MASK can
> > copy back uninitialised data in value_tmp that pointer *value points
> > to. This can occur when rdev->family is less than CHIP_BONAIRE and
> > less than CHIP_TAHITI.  Fix this by adding in a missing -EINVAL
> > so that no invalid value is copied back to userspace.
> > 
> > Addresses-Coverity: ("Uninitialized scalar variable)
> > Cc: stable@vger.kernel.org # 3.13+
> > Fixes: 439a1cfffe2c ("drm/radeon: expose render backend mask to the userspace")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Let's hope that this doesn't break UAPI.

If it does I think the only difference would be errno userspace sees
(aside from the stack garbage, which we could also emulate). Switching to
return 0; is easy. So no worries this would be a problem :-)
-Daniel

> 
> Christian.
> 
> > ---
> >   drivers/gpu/drm/radeon/radeon_kms.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> > index 2479d6ab7a36..58876bb4ef2a 100644
> > --- a/drivers/gpu/drm/radeon/radeon_kms.c
> > +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> > @@ -518,6 +518,7 @@ int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
> >   			*value = rdev->config.si.backend_enable_mask;
> >   		} else {
> >   			DRM_DEBUG_KMS("BACKEND_ENABLED_MASK is si+ only!\n");
> > +			return -EINVAL;
> >   		}
> >   		break;
> >   	case RADEON_INFO_MAX_SCLK:
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
