Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31538C0015E
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Jul 2023 13:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbjGZNpL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Jul 2023 09:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjGZNpJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Jul 2023 09:45:09 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD8510F1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jul 2023 06:45:08 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso7487285e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jul 2023 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690379107; x=1690983907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+jNakEFn9/qqjzKn7/L12W7ZVHM0REFXJJ2LBBHm/A=;
        b=BIS/JiSEFSOYQZGou5+nMQRArM5RskH/QvMHdJWTkiBXcXOAgNwvKiW/JV83QrMEWt
         A/UywcbKi62gmHWcnZI8pgLNHf8ZEf/H1/UenaQ3SolJTi//Jp3dIW7SPvqzX1Bx4h19
         6eYlVCGvvi/azEE9NUSQIip9rqwLXQBcU1z9LkIWrTUbLdSlzQB9G1EG6suUmGsdvrFq
         8cjyuUmt44NqpjlACadFHrSh0pKuMXpewpomiIgxp81qteeopDEmb11iJClq4PVJHtEP
         X49ViGDi8qE3Pdd99vhWgQxe4Cxh/ZC9n9OF+Drq0ax3SJYwsGiml/PgPxgjd1xSLgrH
         uLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690379107; x=1690983907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+jNakEFn9/qqjzKn7/L12W7ZVHM0REFXJJ2LBBHm/A=;
        b=FsmOOgMYA6DPzAVwTOU+FmeDLuITD9ZzH8qyZCgKtmna545aBtTg/91KFsY77VSzmB
         McziNv8nwY45pPOkgtC8xrZ7SnHwdYOpPeRrU31i3EYlZA17fYmkO+MFx5O8NdkiR75C
         po2tXudJ2FxO5BK1UBPDagZcnZiX2hg+gLfY0b1HWYrDgvU67gPln+2DXgQS/sH/7vPe
         /G2kR5/0XfHMrHuEtzZMyiz+JIpSruQj6BfnIYf4Z1QXx2v6EfWo6OlJ4wRbmAIv8R9y
         oZ5H5w42baLMRGfPOfDeZuu6+ZZwDEGE5TR8abLcKqmNy7bQe40hGxRCVFkd3snoCD3+
         liMA==
X-Gm-Message-State: ABy/qLZrTJwbnQUNFbk8Uki0oaM5eWqPbM6gbmLaKHeo6khr7PiUHcf4
        AjVRFoV0cZuUfEaUACaXcO/p4g==
X-Google-Smtp-Source: APBJJlEdRwll4HCrb/SrI25+SHD1gKHKIj224dpt2UqrDSHxNVeQQu//I0av4NRBnloADnXCvbdW3w==
X-Received: by 2002:a7b:c40f:0:b0:3fb:f0b2:20eb with SMTP id k15-20020a7bc40f000000b003fbf0b220ebmr2109232wmi.1.1690379106266;
        Wed, 26 Jul 2023 06:45:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l19-20020a1c7913000000b003fc07e17d4esm2071792wme.2.2023.07.26.06.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:45:05 -0700 (PDT)
Date:   Wed, 26 Jul 2023 16:45:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     Gerrit Renker <gerrit@erg.abdn.ac.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, dccp@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] dccp: Allocate enough data in
 ccid_get_builtin_ccids()
Message-ID: <c962e03c-6091-483a-90f2-4db8afe5283a@kadam.mountain>
References: <35ed2523-49ee-4e2b-b50d-38508f74f93f@moroto.mountain>
 <ZMEX4VOYzz8IvRUQ@corigine.com>
 <ZMEY9aPRSpiy+qie@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMEY9aPRSpiy+qie@corigine.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 26, 2023 at 03:00:37PM +0200, Simon Horman wrote:
> On Wed, Jul 26, 2023 at 02:56:01PM +0200, Simon Horman wrote:
> > On Wed, Jul 26, 2023 at 01:47:02PM +0300, Dan Carpenter wrote:
> > > This is allocating the ARRAY_SIZE() instead of the number of bytes.  The
> > > array size is 1 or 2 depending on the .config and it should allocate
> > > 8 or 16 bytes instead.
> > > 
> > > Fixes: ddebc973c56b ("dccp: Lockless integration of CCID congestion-control plugins")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Reviewed-by: Simon Horman <simon.horman@corigine.com>
> 
> Sorry, I was a bit hasty there.
> 
> > > --- a/net/dccp/ccid.c
> > > +++ b/net/dccp/ccid.c
> > > @@ -48,7 +48,8 @@ bool ccid_support_check(u8 const *ccid_array, u8 array_len)
> > >   */
> > >  int ccid_get_builtin_ccids(u8 **ccid_array, u8 *array_len)
> > >  {
> > > -       *ccid_array = kmalloc(ARRAY_SIZE(ccids), gfp_any());
> > > +       *ccid_array = kmalloc_array(ARRAY_SIZE(ccids), sizeof(*ccid_array),
> > > +                                   gfp_any());
> 
> The type of *ccid_array is u8.
> But shouldn't this be something more like sizeof(struct ccid_operations)
> or sizeof(ccids[0]) ?

Aw crud.  Actually the code is fine isn't it.  I thought it was saving
pointers but actually it's saving char.  *Embarrassing*.

regards,
dan carpenter

