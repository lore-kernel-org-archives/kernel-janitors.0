Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40ABC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 May 2022 14:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350337AbiETOjR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 May 2022 10:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350399AbiETOjP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 May 2022 10:39:15 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D03170663
        for <kernel-janitors@vger.kernel.org>; Fri, 20 May 2022 07:39:15 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-e93bbb54f9so10482353fac.12
        for <kernel-janitors@vger.kernel.org>; Fri, 20 May 2022 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3AATNQ/IdLv7D+IZQaJo6R0yqMY6O4deWWVsnQKrYJs=;
        b=fPEPwNR4QO06ts/eTnUsek4bIVrwDoYxJLDoR71u5qHdJiV8sbreebVmFGTuZ7jRor
         dHOnetfnplxqxtHKFp7nUVfO7t88ASJFCfU4oGBfsUcEhmwC/+MYzdt3P2hDTLu08ox2
         KC5MJ9CfkZy4Huv5jJFoa5wLQAtiQensckNYy7dcdyKwOTAoXqjWteozN5PET34Z4sjY
         R7Tu1GfIbm9Or9RuSkEgwcXi0p921MFClfnY2wNxFP8vRUIM0Bpu63vw92n7htx6jjwV
         yKMt1EHhU8VreAsaIXsbU97q/BfeWUQKaSbazcE9qXa9clYk/G3+k8/lrfrnT5IHEtwX
         0Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3AATNQ/IdLv7D+IZQaJo6R0yqMY6O4deWWVsnQKrYJs=;
        b=vLx4Z3r/gZ/JC1O9FaJcE0Teg2NUQBIcjn3bOIxCrh1aRvJnF4empAxcV/htGoGN31
         WxWq85Mo3kPOnROcl9bSRxltezcGR0Ot8/Sl5YwpPV4zdKRoh5HgvKqzeI58rvhYm2s+
         WGjpuSt+7107mHSJzerOrRvrh52jgeYwNd6YKA4JsF6f5TYrChBOoe50Svh52uJvZNaL
         9vhBM9kbgZHRbHe8hXW60cQdlfcMgflrISwevU2EniHBLYLGmWbAexOxCqNZk8dcDJG/
         bamD73i6IBMb5N6a+mLHEs52R3xUCpXPmFu4JtN54bq1xPr37XcxY5YdosGUGvZ1hXHA
         AZ+Q==
X-Gm-Message-State: AOAM532/+jk0BvMkf1lyhCbv91wkGqL0DAmT9fWzqbJtZWjUwOrhpgnY
        Tl8SuwGJkotq0FNke7HSFd+YoLGN3+OKmltUsY0=
X-Google-Smtp-Source: ABdhPJxXGBZos0xve04f14jjuTfOUmCA6aeT9fL+zJFXKckfadmgwVvr+8V/rC1CpwzLipEJQhU+Q+OW05mb1u4Ife8=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr5969606oaa.200.1653057553749; Fri, 20
 May 2022 07:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <YoH3zD7umruSyPms@kili> <b54971f1-e0d2-35a2-f3cf-0486569b63f5@amd.com>
In-Reply-To: <b54971f1-e0d2-35a2-f3cf-0486569b63f5@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 20 May 2022 10:39:02 -0400
Message-ID: <CADnq5_MwJ4YO+oZKEkZndu5dDRVyRSkT_dgK06v6m1Fm67k9xg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Off by one in dm_dmub_outbox1_low_irq()
To:     Harry Wentland <harry.wentland@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jude Shih <shenshih@amd.com>, kernel-janitors@vger.kernel.org,
        Leo Li <sunpeng.li@amd.com>, Simon Ser <contact@emersion.fr>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Roman Li <Roman.Li@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Thu, May 19, 2022 at 4:53 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2022-05-16 03:05, Dan Carpenter wrote:
> > The > ARRAY_SIZE() should be >= ARRAY_SIZE() to prevent an out of bounds
> > access.
> >
> > Fixes: e27c41d5b068 ("drm/amd/display: Support for DMUB HPD interrupt handling")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 6edfc0963dab..c4f122c6faec 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -770,7 +770,7 @@ static void dm_dmub_outbox1_low_irq(void *interrupt_params)
> >
> >               do {
> >                       dc_stat_get_dmub_notification(adev->dm.dc, &notify);
> > -                     if (notify.type > ARRAY_SIZE(dm->dmub_thread_offload)) {
> > +                     if (notify.type >= ARRAY_SIZE(dm->dmub_thread_offload)) {
> >                               DRM_ERROR("DM: notify type %d invalid!", notify.type);
> >                               continue;
> >                       }
>
