Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB573EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 13:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbjGRN1h (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 09:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbjGRN1e (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 09:27:34 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199D1124
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 06:27:33 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so59314735e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689686851; x=1692278851;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y5ykKVFj8XRj1akWlI9kL56icXreWp0y3Oh8lxwnYUo=;
        b=HAvzA8Kh6KU7bl55fFVekoyCC5Ill+dInNj/fArVx9xD4Ijq8+dSv/fFyv3qLaHu3Q
         p5kPMVljBJX/PQIix7A1DIp+pOMP6Ch1/UbNPNFUnIKrPNUQHXsFIw2LnoKy9MkvG+vi
         BALADdhrffpdXro+li7hwMSjKCafCHUVS3lGvaFpXd9Gn27UCS8yFLeV3ZFiXCHzWZVW
         xj+/oXfTQGLbOijuIprw+avrNlY3u3Ma5gGvlNve54UvKBjcgUvxQb/MSpNywohDUmP5
         u0EQwA7NJsy0/bgD4Jx7CvsJ5A5iKi5zlNKIUsqmGcQkNkl5dKifKXxl4oggrGaAhpPh
         aWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689686851; x=1692278851;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5ykKVFj8XRj1akWlI9kL56icXreWp0y3Oh8lxwnYUo=;
        b=SBUK3MBpbuljZEIOrxOMAmjQLFsd6IK6bXFth19ZvpuWMbBwaFnSaPhxBN4lEbsQLs
         Qkpmo6WFV4cQQVuRNxAEI1Ab++uFjk+aojmeKL/LOUJjmxTe1np+I2h0v3NZU5ps4S0F
         qXRQuTAb2v1wAsOcR5TxiRmIFNsAH4zTCnZfGO8rcu9HgiZje5gqx+R6lLYNy+lfWsNO
         Jl95TjRhI4vVcE2SyDGBZohtf2aoNkG9dbBdA0E7vGA/jtQbNF7xU5uHNzvfWIuqrqGY
         DR/7csKO20fmRakBXqkvQSd98Y2iXRO56UyvlhiEHcZ3xYBfX4puYHXeqbTfQWF7gK+5
         mqGQ==
X-Gm-Message-State: ABy/qLa137Bmz0IVVAP8Zq79UQA9b24kcnmr4mntcZo0Hor+bSAg9hbF
        np0xk7AMkVxeVlxd5iGso8psEw==
X-Google-Smtp-Source: APBJJlEix09qvK9nzkt0uYSg486fNum9sk0vRVjigln/Sfac5scnIuLZd4IB/OLlDHbgZqF8k333Rw==
X-Received: by 2002:adf:ff84:0:b0:314:dc0:2fca with SMTP id j4-20020adfff84000000b003140dc02fcamr14060054wrr.29.1689686851489;
        Tue, 18 Jul 2023 06:27:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z23-20020a1c4c17000000b003fbe791a0e8sm2180772wmf.0.2023.07.18.06.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 06:27:29 -0700 (PDT)
Date:   Tue, 18 Jul 2023 16:27:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     suijingfeng <suijingfeng@loongson.cn>, conduct@kernel.org
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Message-ID: <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Basically everything in this email was wrong to a kind of shocking
degree.  For example, ignoring kmalloc() failure is a bug so the fixes
tag is definitely warranted.  But then you called me "bare brained"
which seems like a personal attack so I'm going to report this as a code
of conduct violation.

regards,
dan carpenter

On Tue, Jul 18, 2023 at 08:32:02PM +0800, suijingfeng wrote:
> Hi,
> 
> 
> Thanks for the patch.
> 
> 
> The commit title generally should be 'drm/looongson: Add a check for
> lsdc_bo_create() errors'
> 
> not 'drm: loongson: xxxx'
> 
> 
> On 2023/7/18 15:01, Dan Carpenter wrote:
> > The lsdc_bo_create() function can fail so add a check for that.
> > 
> > Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
> 
> Please drop this Fixes tag,  because you patch just add a error handling.
> 
> Yes,  the lsdc_bo_create() function can fail, but this is generally not
> happen.
> 
> Even if the fail happened,  your patch is not fixing the root problem.
> 
> 
> I know that you create this patch with the bare brain,
> 
> I would like hear more practical usage or bugs of this driver.
> 
> And mention more in the commit message is preferred.
> 
> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/gpu/drm/loongson/lsdc_ttm.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
> > index bb0c8fd43a75..bf79dc55afa4 100644
> > --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> > +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> > @@ -496,6 +496,8 @@ struct lsdc_bo *lsdc_bo_create_kernel_pinned(struct drm_device *ddev,
> >   	int ret;
> >   	lbo = lsdc_bo_create(ddev, domain, size, true, NULL, NULL);
> > +	if (IS_ERR(lbo))
> > +		return ERR_CAST(lbo);
> >   	ret = lsdc_bo_reserve(lbo);
> >   	if (unlikely(ret)) {
