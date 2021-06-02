Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B61C47083
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 16:01:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C075C61582
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 16:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbhFBQDS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbhFBQDR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Jun 2021 12:03:17 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C35BC061574
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Jun 2021 09:01:17 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso1798216pjx.1
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Jun 2021 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w9D8gmzd48+7hCu/0laZLimDBPPZQECiByEMKXfVQU0=;
        b=dS4ZXV+1szYlahKcClW16yvYCi0IKYfsspCtn3ig+zEWoImNwGahfCo5SoQM1p5Xcn
         OrVBdHweofuCV7gd6E5Cabrrh4UdQTWfzC05bEmD1szngLT3WWA2yL1D8Bv+qW6JJiJ3
         KvHtsb6D9HbADyIt3eyiyJ4DCQIw85f2lSF8t1na1dFfScFw1C7AvEafBauGOAkuYIov
         z/uIO88khUmRszG2SriMBcNdMTyrvY+MY/heo68n1CaG97mcdsvhZoKy9bZKtsLFfFlb
         EI/wfoG+KClgGWeK1ie4D/CYBE5SGcp5CtBsLUcayXKRYFFNvc15zzRxHgIUeUhaY1/W
         NSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w9D8gmzd48+7hCu/0laZLimDBPPZQECiByEMKXfVQU0=;
        b=LSkNP9G3oSa1n5GOevGCf2mA06QzWGi+EoGT4eccPS7NerAuoU8B+7X/L+MZ3Aalfv
         1IzUND37gYIykxRe7J+W3lgp38OAfQ2j9u+rQI68+MaTNqtsBwAs+eIkSVJOAo+oEuuw
         5Hx89iH6tqJXgK1xoBTRIvRZLJsEEttwQyKC0T+z1nc7kD2X2L4s0duEQHb2pLTlyxlT
         CgCBKswLHXWMZgx2gdlwOQ1JH+vYV6ApwTT3g8gxi6I1aH18ilu0x3/3Ki+oD3Vya6pX
         /nnwWnJltzSkJfoPOGss1y5ChhUclUruTq4+7NrguW45Hf7e7s7HYPvBQiW609DBW44v
         yIig==
X-Gm-Message-State: AOAM532Jgz6H7hp7hdBLoqP4HIFIsZ2BRgc0IRIfZTox0Xuhi8XAQLET
        fM47s6J0MLjBaloQoBQYIMY=
X-Google-Smtp-Source: ABdhPJwlDOXV1qvVUFEeyeE/slmrAUSq77asnDhdQEj+EpL0/zDPhNjHOqo9ENwRGPSposDfnr0usw==
X-Received: by 2002:a17:902:e551:b029:103:c082:ba with SMTP id n17-20020a170902e551b0290103c08200bamr18389092plf.3.1622649677060;
        Wed, 02 Jun 2021 09:01:17 -0700 (PDT)
Received: from fedora ([2604:2000:efc0:108:b082:f3a8:abff:a570])
        by smtp.gmail.com with ESMTPSA id r16sm93411pfq.140.2021.06.02.09.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:01:16 -0700 (PDT)
Date:   Wed, 2 Jun 2021 12:01:10 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <YLerRlm8j+ySlZi4@fedora>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
 <20210601205006.GA10983@kadam>
 <20210602144752.GC10983@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602144752.GC10983@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 02, 2021 at 05:47:52PM +0300, Dan Carpenter wrote:
> On Tue, Jun 01, 2021 at 11:50:06PM +0300, Dan Carpenter wrote:
> > On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> > > The other thing which might be interesting is if you pass a NULL
> > > to IS_ERR() and then dereference the NULL then print a warning about
> > > that.  This has a lot of overlaps with some of my existing checks, but
> > > it's still a new idea so it belongs in a separate check.  It's fine and
> > > good even if one bug triggers a lot of different warnings.  I'll write
> > > that, hang on, brb.
> > 
> > 100% untested.  :)  I'll test it tonight.
> > 
> 
> This test is decent, but I ended up making a few changes:
> 
> 1)  My devel version of Smatch had a new bug in it which caused some
>     false positives.  Fixed now, hopefully.
  
Many thanks! Gonna check today.

> 
> 2)  The test:
> 
> 	if (get_state_expr(my_id, expr) != &null)
> 		return;
> 
>     check was not strict enough.  I realized that I knew that from
>     square one but I was lazy.  So now I have introduced a global helper
>     function and updated the code:
> 
> bool expr_has_possible_state(int owner, struct expression *expr, struct smatch_state *state)
> {
>         struct sm_state *sm;
> 
>         sm = get_sm_state_expr(owner, expr);
>         if (!sm)
>                 return false;
> 
>         return slist_has_state(sm->possible, state);
> }
> 
>     I replaced the test with:
> 
> 	if (!expr_has_possible_state(my_id, expr, &null))
> 
> 3)  The warning message was too vague and too similar to other warning
>     messages.  It should be something unique to the test.  It's now:
> 
> 	sm_error("potential NULL/IS_ERR bug '%s'", name);
> 
> I'll post the results tomorrow.

This is great, will be a nice bug to check for beginners like me.

> 
> regards,
> dan carpenter
> 
