Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B29C74A5B
	for <kernel-janitors@archiver.kernel.org>; Wed, 29 Mar 2023 21:08:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjC2VIx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 29 Mar 2023 17:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjC2VIw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Mar 2023 17:08:52 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEBA10F9
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Mar 2023 14:08:36 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id r16so12603489oij.5
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Mar 2023 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680124115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPXWRFIoREXhZwsFskFZNeZ1+zPRfNX3xPUEorUWMOo=;
        b=Tg29Bs8pX/s+4I8MqATYnsQDlFeRZbx1yOf7IFCVgtoP6sRvNM15VaJ75BGk4uPYkl
         R091oIyuBzpmTaaQxjV5WUC/fFl/LaTU7AsVxYiuMQCm44Is4sVCvCdyMS4ZEO/p8LG9
         c8UpKlHxZMFKsf5Bi976naIk2C7ZeVIgGRdSXlcMWh/Zn35zMjG3gp6JcNXF4rWGyqdy
         Bof+J12aH5E+TPb6VkB087TjrPEKB5yNVvi88qpuzu8H1muzHIRLZ5GM7UOZsAkQLsgj
         FpGlEeHNGheHopgdnmj0EyxML8iBPIXGMqGjgkhk2OsxN94r9dhJjF/SxM8ls0pjA0N5
         BXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680124115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPXWRFIoREXhZwsFskFZNeZ1+zPRfNX3xPUEorUWMOo=;
        b=ZxO6KA6eoI0DEjNtY1jky0SIsmYAS5gM/QfNqWeRub0q5Ixaa8Pg56aaZfoEw9IuG5
         fkcJQDhf7P8LUFTEbxmJAH5yERFJ3KJ7JdGxB/uCFtI6AEYZ6s2VMq4KkmVeIUyS3kg5
         NifDsfuJxvun7f7UXEkzbxNIsbUxrWOKhBt/hpc4TvnCPlsIqauaP2YdDnaX9MpjxFIJ
         zDMw2XEVFvRXKkJYhtOr0w3tkzNnNy8PplAwBD0go1lyD0pDv3fEEeZSSbYSXB12LZe/
         Ys0GSWBvw+cjcjcB7sloI1KFy6ZoGBu8cVK//74ckAAycl9ysNmLrBF4EWYRRUejjqsi
         JJhw==
X-Gm-Message-State: AAQBX9dPJFJyKPJR130vBMNVxbEwPn1FkkmfClCj5NIi6O7x9hJtdhMv
        nYoJbExraJu9Oegw2+wgJBVgsuB1lunXnGe+Fng=
X-Google-Smtp-Source: AKy350YOopVbnyRkX94ORtJ+sQy1ZS6t0Y8O/piyRsw7EmyXpLfeHqlsXwh+1YU3jAWuxZ5f/FYx3CtCqUHxSSlxQtg=
X-Received: by 2002:a05:6808:15a3:b0:389:6d65:6215 with SMTP id
 t35-20020a05680815a300b003896d656215mr485344oiw.3.1680124115221; Wed, 29 Mar
 2023 14:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <580414df-4adf-49cf-9930-743f7c539d46@kili.mountain> <BN9PR12MB52573A6551DD2E6464AA9AD5FC899@BN9PR12MB5257.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB52573A6551DD2E6464AA9AD5FC899@BN9PR12MB5257.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 29 Mar 2023 17:08:23 -0400
Message-ID: <CADnq5_PvS7Ltx4KdM+mYn4TugWgN7dNXx6Vb9sLECH0U3wvMeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix AMDGPU_RAS_BLOCK__DF check
To:     "Zhang, Hawking" <Hawking.Zhang@amd.com>
Cc:     Dan Carpenter <error27@gmail.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "Zhou1, Tao" <Tao.Zhou1@amd.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Chai, Thomas" <YiPeng.Chai@amd.com>,
        "Yang, Stanley" <Stanley.Yang@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Zhao, Victor" <Victor.Zhao@amd.com>,
        "Li, Candice" <Candice.Li@amd.com>,
        David Airlie <airlied@gmail.com>,
        "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

On Wed, Mar 29, 2023 at 1:31=E2=80=AFAM Zhang, Hawking <Hawking.Zhang@amd.c=
om> wrote:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
>
> Regards,
> Hawking
> -----Original Message-----
> From: Dan Carpenter <error27@gmail.com>
> Sent: Wednesday, March 29, 2023 13:28
> To: Zhang, Hawking <Hawking.Zhang@amd.com>
> Cc: Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan=
@amd.com>; David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch=
>; Zhang, Hawking <Hawking.Zhang@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; =
Yang, Stanley <Stanley.Yang@amd.com>; Chai, Thomas <YiPeng.Chai@amd.com>; Z=
hao, Victor <Victor.Zhao@amd.com>; Li, Candice <Candice.Li@amd.com>; amd-gf=
x@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] drm/amdgpu: fix AMDGPU_RAS_BLOCK__DF check
>
> There is a mixup where AMDGPU_RAS_BLOCK__DF is used as a mask instead of =
a shifter.  It means that this condition will be true for AMDGPU_RAS_BLOCK_=
_MMHUB instead of for AMDGPU_RAS_BLOCK__DF.
>
> Fixes: b6f512168478 ("drm/amdgpu: Add fatal error handling in nbio v4_3")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> From static analysis.  Not tested at all.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
> index fac45f98145d..4069bce9479f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -2564,7 +2564,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
>                         adev->nbio.ras =3D &nbio_v7_4_ras;
>                 break;
>         case IP_VERSION(4, 3, 0):
> -               if (adev->ras_hw_enabled & AMDGPU_RAS_BLOCK__DF)
> +               if (adev->ras_hw_enabled & (1 << AMDGPU_RAS_BLOCK__DF))
>                         /* unlike other generation of nbio ras,
>                          * nbio v4_3 only support fatal error interrupt
>                          * to inform software that DF is freezed due to
> --
> 2.39.1
