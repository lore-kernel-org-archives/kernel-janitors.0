Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A89C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Apr 2021 16:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73F646115B
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Apr 2021 16:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhDOQWM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Apr 2021 12:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhDOQWM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Apr 2021 12:22:12 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE59C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Apr 2021 09:21:48 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id m13so24798025oiw.13
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Apr 2021 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t7pqJXti59c1rJZw2pACVhJls5W5jKhWFw5ukj9e48U=;
        b=R/O/tUak6DfYH8B+Kw9sxzRxBlisU2gV2zGdlsVd+Gf+3WQN6UF1UrcAVLfwAQDixd
         RJ3g8Wa4FsX9e2nQKAZw6BuSDTxAy3wgnCf396qM7TEfAOJdNSxfZtI/a/u2n0+4ruGw
         yG3EbY29ZC8VeFe6DR/hxxFL6GchyU6huaMgLFaKb3n8v6hOCut08KfMCdDetwuAO38G
         kEh2Ze+IQ0poo2z9pgYxEJw+DnXF6XWIBv8B8eDKH8aLf/ICDcf1fI6waMbaF6/2H+zU
         9ghTvXh9THRm0uVldKexJE68WLSnI6+8YzJrfe2z0mOluWF+UZgZukKaQXojYM/jnQiC
         88pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t7pqJXti59c1rJZw2pACVhJls5W5jKhWFw5ukj9e48U=;
        b=l02RL7pk7Su8tHUWJwPJ7Xx4hMrlrSewjOG8oxsy9PmDIVdRK61SSqD3wLUDHKsZoT
         fsJWeL6vcX+rulh8eaDn64hQr7qw4n0UZWerBLcIfTtWWyeBLpecXJwN0Tx6BoyB9Wt7
         GVYh+Ovzo1OPubggTXK5Z9LhRjIU9sRtAQDRFkpfyoCJcRxyqVW+HxD/cTqYWgZpc2Fn
         rW33CjwNTzMH37nYOrNXArqBbjSDDUfKytqAsd5khdu+S/UaVyJWHvBoOSYmwr1Wlemz
         Htfhd7JUw+ROJWXz4vQ/9qqHrkrzp+WSfCtUu6Lr8WoGZDjmnCFO5QKBeqEN9NmLJIGg
         jPQg==
X-Gm-Message-State: AOAM531fMLrsYDT7QeFTKbYZEFpGR4tHAdAOirti1mrf9rCbEFBQat5Q
        bUSeb1GNhFroUwMhagf5GErE2/UvaaYyETHneoA=
X-Google-Smtp-Source: ABdhPJyrh8so60UP05DbmhzkFCCL+XuSDGiplhBalDHBQgGOJbpmiGOkUNLDHSgeIXiFmFlKjE+F7nb8TUjaJlmgjag=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr2977980oif.5.1618503708222;
 Thu, 15 Apr 2021 09:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <YHaEn8h5JP9CGMee@mwanda>
In-Reply-To: <YHaEn8h5JP9CGMee@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 15 Apr 2021 12:21:37 -0400
Message-ID: <CADnq5_Nt+QuaT6Qo2eRguJ34dxjK-_DttOKT-ZeL1cPjgKncjQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix an error code in init_pmu_entry_by_type_and_add()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Jonathan Kim <jonathan.kim@amd.com>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        Harish Kasiviswanathan <harish.kasiviswanathan@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 14, 2021 at 1:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If the kmemdup() fails then this should return a negative error code
> but it currently returns success
>
> Fixes: b4a7db71ea06 ("drm/amdgpu: add per device user friendly xgmi events for vega20")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
> v2: I sent this patch in Feb but I accidentally added an unrelated
> hunk from nouveau to the commit.  Now both hunks are have been sent to
> the correct lists.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> index 19c0a3655228..82e9ecf84352 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> @@ -519,8 +519,10 @@ static int init_pmu_entry_by_type_and_add(struct amdgpu_pmu_entry *pmu_entry,
>         pmu_entry->pmu.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>                                                                 GFP_KERNEL);
>
> -       if (!pmu_entry->pmu.attr_groups)
> +       if (!pmu_entry->pmu.attr_groups) {
> +               ret = -ENOMEM;
>                 goto err_attr_group;
> +       }
>
>         snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d", pmu_entry->pmu_file_prefix,
>                                 adev_to_drm(pmu_entry->adev)->primary->index);
> --
> 2.30.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
