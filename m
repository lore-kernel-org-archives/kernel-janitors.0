Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21614EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 05:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjGRFkH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 01:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjGRFkG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 01:40:06 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A3110C0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 22:40:03 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso48371025e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 22:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689658802; x=1692250802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ya/1SVocqBXDn23113d+R4cUZi+/kBBEHle0gpe+T/o=;
        b=yAiQg4/G4RZgC98nQfxJHmKg1a07ypHkoXSBOBhHi1hQ4suNxn7ew76iCJ45pHI1A7
         w/+G2qEoTK7/GFWcwVSCi00Ns6k4G91AkX8NyBz0sElNy5kvRJ3Zy8PGGTBqAFrTNctm
         V0w74PGnD5+NCu5Lx9mviu8j0u18uwOm0EJ6nBenp1W6UODxunP89A9MPnulhHAU34Jq
         aay2smoz0ZSOgSCGP9/56o/qDvj3f/8U3cxzsG1NwQ/loDMc9pQXbT3qIlPPpSk7bJP8
         kYY9L28x3s3tgAWhEaqmedGoiuZKrYgnCJYswjcXnCu6/Iz4n3OWFVUb3E0DVBZWcz6g
         c7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689658802; x=1692250802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya/1SVocqBXDn23113d+R4cUZi+/kBBEHle0gpe+T/o=;
        b=IwEi/BYyjmBk251MokbAsmPcWjLi7JpZe4agBD7fqtuhKP/WEKMRe5jWQXYK/vxGLj
         4a/a946TfJU3ICmARjd9vOGOaS/xi4uByouW9sAX3hEM40ujjQcyEeMYllWuyD5A6jcL
         qPlvJMdlViAlVbPJ8Dw5hkJXVNQRlPsuBRcpDrzmxNlL6byy8KaBZRSzO/d6u7ILCLsF
         MgAEC0x1v4ivEPwld/EEWAHrzVD8JQMfm3H11DWqGbcXRCpf9AnhOfmEMaDRcdAr3Srf
         QXaQJG2LZnIHU/lR+/CqlpkwVa45vw3YhKyE99EbidERXyikfoosBviXllAHdyZmjnHu
         0FLg==
X-Gm-Message-State: ABy/qLanbR7NSMbm90Ss1q+A79KUWQbCs4HKO1oNombC02dLxQsong6p
        kDAFvMwRrI3vJp2YKbD55iBO+g==
X-Google-Smtp-Source: APBJJlFBbKZc1gO7M8n+dJxiTS+4YHzjapaWo98VW7MNkFMR1mz0AnzM9LtEYi+Sck8117UetH7LZw==
X-Received: by 2002:a05:600c:a388:b0:3f8:f382:8e1f with SMTP id hn8-20020a05600ca38800b003f8f3828e1fmr1001451wmb.24.1689658802067;
        Mon, 17 Jul 2023 22:40:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c234300b003fc0062f0f8sm1253235wmq.9.2023.07.17.22.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 22:39:59 -0700 (PDT)
Date:   Tue, 18 Jul 2023 08:39:56 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     Su Hui <suhui@nfschina.com>, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
        nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
        ville.syrjala@linux.intel.com, mripard@kernel.org,
        ankit.k.nautiyal@intel.com, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/tv: avoid possible division by zero
Message-ID: <d763816b-07c9-4346-8f7c-f95e86cba488@kadam.mountain>
References: <20230717062209.124106-1-suhui@nfschina.com>
 <0cae35ea-7635-383d-cae5-2051abbc6d64@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cae35ea-7635-383d-cae5-2051abbc6d64@intel.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 17, 2023 at 04:52:51PM +0200, Andrzej Hajda wrote:
> 
> 
> On 17.07.2023 08:22, Su Hui wrote:
> > Clang warning: drivers/gpu/drm/i915/display/intel_tv.c:
> > line 991, column 22 Division by zero.
> > Assuming tv_mode->oversample=1 and (!tv_mode->progressive)=1,
> > then division by zero will happen.
> > 
> > Fixes: 1bba5543e4fe ("drm/i915: Fix TV encoder clock computation")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >   drivers/gpu/drm/i915/display/intel_tv.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> > index 36b479b46b60..82b54af51f23 100644
> > --- a/drivers/gpu/drm/i915/display/intel_tv.c
> > +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> > @@ -988,7 +988,8 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
> >   		      const struct tv_mode *tv_mode,
> >   		      int clock)
> >   {
> > -	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
> > +	mode->clock = clock / (tv_mode->oversample != 1 ?
> > +			tv_mode->oversample >> !tv_mode->progressive : 1);
> 
> Seems too smart to me, why not just:
> mode->clock = clock / tv_mode->oversample;
> if (!tv_mode->progressive)
>     mode->clock <<= 1;

This is nice.

regards,
dan carpenter
