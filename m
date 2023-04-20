Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793E6C77B76
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 14:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjDTO6I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 10:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233002AbjDTO6H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 10:58:07 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D157D4C18
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 07:58:05 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f086770a50so5270485e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682002684; x=1684594684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m26NCEtvxnDKnGDOaphgJmSpOW9a1HnF4PVE9T23Ik4=;
        b=D5wQKkPSIsO/e/gN9d8t2lF30U1BTVfcoRBuXrMHbRe/mSBCUC01w1pbKVhNzcdAoc
         QG/fYcM4jlIEPMHJRKcPAvb8l7/R7+vxiUkh1dkAilMvxWOTwfvsmtgBfnvuiNSLRcX4
         AodhDik8Ze1+UgmxwHBoZ7hHgCYSGCCpc1k16pkHspoyiTRDzy+jqPB5ObnW18rnJb2k
         SGCd7v3LWFIuD7VdEg94XSl/EiNKTf4z/WgQEDqfO9hwGMxAegUKBSZX2EBnsi/5dBHX
         BrWl4zKFmAhSHGakxocOK6A39JX74skjmUuRhEjkl3cbVgNxSvU730pSnWj+Ne5TQQPG
         AXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002684; x=1684594684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m26NCEtvxnDKnGDOaphgJmSpOW9a1HnF4PVE9T23Ik4=;
        b=Cz/eqyiQy2S3pKp73IBIHhxjTvtpmm7Fs+DVIYm+5KrvrReTzUEpltf1T615x7qOaz
         Q5oo11pfnAA1yOEoOIoX1KaRcVrhdluh4T/glAK+IxiMQSeK7pqAdm9Y7xmHyL9BNX1n
         Bxd6YhZ2iD3okBB3PUkc3oZA+ncU/oJ/tbjcGJ0trtorkARf/z4n340hHGbAsAU/fUlD
         kGcF3126ah9puuQ2fe8MdCkrgCJJnyFvzNk0gNd3ZFk0NgKn/TgILSrUeHub6hMesb1P
         8Gx/EWir27SUB6M2Fwl1sKv9Gd0xU+Ebm8zvOBsrc9+kXIMrcxmNmJ+tPwJV2Xvq/Xmf
         W76Q==
X-Gm-Message-State: AAQBX9dsel0FIYxd4hzFs/dw0r18C5VvFBXw1HHJRfqQYbreXmcz2f64
        Hqnm+ImUOApU2G3KzSj2bN/HSBnQ4HCZmjC40Imh9WLC
X-Google-Smtp-Source: AKy350alY+YV/JyBnkHXvwjRVGmDc8mU5weLjwGUlMJaA+sj96d5HrEXWEeVSupq72D14Ub+HVRwdQ==
X-Received: by 2002:a05:6000:1c9:b0:2f9:7841:f960 with SMTP id t9-20020a05600001c900b002f97841f960mr1478308wrx.21.1682002684313;
        Thu, 20 Apr 2023 07:58:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j3-20020a5d6183000000b002faaa9a1721sm2141118wru.58.2023.04.20.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 07:58:03 -0700 (PDT)
Date:   Thu, 20 Apr 2023 17:58:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] counter: rz-mtu3-cnt: Unlock on error in
 rz_mtu3_count_write()
Message-ID: <25a095bc-2e95-4fc4-80f6-66c4ab402ef9@kili.mountain>
References: <93ec19d1-3b74-4644-9f67-b88c08e79752@kili.mountain>
 <ZEFJcak7Gd/Xygf7@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEFJcak7Gd/Xygf7@fedora>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 20, 2023 at 10:17:21AM -0400, William Breathitt Gray wrote:
> On Wed, Apr 19, 2023 at 05:23:55PM +0300, Dan Carpenter wrote:
> > The return -ERANGE error paths need to call mutex_unlock(&priv->lock);
> > before returning.
> > 
> > Fixes: 25d21447d896 ("counter: Add Renesas RZ/G2L MTU3a counter driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> The changes in this patch are for rz_mtu3_count_ceiling_write(), so the
> title of this patch should be fixed.
> 

Huh.  That's weird...  I don't know why I got that wrong.

> > ---
> >  drivers/counter/rz-mtu3-cnt.c | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
> > index a371bab68499..aeadce5e2853 100644
> > --- a/drivers/counter/rz-mtu3-cnt.c
> > +++ b/drivers/counter/rz-mtu3-cnt.c
> > @@ -358,19 +358,23 @@ static int rz_mtu3_count_ceiling_write(struct counter_device *counter,
> >  	switch (count->id) {
> >  	case RZ_MTU3_16_BIT_MTU1_CH:
> >  	case RZ_MTU3_16_BIT_MTU2_CH:
> > -		if (ceiling > U16_MAX)
> > -			return -ERANGE;
> > +		if (ceiling > U16_MAX) {
> > +			ret = -ERANGE;
> > +			goto unlock;
> > +		}
> >  		priv->mtu_16bit_max[ch_id] = ceiling;
> >  		break;
> >  	case RZ_MTU3_32_BIT_CH:
> > -		if (ceiling > U32_MAX)
> > -			return -ERANGE;
> > +		if (ceiling > U32_MAX) {
> > +			ret = -ERANGE;
> > +			goto unlock;
> > +		}
> >  		priv->mtu_32bit_max = ceiling;
> >  		break;
> >  	default:
> >  		/* should never reach this path */
> > -		mutex_unlock(&priv->lock);
> > -		return -EINVAL;
> > +		ret = -EINVAL;
> > +		goto unlock;
> >  	}
> 
> Normally, I like "goto unlock" patterns, but I think in this context it
> makes the flow of code confusing with the mix-match of the switch cases;
> default case jumps with a goto, but RZ_MTU3_* cases passes will break,
> yet RZ_MUT3_* failures have a goto path. Rather than a "goto unlock"
> pattern, I'd prefer to see simply mutex_lock() called for these ceiling
> checks. That also has the benefit of reducing the number of changes we
> have to make for this fix.

Sure.  I'll resend.

regards,
dan carpenter

