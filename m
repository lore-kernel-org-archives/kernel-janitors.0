Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F12C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 May 2022 21:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444500AbiEFVgf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 May 2022 17:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444524AbiEFVgb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 May 2022 17:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF0576F4A8
        for <kernel-janitors@vger.kernel.org>; Fri,  6 May 2022 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651872765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dJbJbWsoyM+Ik6q37wpw5Oa4Nh86YRow8ddVHHmJk08=;
        b=JK5FwrLry48xN+2TqybW4GjhX2pOCgz2U1HcaIrFukFni3wSBzGaLxnvSdCioSo+K9Pmex
        wrxB7D5YpfxGbQsGxnXcd3UsKw8bQ+VxrFquU7FiJoiVQIUcb+ACUxOIsEIw+wR9c5ESSh
        Q/3fcZAnCKYfsEyLziiKXVLb5xkH4G0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-9D8w21BkOuOqamYqwXBRXA-1; Fri, 06 May 2022 17:32:44 -0400
X-MC-Unique: 9D8w21BkOuOqamYqwXBRXA-1
Received: by mail-qt1-f200.google.com with SMTP id w21-20020a05622a135500b002f3b801f51eso7043861qtk.23
        for <kernel-janitors@vger.kernel.org>; Fri, 06 May 2022 14:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=dJbJbWsoyM+Ik6q37wpw5Oa4Nh86YRow8ddVHHmJk08=;
        b=Dz6qjF15e7311d2EO80ZaHs16LHHYyYfeb1Sn1IIUDBcBFjDQJs7lF0oD8Ar0cgmCr
         ZNeV0W5YBgUNC38Z9xTaPuak1+iIGEbnYAHZw38YzClxyahtQ1gI5VgniZWSBY87vcLf
         7ZGZhytbfm8Ry1bGk4YMYIdOvHSii6M8oyFKvC5dY4ZPjLBn9pVfKVsdVN4rG/jbExfK
         aCn9/tmh+Z5wOGRQktO/mwJrftvJm7dwMkb/yp/w5/wfJcmqJ/TixO9FUlXdXyY8J1UH
         KWDFkQeMu27QZ81aGmeqLG0r8q3zfACL3MRutHAuFTJC1P7ckzgSDwfN5eqBfZQucZ6j
         d5Vg==
X-Gm-Message-State: AOAM533lXv16n/sM58hXlM5vcTOWSm7ViZcqV+jpQsI2dogq0/7OsYns
        YW8XVVV8AVFc3wjld6geZBdOTavxNBWYt2jKOX7HX7MEvYe9GyisnqKzJQfQsBbkPHTMOINiWwJ
        TVMJ4H/z+MNN5qf620e7D5JFis7eX
X-Received: by 2002:a0c:ab09:0:b0:443:95d9:140c with SMTP id h9-20020a0cab09000000b0044395d9140cmr4170797qvb.84.1651872764246;
        Fri, 06 May 2022 14:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK5FWqqA+iA50nH6ppws5HNXmaCdaMsh8I0itmM43LaQ06P84wOxCI5Gl5CmLPygLNpGGy8Q==
X-Received: by 2002:a0c:ab09:0:b0:443:95d9:140c with SMTP id h9-20020a0cab09000000b0044395d9140cmr4170789qvb.84.1651872763988;
        Fri, 06 May 2022 14:32:43 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id b3-20020ac85403000000b002f39b99f6adsm3164237qtq.71.2022.05.06.14.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 14:32:43 -0700 (PDT)
Message-ID: <9b7eab5df5e63e3fe899bca9ea35f4be8bbff98c.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix a potential theorical leak in
 nouveau_get_backlight_name()
From:   Lyude Paul <lyude@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Pierre Moreau <pierre.morrow@free.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date:   Fri, 06 May 2022 17:32:42 -0400
In-Reply-To: <9ba85bca59df6813dc029e743a836451d5173221.1644386541.git.christophe.jaillet@wanadoo.fr>
References: <9ba85bca59df6813dc029e743a836451d5173221.1644386541.git.christophe.jaillet@wanadoo.fr>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Sorry I totally missed this patch up until now, noticed it while going through
unread emails today. This is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

FWIW, if there's something you need reviews on that hasn't gotten looked at
after a few weeks feel free to poke the nouveau list/me.

Anyway, I will go ahead and push this to drm-misc-fixes in a moment. Thanks!

On Wed, 2022-02-09 at 07:03 +0100, Christophe JAILLET wrote:
> If successful ida_simple_get() calls are not undone when needed, some
> additional memory may be allocated and wasted.
> 
> Here, an ID between 0 and MAX_INT is required. If this ID is >=100, it is
> not taken into account and is wasted. It should be released.
> 
> Instead of calling ida_simple_remove(), take advantage of the 'max'
> parameter to require the ID not to be too big. Should it be too big, it
> is not allocated and don't need to be freed.
> 
> While at it, use ida_alloc_xxx()/ida_free() instead to
> ida_simple_get()/ida_simple_remove().
> The latter is deprecated and more verbose.
> 
> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is more a clean-up than a fix.
> It is unlikely than >= 100 backlight devices will be registered, and the
> over allocation would occur even much later when the underlying xarray is
> full.
> 
> I also think that the 'if (bl->id >= 0)' before the ida_simple_remove()
> calls are useless. We don't store the id if a negative (i.e. error) is
> returned by ida_simple_get().
> 
> Finally, having a '#define BL_MAX_MINORS 99' could be better than a
> magic number in the code.
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index ae2f2abc8f5a..ccd080ba30bf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -46,8 +46,8 @@ static bool
>  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
>                            struct nouveau_backlight *bl)
>  {
> -       const int nb = ida_simple_get(&bl_ida, 0, 0, GFP_KERNEL);
> -       if (nb < 0 || nb >= 100)
> +       const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
> +       if (nb < 0)
>                 return false;
>         if (nb > 0)
>                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d",
> nb);
> @@ -414,7 +414,7 @@ nouveau_backlight_init(struct drm_connector *connector)
>                                             nv_encoder, ops, &props);
>         if (IS_ERR(bl->dev)) {
>                 if (bl->id >= 0)
> -                       ida_simple_remove(&bl_ida, bl->id);
> +                       ida_free(&bl_ida, bl->id);
>                 ret = PTR_ERR(bl->dev);
>                 goto fail_alloc;
>         }
> @@ -442,7 +442,7 @@ nouveau_backlight_fini(struct drm_connector *connector)
>                 return;
>  
>         if (bl->id >= 0)
> -               ida_simple_remove(&bl_ida, bl->id);
> +               ida_free(&bl_ida, bl->id);
>  
>         backlight_device_unregister(bl->dev);
>         nv_conn->backlight = NULL;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

