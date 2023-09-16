Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787C7CD37BC
	for <kernel-janitors@archiver.kernel.org>; Sat, 16 Sep 2023 14:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236221AbjIPO0X (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 16 Sep 2023 10:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbjIPO0K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 16 Sep 2023 10:26:10 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB44CE1
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Sep 2023 07:26:05 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401b393ddd2so35300785e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Sep 2023 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694874363; x=1695479163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wuByROzzKWy0dgFTyL5cv38N2mo72GoYzRnh9gqNiOA=;
        b=R5S3tNS6uefZnXIGtKJ23TLNCSSN7IWPi5c9JPN0HlEU9TNXbmemZ5KkxXoh1o/hNW
         O2W3cmRHR4s8phw+coA0LiC8b+QJG0ZDOSDVShLnkGGmuIlyBkbUiwiep8nJ1Ig23YmC
         0xnD6+QPrQC83SKhNMRHqKmHElUJq475cCPPVZX2ZjjAY5Q9uueBgQFB1/FMd+grh3sC
         /R8mz77XqD580stuCJswiryONrYhSiINnsnNfE+L+azEboX/vF32djEgTZUp9YiCMWuS
         oXq8o3QLJq4QJrJf8tO/8Y09bZUFcBe+JhCagSKB1rah1HnB8/z1euisFONrab53uEss
         RFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694874363; x=1695479163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuByROzzKWy0dgFTyL5cv38N2mo72GoYzRnh9gqNiOA=;
        b=sq66FHODKUZwNTj4GRJDBSMLcVqhFST1QdPTKsscXtefqHnNULNkoIyPhms4TfFU45
         I5pG0UYnmq188ETnMP0NwgebtYwfWXQrepftKIf3XuGSI6GBMtDW6pVdcTlULdfFjItc
         qRsMlj4KAb5ipHC3o/aj89dKRa8NV0ij1OoyqPQLtf8hYuccItD5JbIsQp9Tj4d5qq20
         s1qrYqr8p32AAS4dJLuEJNqYgrr29iDD0t9PIQj+oMXzDJbcz7x7OmZ9FGtPdZ0P2nsc
         xwdU7i6k9cDzQX7szc0arykMPViCoicADITKHXRO9QFum7nkSF2L3zL8ZzY6D3sXey3P
         +/6A==
X-Gm-Message-State: AOJu0Yw9IvCnExSY9r+d3dYJigsf/lzQft6H2OitxiWbVFO6vPKGBS4q
        xi1jreyks8kdzmh4RKnhhm9+0A==
X-Google-Smtp-Source: AGHT+IFgjG10KveE648lPazX2ga7MjAWg/VhRg7CJ3ISLz4Oqx1Ua27V4XKEa8rrgx0sxyaBXgEE7Q==
X-Received: by 2002:a05:600c:2058:b0:401:b53e:6c39 with SMTP id p24-20020a05600c205800b00401b53e6c39mr3958856wmg.6.1694874362781;
        Sat, 16 Sep 2023 07:26:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c220600b00402dbe0bbdcsm10285689wml.28.2023.09.16.07.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 07:26:02 -0700 (PDT)
Date:   Sat, 16 Sep 2023 17:26:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Danilo Krummrich <dakr@redhat.com>
Cc:     Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer
 bug
Message-ID: <2ab31d98-931f-4322-8e67-381d21302a7c@kadam.mountain>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
 <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
 <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 16, 2023 at 05:24:04PM +0300, Dan Carpenter wrote:
> On Sat, Sep 16, 2023 at 01:41:43AM +0200, Danilo Krummrich wrote:
> > Hi Dan,
> > 
> > On 9/15/23 14:59, Dan Carpenter wrote:
> > > The u_memcpya() function is supposed to return error pointers on
> > > error.  Returning NULL will lead to an Oops.
> > > 
> > > Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > index 3666a7403e47..52a708a98915 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
> > >   	size_t bytes;
> > >   	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> > > -		return NULL;
> > > +		return ERR_PTR(-ENOMEM);
> > 
> > I plan to replace this function with an upcoming vmemdup_array_user() helper,
> > which returns -EOVERFLOW instead, hence mind using that?
> > 
> > Unless you disagree, no need to resubmit the patch, I can change it
> > before applying the patch.
> 
> Generally, I would say that ENOMEM is the correct error code.  I feel
> like someone thinks EOVERFLOW means integer overflow and that's not
> correct.  I means like if you pass a number higher than INT_MAX to
> kstroint().

The most common error code for integer overflows is EINVAL because the
user passed invalid data.

regards,
dan carpenter

