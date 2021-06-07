Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9700C47094
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 17:18:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE7AB61073
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 17:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhFGRUf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 13:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhFGRUe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 13:20:34 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39ED0C061766;
        Mon,  7 Jun 2021 10:18:43 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id t40so5804468oiw.8;
        Mon, 07 Jun 2021 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Bs0iIp2b+xLwRPkKeIWpOD/7m4nhQ2yrv+tV+dY2+Dk=;
        b=ZfJqjDRtbPhKwBfzpuNEpxC+DixbiXqh1fDLnKXYnFPI9Qlf1ttw6aMTd691KAb0Nw
         ap3EFjQ+F1P/azkjwjFcJeplW20c8Wy6rjIAmiBeQoqKJH06tOpZ1ZxK8mXwXNZmU4Mx
         z1Zyl6+qqWUh4SVUR92ud5048RIyYmOg+5JJNAI8yoCx9nbMxHazeBm79+GM1fF22BzC
         LSNRJ7TCk9ni35039MOrYp56Cn62e7XcsMy2W6AAr53IWdOXTJY2MN+62tsZ0I+Aeu6R
         He586b00SYq/ywaPZ6ehXU4jLQGpDiMhI0UNYVyK9P/mkSM36+TBm2C58avFcUFUoNH7
         iQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Bs0iIp2b+xLwRPkKeIWpOD/7m4nhQ2yrv+tV+dY2+Dk=;
        b=hV47wtoBXe0v17Hmi2BsfF1Gqbj17N/DQXi0w8T7BDb8Im5pg/sodNx/hG1G07SlFd
         l5NVhuMpOX/G/O9/C3XWriNM9TSGABogEfKXQ9nOL5UGxTOHvCPQThzvIOtc9cto6Z1l
         nwy5yLRTeI78A7kH5ZR7+oRPxRBUYgqgfJ6vQcj5HEf+4kwsAVQh+ZIndIz/5SGFu8EU
         x2j9KBOffg/3N3rgKQtbd9pZxeagnmRBgoVczaqU7GX0Dcb7lJIXoxo5Ofqd38GBGNdt
         zG5CYtE2YmZ5aGj4M0bcsvjmXbNBbCVbiyx+dDqzkIG28hebAy5IvvnnMm6z4mDBZfW6
         Z6fg==
X-Gm-Message-State: AOAM530pqtPDxj/bpThJTVCPOvn20wH8DuxLJfzoHHULkFu9GWmeq+BM
        e4H/fdhva3e4qGK9BI7gCYOzSHtk79XadRpTSD+eNGXh
X-Google-Smtp-Source: ABdhPJyirKNeUEEtw5y9m++p4gcGiiOq1LOMwU9dlkkw7YMYbr+3rPlg1bL7kJG8ZiRpSn4RBR+dXRzlWAbHbNNqDsM=
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr196398oie.120.1623086319382;
 Mon, 07 Jun 2021 10:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <ea7ecbef546a03ef71d65bfe82608bb347e6f3c2.1622883895.git.christophe.jaillet@wanadoo.fr>
 <99a5eba3-2d2a-65a8-9b03-a3d4043c5ec5@gmail.com>
In-Reply-To: <99a5eba3-2d2a-65a8-9b03-a3d4043c5ec5@gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 7 Jun 2021 13:18:28 -0400
Message-ID: <CADnq5_PSw_zLDpdpAgxbUKLH54toLyxL23Ytw0q8G+xBzcaeRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a a typo in a comment
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        xinhui pan <Xinhui.Pan@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Mon, Jun 7, 2021 at 6:46 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 05.06.21 um 11:06 schrieb Christophe JAILLET:
> > s/than/then/
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index 89ebbf363e27..1476236f5c7c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -662,7 +662,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_pa=
rser *p)
> >    * @error:  error number
> >    * @backoff:        indicator to backoff the reservation
> >    *
> > - * If error is set than unvalidate buffer, otherwise just free memory
> > + * If error is set then unvalidate buffer, otherwise just free memory
> >    * used by parsing context.
> >    **/
> >   static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, in=
t error,
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
