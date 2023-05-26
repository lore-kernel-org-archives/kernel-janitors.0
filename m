Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41CEC7EE23
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 13:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243560AbjEZNOe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 09:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjEZNOd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 09:14:33 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACD4119
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 06:14:32 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-309382efe13so464867f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685106870; x=1687698870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uP0c83ESIjrbA6T16gcSHrkcwMv/FlpyLO+N8zd+gg=;
        b=TOwehJhodC6gHEBRUE1HAPxSsz0zl1mkzHQPqgdBpCzJKwhHc6W/J+QUvHy+dGJ18F
         P5LLWX2HbAykVl/0A1DyGiPpg9vb9B53HX9ZWFcLcjS9GN9tMDVGat49EFuBR/pnY5+B
         dS1mSZbVzoO02rQt7dtPjBHz9vIH+gY9EybiRWmU5vX7Ix4Ilil+EKsVF3Wh+VeiUpp8
         HdGLNgFBT/wwbUEhd4pgWmpKPFLuBm1uZop+IxEAmr9w0IqtVI+OcCa2NQmKDNd0/USi
         /D/6kv9XOzG7I0CzLumnyuWKNPpJTmYk+HChqvgPv1J0QJNt2dx5bBZ9yPYn7H3uMiyV
         +PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685106870; x=1687698870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uP0c83ESIjrbA6T16gcSHrkcwMv/FlpyLO+N8zd+gg=;
        b=h82hBnLpvKuIscN4JoxP6WN/f2+NF+kUc43gH7sfhFHafKaP6BKyeIjZIbZLKPjQm3
         3Ght9UtoYN62A3CBemjgsmhmgL5xUo94CFvZAvgB1VslH84BLAb/axVWvQoGjW7BswkQ
         1MEpWxNVDDgcPGh1fqBBHJr0RpMEIxsxHRk5dVbeZehtLs52KFXIoii/tLbhgLK+AvsD
         utBABToXBhM0zOR8F8xVNwuBelwuZNsrAUxNp6/Tkt9yYiqfmGAK5k6aVQfdC1p907Gu
         7NAiYODtPe6YSzW1qYOR6vz0FvD48F7Sj53vdYU+Msko1xtNweam4Rz8g+pat/b5bMa0
         /oEg==
X-Gm-Message-State: AC+VfDzNyGejRxxDDCgyURKm9+8HP1ses6iOmjdFDf+/vh2zrMMf2bFH
        /AM6NFOqC5XCSML24X33bm9MAA==
X-Google-Smtp-Source: ACHHUZ7r0ceAaklYYM0XDBW9/Wk+dbQUUKjvZm2DDJGNirpQg/drCOQyIw6wYmb4JwqnB4+sdjGALA==
X-Received: by 2002:a5d:590d:0:b0:309:3bc3:7d25 with SMTP id v13-20020a5d590d000000b003093bc37d25mr1360702wrd.62.1685106870526;
        Fri, 26 May 2023 06:14:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d6849000000b003078c535277sm5052766wrw.91.2023.05.26.06.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:14:27 -0700 (PDT)
Date:   Fri, 26 May 2023 16:14:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andi Shyti <andi.shyti@linux.intel.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftests: fix an error code in copy()
Message-ID: <6b5fd74c-b98f-4e97-a562-e9739fd03873@kili.mountain>
References: <f6b876f1-4dd7-4d96-bee5-966817cc1644@kili.mountain>
 <ZHCs2RU6+SNkq0GA@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHCs2RU6+SNkq0GA@ashyti-mobl2.lan>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 26, 2023 at 02:58:01PM +0200, Andi Shyti wrote:
> Hi Dan,
> 
> On Fri, May 26, 2023 at 02:59:31PM +0300, Dan Carpenter wrote:
> > Return the error code if i915_gem_object_create_internal() fails,
> > instead of returning success.
> > 
> > Fixes: cf586021642d ("drm/i915/gt: Pipelined page migration")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/i915/gt/selftest_migrate.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > index e677f2da093d..a26429fd5326 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > @@ -55,8 +55,10 @@ static int copy(struct intel_migrate *migrate,
> >  
> >  	sz = src->base.size;
> >  	dst = i915_gem_object_create_internal(i915, sz);
> > -	if (IS_ERR(dst))
> > +	if (IS_ERR(dst)) {
> > +		err = PTR_ERR(dst);
> >  		goto err_free_src;
> > +	}
> 
> I think it was intentional to return '0' when
> i915_gem_object_create_internal() failed, as we are not testing
> object creation here.
> 
> I don't really mind this patch, but, on the other hand, returning
> an error value here might provide a biased information.

Something we could consider is to make it more obvious that it's
intentional.  Smatch counts it as intentional if there is an "err = 0;"
within a few lines of the goto.

But let's just leave it.  I've already marked this static checker
warning as dealt with.  If I see it again and maybe that will motivate
me to add an err = 0; assignment.  People imagine that kernel code must
be 100% perfect with no static checker warnings etc but really it's
almost the weekend and this is fine.

regards,
dan carpenter

