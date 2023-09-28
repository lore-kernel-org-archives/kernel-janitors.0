Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18124E81810
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Sep 2023 02:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjI1CYz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 22:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjI1CYz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 22:24:55 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E525AAC
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 19:24:53 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1dd78b46995so2129953fac.3
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 19:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695867893; x=1696472693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwbWTzEF26tkvrUDXa8g6EF1V6+cYDPwg5qB0QBbcYQ=;
        b=HTVnhbvXVLdDOJFl38U6jHFw+P6w5owjURClh63EC1tU3NgdOfhSQ3RouolnPbrj80
         3RURGEcmah+3gRnAYwk13egFAsQgYJ13lgPugtK3MKnl6KdTvHj9YTmsyC2AEA37icaT
         B6yNP+2WE1jxSlKU6W7ElAmRp/LTDDXiz5lktouXuZWBBBcqB0/6y86VF7+8uTSH4FpB
         1BteDkMc1mrjv4r6BGX5BThGhaGg5IuS7+EcWgRUpnxCeM9+04KpCZCWqvII8eGaNhIA
         0SlJz1PzoevAgMNLnNDDlQxU6sVJJGpO+6NfGIhVJE2j43rSXltPUb1UiTtAiHL7LLfj
         Q2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695867893; x=1696472693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwbWTzEF26tkvrUDXa8g6EF1V6+cYDPwg5qB0QBbcYQ=;
        b=Sx6dgpboqQpP7ep0PVZhqvWMPkEKZ4jOovzJXIL+RCn9Ey4YjBjFI0EWVdAF1rlvPu
         TvNWPi9PnzlyZ0bRDS7IaHPbGFXLUr11QJIycuBND6jYC20K2/tALnfFln9rWE92FjPI
         CgtX0tFyA4eBGLk1DvhXqZilQCdzB0tqTLSE2w8bq9zxZmMYojWcByTGbdtQjam8eUAG
         vybSdgUKSv58iS1PRXjU+Db2xdd11cNt3cZdtL36B6F9mJmjuBlf0T21GsHx4xpkitpY
         Wz55chFmowwhzMNjqLgaNvynGNtye5IuUpJeV36TudmlFY+DxNfZJPlMSjuSHN52TFAq
         kBqg==
X-Gm-Message-State: AOJu0YyzVW3tJifN8Irs5PoZitZ1VjMD9P80sBoSO7moeEaAFXachK+L
        Kx6W7ek2rkv1E3SM4KEPNkOIKPGWrTT/1INhINA=
X-Google-Smtp-Source: AGHT+IGuDADEcGLkGOl4njVwGCJKz0hXGdgnTNJPAhnZ5Jx73SAIdvOY6IopZJIp4gxu9KBbgCBWj1N3NX38p4Kmdao=
X-Received: by 2002:a05:6870:64aa:b0:1d5:aab3:ecd3 with SMTP id
 cz42-20020a05687064aa00b001d5aab3ecd3mr4519249oab.6.1695867893096; Wed, 27
 Sep 2023 19:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <b238c665-91d6-4afe-83a8-da2f2d59a75b@moroto.mountain> <PH7PR12MB5997674A218864F1B9C6B16882C2A@PH7PR12MB5997.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB5997674A218864F1B9C6B16882C2A@PH7PR12MB5997.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 27 Sep 2023 22:24:41 -0400
Message-ID: <CADnq5_NYB9HLDL60Qj4eQU8XXBVtuN=GqvWDuPtP=Ayq1FkgAw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: delete dead code
To:     "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Evan Quan <evan.quan@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Kamal, Asad" <Asad.Kamal@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
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

On Wed, Sep 27, 2023 at 2:57=E2=80=AFPM Wang, Yang(Kevin)
<KevinYang.Wang@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> Thanks.
>
> Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
>
> Best Regards,
> Kevin
>
> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Wednesday, September 27, 2023 8:38 PM
> To: Evan Quan <evan.quan@amd.com>; Wang, Yang(Kevin) <KevinYang.Wang@amd.=
com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Ch=
ristian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <ai=
rlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Lazar, Lijo <Lijo.Lazar@=
amd.com>; Kamal, Asad <Asad.Kamal@amd.com>; Zhang, Hawking <Hawking.Zhang@a=
md.com>; Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; amd-gfx@lists.freedesk=
top.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] drm/amd/pm: delete dead code
>
> "ret" was checked earlier inside the loop, so we know it is zero here.
> No need to check a second time.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index 11a6cd96c601..0ffe55e713f3 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -2346,9 +2346,6 @@ static int mca_get_mca_entry(struct amdgpu_device *=
adev, enum amdgpu_mca_error_t
>                         return ret;
>         }
>
> -       if (ret)
> -               return ret;
> -
>         entry->idx =3D idx;
>         entry->type =3D type;
>
> --
> 2.39.2
>
