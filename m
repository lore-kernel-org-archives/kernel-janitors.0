Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED63CD37BB
	for <kernel-janitors@archiver.kernel.org>; Sat, 16 Sep 2023 14:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235345AbjIPOYq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 16 Sep 2023 10:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjIPOYO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 16 Sep 2023 10:24:14 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1381B1
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Sep 2023 07:24:09 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4018af103bcso20085535e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Sep 2023 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694874248; x=1695479048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VUAsOBNA2UelmG0YB0ECv/9F8gno9lGmN4dd2u9r00=;
        b=gjmIbvROmUcgdaZskP++LbmCiowqZL9PNr3vI+ZzYhbZKP36geq0ou0n4Caysnv+w6
         JG54s751mS3dtCES1fyHipYE1Xx5ArbOhbHPX1XJAREAxaKCD8HPCCbc6zKoBDkgip+x
         wDzkUaZntWuQD9yoDMSF96AoPosCkD3xsJoIRwyrilXcOf1nMrXg7gU8yBlZ3+SAyKmD
         vMGZDtpBR9wLFitF3kDdkIKRcEGYUW8DwHiNRiIr34JqTCiNwXV+e9xMgqOwnsi7KVMt
         uJBV+kWw4P5wAOj1hUhZ6ssn+EQhgvAnU9G6AUU4jFdPSkcmGEwOGmNqU3OQOs4CDJlR
         b66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694874248; x=1695479048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VUAsOBNA2UelmG0YB0ECv/9F8gno9lGmN4dd2u9r00=;
        b=bWTfa3f7DH9XaTP7PW7WT0KWN62FM8p8UJunx6KN7FD3jQL/M+Pti5XjkQM///Z642
         m5hGRSVidPJOhVU0SJGZeDLpZ7rJfLWgpA2KMtJFHg2/ayhWgxmuAuyHfUZonNkMFNNJ
         is/4FRLNd5Y3WUSLbTnyLmM8mJ4CVwr72ZVl542k5j6Crdwfm/qithg7tqUcYfDY4MpJ
         kWhw/3AV8zvGcFlu5qnyC/SfbRHU8YWE3uLA3L1lOz79FlFuw6BHdDcCTH1w1j3QIpP+
         0SDNOHTJb6t96KAkD/IcqZPrA0DBeRLeRm6wxgR0QWKLUZdw8cVqHUEepMv8H9RvRo0R
         0bIA==
X-Gm-Message-State: AOJu0Yxha0mCS1ejuGbxGoa3UJeTxMQ//NTwpW5+VJq0jjdgu2j2/Zfr
        zpO40FMZjt0lbQyPAdY5iCGEOQ==
X-Google-Smtp-Source: AGHT+IFtFYGIZIADf3ER5VqIcxXW6g6h2GQovX61KCfsw1b/Wj/OY0SFnQoRu2LYqqjRK/Bmdju5HQ==
X-Received: by 2002:a7b:cd0d:0:b0:3ff:516b:5c4c with SMTP id f13-20020a7bcd0d000000b003ff516b5c4cmr3514084wmj.18.1694874247889;
        Sat, 16 Sep 2023 07:24:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c235300b003fe2a40d287sm7552003wmq.1.2023.09.16.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 07:24:07 -0700 (PDT)
Date:   Sat, 16 Sep 2023 17:24:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Danilo Krummrich <dakr@redhat.com>
Cc:     Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer
 bug
Message-ID: <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
 <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 16, 2023 at 01:41:43AM +0200, Danilo Krummrich wrote:
> Hi Dan,
> 
> On 9/15/23 14:59, Dan Carpenter wrote:
> > The u_memcpya() function is supposed to return error pointers on
> > error.  Returning NULL will lead to an Oops.
> > 
> > Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > index 3666a7403e47..52a708a98915 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
> >   	size_t bytes;
> >   	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> > -		return NULL;
> > +		return ERR_PTR(-ENOMEM);
> 
> I plan to replace this function with an upcoming vmemdup_array_user() helper,
> which returns -EOVERFLOW instead, hence mind using that?
> 
> Unless you disagree, no need to resubmit the patch, I can change it
> before applying the patch.

Generally, I would say that ENOMEM is the correct error code.  I feel
like someone thinks EOVERFLOW means integer overflow and that's not
correct.  I means like if you pass a number higher than INT_MAX to
kstroint().

But I don't care strongly about this.  You can change it if you want to.

regards,
dan carpenter

