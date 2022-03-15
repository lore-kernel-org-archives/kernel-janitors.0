Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D46C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Mar 2022 15:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241547AbiCOPyx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Mar 2022 11:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbiCOPyw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Mar 2022 11:54:52 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA2E6551
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Mar 2022 08:53:39 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id s207so21224282oie.11
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Mar 2022 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YrGSq5r3SU2NFxwiko4Dpz9bnbGLGj8RiSMDQ7WVepI=;
        b=XmvZlIyMeBE9Kxy6yu7y9xw9W8AmzIvojkNDeM0Q3W0VudLA9ZNcj943FzwIUMGE4q
         gJM4Cqt8FlHfLcayi7v1ImyGNnhaeGKHjluBiy5XMsd5ASjSp8fdqxBrn3JHrOr8VQ5Z
         8HiLqrJmzhuj8i9pV0/prwQlHEXAW6F4AX5YB60wEJTo4N8Lsx8qhNLpsZZVNyvdDQiV
         wxrfoOrvMsizAFEX8P+KJ/XUGgH1OxtWwZD6B/+PzmPk47Rsv+koAsw58Euz5QrYxptC
         +8Lx40tTtyWuVLw8vOUWkjnpuAub2qGX8Rk8zzIymtXv1yYPpwe0OwMuVScy9j9HcuMs
         g+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YrGSq5r3SU2NFxwiko4Dpz9bnbGLGj8RiSMDQ7WVepI=;
        b=sOChwJ/CMx/HgHCyMUt27Kpo7pHt2vRGsCtTOui1DPEc5oFPg/wIqj5cf7ztJ4s7J4
         XWGaiw3WUOfQKn4Ig7h/3JNhMlJPt7Tk0/2BjWVTAaSR4+Du90CqUkMcqAw6bZMkLm37
         2m3INMkBT6aNybDWRMKKbUqk0vD/XH3Biw0htUhTBieVBqH4RWNdsNtYZx5SyvqORGIi
         CeMEgZZfEELsI+lKqkSEGuuSYLO+Y0b/bsHqLAcSP2GdPsk8iY1iEdAKzSqyIzTp9lX/
         sqBFyG27SMGd6IhpqRi3JonEEKebRDioMxZ0DRpcD8CvDLQlacoJABe0KYczS2FPoo4r
         0VbQ==
X-Gm-Message-State: AOAM5315R9DXmV4kmNHuseKacY/Zd0dXHQ1nfeRZBiG85VTnjXM420Zi
        khL3y9ZmNR2NFNsUIQklomrvkMVUtApq5LJMPEY=
X-Google-Smtp-Source: ABdhPJwpNEMd8Sklhy609OdpAxNPdBO1TJB5y9av0cI3UMkcn4vn9GGyMJNvIxAbE/mhUNZtxB7cRHOyvSCakwDq7bA=
X-Received: by 2002:aca:d07:0:b0:2ec:eaaf:a036 with SMTP id
 7-20020aca0d07000000b002eceaafa036mr2049512oin.253.1647359618702; Tue, 15 Mar
 2022 08:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220314140405.GC30883@kili> <e54bbfa5-bcbf-8b84-8c94-c181c774c64c@amd.com>
In-Reply-To: <e54bbfa5-bcbf-8b84-8c94-c181c774c64c@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 15 Mar 2022 11:53:27 -0400
Message-ID: <CADnq5_PZdO4DuzYCVCt=TtES7WeRHe5fas8WugrrpeBK2YZB8g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix indenting in __smu_cmn_reg_print_error()
To:     Luben Tuikov <luben.tuikov@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Evan Quan <evan.quan@amd.com>,
        Yifan Zhang <yifan1.zhang@amd.com>,
        Huang Rui <ray.huang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
        Guchun Chen <guchun.chen@amd.com>,
        David Airlie <airlied@linux.ie>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Prike Liang <Prike.Liang@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Darren Powell <darren.powell@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Graham Sider <Graham.Sider@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Mon, Mar 14, 2022 at 12:06 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Thanks!
>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>
> Regards,
> Luben
>
> On 2022-03-14 10:04, Dan Carpenter wrote:
> > Smatch complains that the dev_err_ratelimited() is indented one tab more
> > than the surrounding lines.
> >
> >       drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:174
> >       __smu_cmn_reg_print_error() warn: inconsistent indenting
> >
> > It looks like it's not a bug, just that the indenting needs to be cleaned
> > up.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> > index ae64d1980f10..b8d0c70ff668 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> > @@ -164,17 +164,17 @@ static void __smu_cmn_reg_print_error(struct smu_context *smu,
> >
> >       switch (reg_c2pmsg_90) {
> >       case SMU_RESP_NONE: {
> > -     if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 5)) {
> > -             msg_idx = RREG32_SOC15(MP1, 0, mmMP1_C2PMSG_2);
> > -             prm     = RREG32_SOC15(MP1, 0, mmMP1_C2PMSG_34);
> > -     } else {
> > -             msg_idx = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_66);
> > -             prm     = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82);
> > -     }
> > +             if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 5)) {
> > +                     msg_idx = RREG32_SOC15(MP1, 0, mmMP1_C2PMSG_2);
> > +                     prm     = RREG32_SOC15(MP1, 0, mmMP1_C2PMSG_34);
> > +             } else {
> > +                     msg_idx = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_66);
> > +                     prm     = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82);
> > +             }
> >               dev_err_ratelimited(adev->dev,
> >                                   "SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x%08X SMN_C2PMSG_82:0x%08X",
> >                                   msg_idx, prm);
> > -     }
> > +             }
> >               break;
> >       case SMU_RESP_OK:
> >               /* The SMU executed the command. It completed with a
>
> Regards,
> --
> Luben
