Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D1EC49361
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 21:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C5C561279
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 21:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234580AbhFRVU6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234574AbhFRVU5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 17:20:57 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9C3C061574
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jun 2021 14:18:46 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id z14-20020a4a984e0000b029024a8c622149so2780516ooi.10
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jun 2021 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i0K+CAkNDpvB9BB97WZi89Hi6upuBxwc1H/Mi+DoJdg=;
        b=fnkDSVaxmmiYYY7PApmGvgt3XGZMKQQuXdKVCe8SV5LmeC02fsTYaSifl9w/lKEHex
         1Z4pBuWzh9z0n4hEZBwZENE71tqMxeS5wpROgfbo1WuaMGjwZPc1kjqx+CjzQMhJysKo
         wnEN6bmn8EindP4YDnEdnDMtpRivzjOF8QCxsz3woF3poD2CS8v7/1Rv15/ISBXBHxht
         Q+ec7OplAgnu7st7fbSptLw3eqt+rjdvA3PtcnFCs3mt0lCh1SDD3DboCKfo/cBzTPhU
         Wd7E19I+l5gfE+AyJC2lQBpO26flNLHi1WG7YivbYHRfepAl0NA1jA/2ZX/E4MEAA6b2
         Ikdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i0K+CAkNDpvB9BB97WZi89Hi6upuBxwc1H/Mi+DoJdg=;
        b=t9sU/qkW16sAH6Zu6drJj7tCeOAXLRjDVr+NpkKGTMGecFZmayh3bFR7Lf68hRlrQK
         XfL4LbwThxvm70Lc+QDmB2zz518RDRNdwWJfWYfX71ryD49ELOvJ9ocyUNsttYiMv/rX
         ySiv2TGjtW5XRUpVQ+VNVDXwuFhQe1jJHNa1162tdF9HTMKEypDR22lMVaMmDEMwjcq0
         OTa40XsBeT1OlPUotXPDLVkmjbs0n8A1f1dV/zTYVIp6IS7CVdyWewETR+c6rI1ZZA5z
         Ior5+GGDRXW/xgcy4WDx8XkEkOvcJAxLUfyLbJWRqooQExzJI+VsuBwQbWfUmYY592gP
         HEmQ==
X-Gm-Message-State: AOAM530WuM1STP7Sq+PI0Ii73r/EvBTl8bf2MxvcWHJYeLcUtZ2h+dDS
        +QlB3+uYk7y93bVZx9vE3qOzNW86zA9WR8liSpo=
X-Google-Smtp-Source: ABdhPJwAdPB2OKndxiBb3QLHU+rMPZGzghYSrerKY4S9jGUMqziKf7k9wPNnlVoECnFAIi2jVZbvAGsi+JDiVVIGxbk=
X-Received: by 2002:a4a:2242:: with SMTP id z2mr10559229ooe.90.1624051126161;
 Fri, 18 Jun 2021 14:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <YMxbQXg/Wqm0ACxt@mwanda> <fadcee22-d830-c1be-09f0-9788b98c45ec@amd.com>
 <adee15a2-f531-688c-1121-7504163ae441@amd.com>
In-Reply-To: <adee15a2-f531-688c-1121-7504163ae441@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 18 Jun 2021 17:18:34 -0400
Message-ID: <CADnq5_MtwTXEv=HitiyBfdSyBb-izSRiR3W=zxKNKRNvxdKO1A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()
To:     Felix Kuehling <felix.kuehling@amd.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 18, 2021 at 11:40 AM Felix Kuehling <felix.kuehling@amd.com> wr=
ote:
>
> Am 2021-06-18 um 4:39 a.m. schrieb Christian K=C3=B6nig:
> > Am 18.06.21 um 10:37 schrieb Dan Carpenter:
> >> There is a reversed if statement in amdgpu_preempt_mgr_new() so it
> >> always returns -ENOMEM.
> >>
> >> Fixes: 09b020bb05a5 ("Merge tag 'drm-misc-next-2021-06-09' of
> >> git://anongit.freedesktop.org/drm/drm-misc into drm-next")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Most be some fallout from merging it with the TTM changes.
> >
> > Anyway, patch is Reviewed-by: Christian K=C3=B6nig <christian.koenig@am=
d.com>
>
> This is obviously not for amd-staging-drm-next. Christian, are you going
> to apply it to the relevant branches?

I've applied it to my drm-next branch.

Alex


>
> Thanks,
>   Felix
>
>
> >
> > Thanks,
> > Christian.
> >
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> index f6aff7ce5160..d02c8637f909 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> @@ -71,7 +71,7 @@ static int amdgpu_preempt_mgr_new(struct
> >> ttm_resource_manager *man,
> >>       struct amdgpu_preempt_mgr *mgr =3D to_preempt_mgr(man);
> >>         *res =3D kzalloc(sizeof(**res), GFP_KERNEL);
> >> -    if (*res)
> >> +    if (!*res)
> >>           return -ENOMEM;
> >>         ttm_resource_init(tbo, place, *res);
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
