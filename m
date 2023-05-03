Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0C1C77B78
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 May 2023 15:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjECPeW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 May 2023 11:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjECPeV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 May 2023 11:34:21 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EA161BE
        for <kernel-janitors@vger.kernel.org>; Wed,  3 May 2023 08:34:10 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6a5f03551fdso3745245a34.0
        for <kernel-janitors@vger.kernel.org>; Wed, 03 May 2023 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683128049; x=1685720049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WThOUAoJX89B2HUz8Mq+eDPMlI1TMXpmRJsL54MDZPY=;
        b=GZP/cAM+lMsEyO5l4cCUSOseyRYfak2reUwveynG9R63+gT2EZ3TU0UtEii/xKPB2A
         d+Uhigjvi44VLBnMjIwFun+Xfbe/KEkk2hrt5a9hIZPneIxHgihPsXwbxZC52gCj198X
         Y5StChrhajaUA0YR8um4zfuVCBMAlQ4gKdv5uLWWaM3OnkgoM1fsr8S8yEwLryyjO1K7
         clIUmCAvLXkxvFyGsyUgnvKZF4RSVEqDrY5k0/Im0J1mxJgr5BKtse3r/flW/h6LklCH
         TLv9/tucxrjryqNdnCy89Me196YaEGBRUlbcLVdF6f8mwGhe1x1PwtW/3Z29Su2shm4h
         FY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683128049; x=1685720049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WThOUAoJX89B2HUz8Mq+eDPMlI1TMXpmRJsL54MDZPY=;
        b=mHb+4dtgRLKtyOOIqfgQUb7/rm1S6pOnAVntLAMd0SLFICXRJR2C6JXAsNlwG25kTs
         rI7/54KLCibjgE6Ff0wLnaJbHJWRjlTlkLPrZ/iZMk4yMUKld2yzsZuyj41ZHH4sB9nL
         gz65gMN7HMCg6YeMsxahGdEkxYCZ/H5pfF4s8NZdIfKD5qP+nUU/OsBo6TqKs1WbWh16
         cn9eoHzJarrQjLVWRGAu2Gh7Gv9VRMEMjXmkWskrjJk/tdrmaw9T4J+qdVcIMbekG2o1
         9+IvJs1WDO4tLdcllPAQGtIo4BDkuThP5+/QgqDgq/mUYTmmwZtnSHEoTT4eeFHk1MoZ
         ihyA==
X-Gm-Message-State: AC+VfDxIIaCoSRXDqX36T0GzZ26fsQwGOD5Ttt3Se3qzZvWHVkcjdbV8
        upVjXYU9qkxh6yy1FoKqW2lq+TB0h8xFqYCabrU=
X-Google-Smtp-Source: ACHHUZ6r7nejyMHl5GGHVw45u7b0iq1odtg40U2hOsOPQQ0OlwfskJJyhwH5LN6ImI8gNfY0WEyrflfUMrNSWRvcEo4=
X-Received: by 2002:a05:6808:238c:b0:38e:2a4:fd84 with SMTP id
 bp12-20020a056808238c00b0038e02a4fd84mr252148oib.47.1683128049504; Wed, 03
 May 2023 08:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <072c8bbb-76bd-42f8-bb97-ebc38acad470@kili.mountain>
In-Reply-To: <072c8bbb-76bd-42f8-bb97-ebc38acad470@kili.mountain>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 3 May 2023 11:33:58 -0400
Message-ID: <CADnq5_PqQuKRighnXrQrAmE0RojT6PQjLQ5a2iQXiHq3VhZEUw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: unlock the correct lock in amdgpu_gfx_enable_kcq()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Le Ma <le.ma@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
        Tao Zhou <tao.zhou1@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
        Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
        Lang Yu <Lang.Yu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        YiPeng Chai <YiPeng.Chai@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Likun Gao <Likun.Gao@amd.com>,
        David Airlie <airlied@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

On Wed, May 3, 2023 at 11:29=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We changed which lock we are supposed to take but this error path
> was accidentally over looked so it still drops the old lock.
>
> Fixes: def799c6596d ("drm/amdgpu: add multi-xcc support to amdgpu_gfx int=
erfaces (v4)")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index 60bb4bba1994..1de3fffae9d7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -566,7 +566,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev,=
 int xcc_id)
>                                                 kiq->pmf->set_resources_s=
ize);
>                 if (r) {
>                         DRM_ERROR("Failed to lock KIQ (%d).\n", r);
> -                       spin_unlock(&adev->gfx.kiq[0].ring_lock);
> +                       spin_unlock(&kiq->ring_lock);
>                         return r;
>                 }
>
> --
> 2.39.2
>
