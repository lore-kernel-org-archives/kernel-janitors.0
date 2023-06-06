Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBF5C7EE37
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 19:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238940AbjFFT2L (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 15:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbjFFT2K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 15:28:10 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE3910CA
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 12:28:09 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-19e7008a20aso5933959fac.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 12:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686079688; x=1688671688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WNUhc6EOU+k61yIdrNm+E3oNw4Ztiymxbf5SrtdJeM=;
        b=Vvb8OT9zCKPPzmIytNmksZHP6VebSdS6gsG1YaGsF94lCDAGBAUwJLMf077VySMbvz
         ZkssOlA8t5lbjYyJD7SOeitoPtsBffbiA9L45oXyDXH4NktJklmd9ZCOlydDh+RKSD3s
         09zFwVm8w2xI7DmkQrcjuXaznP0QCPke03cUkOBe/T6Hr9DA4xpvnf1U9d+X62lDwKJq
         yvtmJfQpSa5295Wav5xDTq7FJicYvurEMnJDcDb1sEPFdoAbl73Iig6/AW7QEV5Q55CQ
         L8PjsV4TMGaG4R3U8np0Au6hOLiL4nGyaiENotN7nt56RnIBjDZTS2/Q8+lJRJviTRl3
         N+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686079688; x=1688671688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WNUhc6EOU+k61yIdrNm+E3oNw4Ztiymxbf5SrtdJeM=;
        b=ZJHo9m/Vhh3J1FfcfN2maz/dEV7jO9eU0Ij89GR1cyF6GGn+Zxva0oWXovlhVFiJSI
         /yn0QL0TvkjWMA28j1ycOcT9xPyCZVwKtVEkboLJp89yQmHUXZmebzTOXUkSmkp4b0cD
         3bxkYLhJL+xWBFTIqffe5r+X/gL4U3W5FB4CYscgct+NQclDu9i1WZ0ufVlLCK+WHXdR
         958QBlq8htjFezNCzKHOm4Q0Et+mgmWDgo068zwUltFlU8UegK4KQIXy1MXKcbxp90ll
         9dOE8wc9Bv7GonrPvCLU5a2LImL8PWZnep/UJmK29QICYKsvrjl7f8qhIGA9/l8YH3dS
         2R4g==
X-Gm-Message-State: AC+VfDwcKBbpE7x6rHHau9aM/o7h6qoOtrdpMevrjIgV9UHEhgjCw3oq
        eB9bz3UjdCgymosJoJXOSEC3oPLRvcE/3Spxuq7KK5+Y
X-Google-Smtp-Source: ACHHUZ4yOChY2GqmKhYtFI2nRjc/GpXTQegYHYbqmx8aBfxwUplIw2ye/W5kcwf5trOmxctAlCfdIN6UwLpSmR/AmEk=
X-Received: by 2002:a05:6870:73c3:b0:196:8dc3:4e16 with SMTP id
 a3-20020a05687073c300b001968dc34e16mr2839070oan.39.1686079688302; Tue, 06 Jun
 2023 12:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <ZH7vaonsPEHJpy1j@moroto> <DM6PR12MB26192FFABF329682D9001C3BE452A@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26192FFABF329682D9001C3BE452A@DM6PR12MB2619.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 6 Jun 2023 15:27:57 -0400
Message-ID: <CADnq5_OjjkfGzj3Px3wARYEsgX=D7KhjfjJLAVbFWMAsqOCxAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Fix memory some memory corruption
To:     "Quan, Evan" <Evan.Quan@amd.com>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        "Zhang, Horatio" <Hongkun.Zhang@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
        "Feng, Kenneth" <Kenneth.Feng@amd.com>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Chai, Thomas" <YiPeng.Chai@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Li, Candice" <Candice.Li@amd.com>,
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

On Tue, Jun 6, 2023 at 6:27=E2=80=AFAM Quan, Evan <Evan.Quan@amd.com> wrote=
:
>
> [AMD Official Use Only - General]
>
> Thanks for catching this.
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@linaro.org>
> > Sent: Tuesday, June 6, 2023 4:34 PM
> > To: Quan, Evan <Evan.Quan@amd.com>
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Lazar, Lij=
o
> > <Lijo.Lazar@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Feng,
> > Kenneth <Kenneth.Feng@amd.com>; Li, Candice <Candice.Li@amd.com>;
> > Chai, Thomas <YiPeng.Chai@amd.com>; Wang, Yang(Kevin)
> > <KevinYang.Wang@amd.com>; Zhang, Horatio <Hongkun.Zhang@amd.com>;
> > amd-gfx@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> > Subject: [PATCH] drm/amd/pm: Fix memory some memory corruption
> >
> > The "od_table" is a pointer to a large struct, but this code is doing p=
ointer
> > math as if it were pointing to bytes.  It results in writing far outsid=
e the struct.
> >
> > Fixes: f0a0c659fb96 ("drm/amd/pm: fulfill the OD support for SMU13.0.0"=
)
> > Fixes: e3afa4f988b3 ("drm/amd/pm: fulfill the OD support for SMU13.0.7"=
)
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 4 ++--
> > drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> > b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> > index 5ac5ea770c1c..413e592f0ed6 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> > @@ -1535,7 +1535,7 @@ static int smu_v13_0_0_od_edit_dpm_table(struct
> > smu_context *smu,
> >                * settings. Thus we do not cache it.
> >                */
> >               offset_of_featurectrlmask =3D offsetof(OverDriveTable_t,
> > FeatureCtrlMask);
> > -             if (memcmp(od_table + offset_of_featurectrlmask,
> > +             if (memcmp((u8 *)od_table + offset_of_featurectrlmask,
> >                          table_context->user_overdrive_table +
> > offset_of_featurectrlmask,
> >                          sizeof(OverDriveTableExternal_t) -
> > offset_of_featurectrlmask)) {
> >                       smu_v13_0_0_dump_od_table(smu, od_table); @@ -
> > 1548,7 +1548,7 @@ static int smu_v13_0_0_od_edit_dpm_table(struct
> > smu_context *smu,
> >
> >                       od_table->OverDriveTable.FeatureCtrlMask =3D 0;
> >                       memcpy(table_context->user_overdrive_table +
> > offset_of_featurectrlmask,
> > -                            od_table + offset_of_featurectrlmask,
> > +                            (u8 *)od_table + offset_of_featurectrlmask=
,
> >                              sizeof(OverDriveTableExternal_t) -
> > offset_of_featurectrlmask);
> >
> >                       if (!memcmp(table_context->user_overdrive_table,
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> > b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> > index 0bd086360efa..cda4e818aab7 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> > @@ -1524,7 +1524,7 @@ static int smu_v13_0_7_od_edit_dpm_table(struct
> > smu_context *smu,
> >                * settings. Thus we do not cache it.
> >                */
> >               offset_of_featurectrlmask =3D offsetof(OverDriveTable_t,
> > FeatureCtrlMask);
> > -             if (memcmp(od_table + offset_of_featurectrlmask,
> > +             if (memcmp((u8 *)od_table + offset_of_featurectrlmask,
> >                          table_context->user_overdrive_table +
> > offset_of_featurectrlmask,
> >                          sizeof(OverDriveTableExternal_t) -
> > offset_of_featurectrlmask)) {
> >                       smu_v13_0_7_dump_od_table(smu, od_table); @@ -
> > 1537,7 +1537,7 @@ static int smu_v13_0_7_od_edit_dpm_table(struct
> > smu_context *smu,
> >
> >                       od_table->OverDriveTable.FeatureCtrlMask =3D 0;
> >                       memcpy(table_context->user_overdrive_table +
> > offset_of_featurectrlmask,
> > -                            od_table + offset_of_featurectrlmask,
> > +                            (u8 *)od_table + offset_of_featurectrlmask=
,
> >                              sizeof(OverDriveTableExternal_t) -
> > offset_of_featurectrlmask);
> >
> >                       if (!memcmp(table_context->user_overdrive_table,
> > --
> > 2.39.2
>
