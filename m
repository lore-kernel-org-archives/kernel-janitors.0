Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A46EC8759
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 20:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236878AbjIGUel (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 16:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjIGUek (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 16:34:40 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3BB1703
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 13:34:36 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1c8d2606fc9so1329926fac.0
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694118875; x=1694723675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9h7IPXqY30s3vlnhZjWCz1icv85zvx9M/gASr/Ioew=;
        b=HG6lzUQKtFP9ZDLak8B+PAP6413uOoZLNisWveRA9TohSllAn+qFG7mvVNO7yplfIJ
         oeVHF7/WzvIUMs8H63SoIJpk2+sI6swKzcLZRT1cpKk/CFVesjvrZENKQnrDyHCXnA2V
         ZgswVjRMj5Yp431UwlWM6kI7ssmMHLmmqS81+Cj+ZgQsAmn74Z3FZ+2ypfl5+/thJEH4
         sNkoWAB38WjPBDNP1LBkLwsCbDsIXtjC+WPjGABa3Pw1+H9cU8Ye5rl8Ta/lduvvY8ri
         5seMqK3kyT/Z4Gy8Keri6WBOiYCopLsNdgO3rnrFMxYYsZhoesM0ljtoBsVDRfh+1bbO
         j29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694118875; x=1694723675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9h7IPXqY30s3vlnhZjWCz1icv85zvx9M/gASr/Ioew=;
        b=VdBWm06SXwHkD8j/d4M8GYQINgSjbsn2g+rLwEV7iSdrDRiPQolGqYg1X0hp+5Va3n
         rvTZdIc6KZsd9qGkbdUdFrvvq1cX/JBY/xBJJERNPQ4+2zlSVNYwZNaievuoq7GsFCHY
         8scXDNWTGTgsVKkozs0Km3trP6D8e2E2oB/r9mggL025X6jzwKeS703GHHUmAdb/T7Jt
         Tiywmw6jxh94s3ttBX31dd7XYS7P0wCjcje7euVMVpeqLEhIe3PGxN0tdwgsZDmHx8/S
         BSGSEiF62Fc20q1K1er0uJ1QfG3Ac1uMOaw2t3+hUZtIvwKSayTXh0v7pz/n/UzZw/lv
         xiHw==
X-Gm-Message-State: AOJu0Yz5NzA+Cbcq+YMz8YI1oawvXpyulyBoscCy2S1GWcWdM5zHAsuj
        nm2Ul5IF7t4mRFvMfZpibJLD4xFc6AD92F+BPlQ=
X-Google-Smtp-Source: AGHT+IGNG0v4pAKAt4Megoy9yOX9ndc4y5RbA9i9OSriJ42fXgtl4avRsSP7NbqAPa73dOsIU1+sT/yfDYlOox7b8VA=
X-Received: by 2002:a05:6870:c596:b0:1b4:3388:d69d with SMTP id
 ba22-20020a056870c59600b001b43388d69dmr2197609oab.2.1694118875650; Thu, 07
 Sep 2023 13:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <ea9bfa9b-2689-45cf-95b7-57577f0d76c2@moroto.mountain> <DM6PR12MB26197B9B9A827160B1932F60E4EEA@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26197B9B9A827160B1932F60E4EEA@DM6PR12MB2619.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 7 Sep 2023 16:34:24 -0400
Message-ID: <CADnq5_M==-2-2vWThG3TeC-o+6Ya5xiDT0SoSj1XHVNDvo4Wmw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix retry loop test
To:     "Quan, Evan" <Evan.Quan@amd.com>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Kamal, Asad" <Asad.Kamal@amd.com>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        David Airlie <airlied@gmail.com>,
        "Koenig, Christian" <Christian.Koenig@amd.com>,
        "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Wed, Sep 6, 2023 at 10:00=E2=80=AFPM Quan, Evan <Evan.Quan@amd.com> wrot=
e:
>
> [AMD Official Use Only - General]
>
> Yeah, nice catch. But personally I would prefer to change the check as "i=
f (retry <=3D 0)".
> Either way, the patch is reviewed-by: Evan Quan <evan.quan@amd.com>
>
> Evan
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@linaro.org>
> > Sent: Wednesday, September 6, 2023 6:55 PM
> > To: Quan, Evan <Evan.Quan@amd.com>; Wang, Yang(Kevin)
> > <KevinYang.Wang@amd.com>
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Lazar, Lij=
o
> > <Lijo.Lazar@amd.com>; Kamal, Asad <Asad.Kamal@amd.com>; Zhang,
> > Hawking <Hawking.Zhang@amd.com>; Limonciello, Mario
> > <Mario.Limonciello@amd.com>; amd-gfx@lists.freedesktop.org; kernel-
> > janitors@vger.kernel.org
> > Subject: [PATCH] drm/amdgpu: fix retry loop test
> >
> > This loop will exit with "retry" set to -1 if it fails but the code
> > checks for if "retry" is zero.  Fix this by changing post-op to a
> > pre-op.  --retry vs retry--.
> >
> > Fixes: e01eeffc3f86 ("drm/amd/pm: avoid driver getting empty metrics ta=
ble
> > for the first time")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Obviously this only loop 99 times now instead of a hundred but that's
> > fine, this is an approximation.
> >
> >  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> > b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> > index ff58ee14a68f..20163a9b2a66 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> > @@ -336,7 +336,7 @@ static int smu_v13_0_6_setup_driver_pptable(struct
> > smu_context *smu)
> >
> >       /* Store one-time values in driver PPTable */
> >       if (!pptable->Init) {
> > -             while (retry--) {
> > +             while (--retry) {
> >                       ret =3D smu_v13_0_6_get_metrics_table(smu, NULL,
> > true);
> >                       if (ret)
> >                               return ret;
> > --
> > 2.39.2
>
