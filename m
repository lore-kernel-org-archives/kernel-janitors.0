Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E323C7EE22
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 May 2023 02:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbjEKCdq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 10 May 2023 22:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjEKCdm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 May 2023 22:33:42 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BFB30F1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 May 2023 19:33:40 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-38c35975545so5189319b6e.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 May 2023 19:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683772419; x=1686364419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pQAf81EzyS4XpYqyhhqkA7QaovNS9VTfmfTqVDEAuw=;
        b=Akbesd3Voq6LonNsh97LC6tgbbXG9iWrhtjMXuIrhw3YaFbvgLuWcg6KCv5gfFoWrA
         HHv5Bj7IO4gKDWtk95UYKEoAn6WruhjazJw6V10Pka8lVYQ+r84M2iBp6Gv0JyPcjQd+
         395lHFEMQ4Thf58BnlS5PjRpl/vjPUg7LFbDJF3dczhpInSlpkqeJKgXKhMQs7mjt7g/
         lgr1x7ew3eE9ESF6rIHlvQviBCSVt2sabXo3xUNMlShxzG1jwP0X34wZR5Pct167lLbH
         DB1dbpRnK4NoDCLZ2pNhwgZ+Qi4eN8v4EkS4+53nV3EZv+mAjyunoXx25f8FWA+UFsoE
         s+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683772419; x=1686364419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pQAf81EzyS4XpYqyhhqkA7QaovNS9VTfmfTqVDEAuw=;
        b=c3dSJthxA2sXdU2qbhzPmDo5OVqi1wnouDY7fO86SdfLjN6Bq3lGNwiAvr4ivKCcL2
         XGjJuS4KrHzG5LMvyt8bEqzcN/f/bFxry72qOtwvN5YrwTXS2VuTqg2rUmHlOScQegub
         PTE1teuLRAiPItDyVvpXQla/dkoEICphM2X8Jm7ubyMRIQ2dolRieLe00JxZGkW+ZKSD
         +sFNKicHjjs2t1qznBWMDfr1zwovatcG99DgDiDZwxdJVld1jiarNdY2JpVgw2CKVW7C
         9SV8xrXHkm52v/c0xiTKZ23zAwVXfZlZLIzZFIMdKt7rZH8EbB91rpARtmcTfUJom3mT
         k8PQ==
X-Gm-Message-State: AC+VfDxrPL8/caJ96BabSSe0NWx5eC0Om3IGqpLMwuv8Ss2raF//Wloj
        LdoHQ+M1XLYQ0Lk50q2j9J6DVNCv6I8JXyCySWixlFHE
X-Google-Smtp-Source: ACHHUZ6sfYi1W/OyiPQMwOGxHJNmQIZ8LFuuL4v67ToKiR1D0ZJpvTT41Z14Z0cOvKskayzGzm3eIByhNIQF2fZ9Un0=
X-Received: by 2002:aca:180f:0:b0:38e:c2a4:3530 with SMTP id
 h15-20020aca180f000000b0038ec2a43530mr3620806oih.9.1683772419411; Wed, 10 May
 2023 19:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <75e5d2a6-9be4-4530-b8f8-c98d1bd96b03@kili.mountain>
In-Reply-To: <75e5d2a6-9be4-4530-b8f8-c98d1bd96b03@kili.mountain>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 10 May 2023 22:33:28 -0400
Message-ID: <CADnq5_O-BU5aku753wJvQ9GO5smQPS-ZheO25G3wwEL3CTEXgw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: release correct lock in amdgpu_gfx_enable_kgq()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Tao Zhou <tao.zhou1@amd.com>,
        Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
        Lang Yu <Lang.Yu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Le Ma <le.ma@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>, Likun Gao <Likun.Gao@amd.com>,
        David Airlie <airlied@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Tue, May 9, 2023 at 10:32=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> This function was releasing the incorrect lock on the error path.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 9bfa241d1289 ("drm/amdgpu: add [en/dis]able_kgq() functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> The LKP robot sent me an email about this after I had already written
> the patch.  (I review LKP Smatch emails and hit forward).
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index 969f256aa003..7d2f119d9223 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -644,7 +644,7 @@ int amdgpu_gfx_enable_kgq(struct amdgpu_device *adev,=
 int xcc_id)
>                                                 adev->gfx.num_gfx_rings);
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
