Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F319FC4320E
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 19:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D01CE61131
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 19:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244258AbhHFT5s (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Aug 2021 15:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244269AbhHFT5p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Aug 2021 15:57:45 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141BCC0613CF
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Aug 2021 12:57:29 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id o185so13585766oih.13
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Aug 2021 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MF/jpY158To6EQXX0lXK4wBeAKXkbUZOPZcMLvj2pKA=;
        b=hrNvxp1VsGcKekVYog+ETgyNkvHKn2ouDTTHSJ90MKkTVJfZ0JnAyjzIkbRaoiKTKW
         fFSI+fxLToydj8cuARGoYpZNci95367d+eMwpeIuzc2Ah+rpKJNosDJNxLH6VPCGqQJV
         w5qtT3/Rdm1ho0gWOfPUgNa64c3L7KyCmlMKYiphe9IvTrwdDc7q3Mwaigvhy/JRzPyW
         aA+tQCfA/O2vj9T6LWdtN9NwYMFmWTS845LeNRjy54UrQ7ouGY2IbAxqmjj79qps275t
         nyuvoThRuK85u1Bp/rWd3AMQHJPTavkbFsTiDjv+NlSIhCHDJaPqFx15QwsQzkjgWkbw
         0m1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MF/jpY158To6EQXX0lXK4wBeAKXkbUZOPZcMLvj2pKA=;
        b=Q57qVLOX7BmvQWrPR6XnQH+05w++0thBCISTTVEJVnOKu6gOx9WvVaCp4UQOWWp6X7
         aD9rgVCwLodS8O9PdkxHZ/SuMy1Uf95YTxB/WPVUJrsleOm1+J2hXOp2EM6cL8SEGFni
         upEJ4FQybvZVAS+1iokES0xKS7wClzUj3kvDCblnGWSlzLahbBnU+1Ani4xEu8KMqpKo
         j3TzZzhzV/n72A/anXXggwd1KKCJmCndq5gD8yYJOu5RK0ksFsWmJlo5RFRaEOBTev1B
         df2Bp7Mn1KRrZZPGmSVQpIrCPQJHAOQSOYT8PY+JdnpGY+9gHmmeW4pgGG81gNVuUMoU
         G3hA==
X-Gm-Message-State: AOAM531tSTC7QOqASq4DuY+YJyMmv24XWmHZU1/qfu/eMwnwonC7N4xA
        QGSnLTD037bIz59wrEI2Uydzw2pCNmT6z8tFTjk=
X-Google-Smtp-Source: ABdhPJzRSNKmGvNbvRyoSzgRq6E+O9Kzd/sBqr3+djhVmtJy0dMvFGmqRCJDI3aD25wsE4BhCgiQB1bIvJpgQ/eJycQ=
X-Received: by 2002:a05:6808:6d2:: with SMTP id m18mr8542725oih.120.1628279848481;
 Fri, 06 Aug 2021 12:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210806150518.GC15586@kili> <ca0cfa01-e1ef-1ee8-8adc-ebd4fa253e70@amd.com>
In-Reply-To: <ca0cfa01-e1ef-1ee8-8adc-ebd4fa253e70@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 6 Aug 2021 15:57:17 -0400
Message-ID: <CADnq5_OceaWQUjrOWmOykKKVhD+KbE6F_Wq16CyBFPrCQD6vBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check for allocation failure in amdgpu_vkms_sw_init()
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Ryan Taylor <Ryan.Taylor@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Fri, Aug 6, 2021 at 11:09 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 06.08.21 um 17:05 schrieb Dan Carpenter:
> > Check whether the kcalloc() fails and return -ENOMEM if it does.
> >
> > Fixes: eeba0b9046fc ("drm/amdgpu: create amdgpu_vkms (v4)")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vkms.c
> > index 50bdc39733aa..ce982afeff91 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > @@ -482,6 +482,8 @@ static int amdgpu_vkms_sw_init(void *handle)
> >               return r;
> >
> >       adev->amdgpu_vkms_output =3D kcalloc(adev->mode_info.num_crtc, si=
zeof(struct amdgpu_vkms_output), GFP_KERNEL);
>
> Is the line above not a bit long?
>
> > +     if (!adev->amdgpu_vkms_output)
> > +             return -ENOMEM;
> >
> >       /* allocate crtcs, encoders, connectors */
> >       for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
>
