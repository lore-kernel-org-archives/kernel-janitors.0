Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A114C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Mar 2022 20:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiCQUi5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Mar 2022 16:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiCQUi4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Mar 2022 16:38:56 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622C7EAD
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Mar 2022 13:37:39 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id ay7so6841107oib.8
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Mar 2022 13:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8j5CUElz+Xo86FpooZsOlxnvFZ+PR1Bpcl1guwPiarA=;
        b=gz0dwdB8WpOZfkssgMWBpHYCL8oGf20dbtwM2azw1sRmxoE+lAi28BW0CPKaTDxa+R
         9qrDBgrcGWMV1FE74Mrg+sEbObEM4Q6fywZ/x9fQ2pWh6jOt7DHaL6uyUsd9eZ50Hx1g
         a1zGOvmzOsR+FfSIMuku+Bcgy4xTh4yufIPbsFw/XmhG+2VQw1z5JKx5ZE3ZsDAAR1Hg
         69Ad71CsximB9oHTzh0lVNA7zT/75t3A8YbvzEv6IQh9cGAnkMuzxODeZdJMClOPS1tw
         b8cD/K4fg+7vcrBMeI3NArluLYk2xFB4Hkvsid/QhrWCDZpdc01AtUZZcpC/6rySgWo0
         7EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8j5CUElz+Xo86FpooZsOlxnvFZ+PR1Bpcl1guwPiarA=;
        b=KqZTsw7wdhG5/ykRQ2SLGv2jPpbCxvjb+EH+mJZp6JzUOYlWKL333n8phv6PLZhR27
         ZbCFYhGlEivoRTxhn7GgSlbVVG9apmU1hR7OZ9fPxtPyS3qESebkMAgAUAfK+1P0ZXtu
         vW3u3BLwAWmhwnGoaWWq5wWOVcO+IYkXrKfrjLhK3Jyew9WTgsCXeGVfqleOj5vYYgQ+
         3Hb898I1XM/Z/f/pjMtbyf4Vs0CXgsS823dtmdOQ05CIC7u7uoE9L9JqadzGXY9KFKZP
         4xnCRh5lN0joh48U8+uK4APj37YbD7hdGh9tejULYymzqv9V/1XWFHa7QUV1IJFaslSS
         eBFg==
X-Gm-Message-State: AOAM530Gc1DntpADw7Pjto7qSAqBPwKg4oO97J8UMuBIt1sZkMF1ZRkF
        8m/+uvgzTcCzY2D6zdhVaH/aa0uFB41xc2LpsgI=
X-Google-Smtp-Source: ABdhPJyiBHRtB02UVP/cno1U+t2NeLS239WXwvlRFSWx7qxMOQM9DsBhnreJnrLXxaQEnb0U3SvkU/5zi4guhJV6pTE=
X-Received: by 2002:aca:d07:0:b0:2ec:eaaf:a036 with SMTP id
 7-20020aca0d07000000b002eceaafa036mr2877112oin.253.1647549458774; Thu, 17 Mar
 2022 13:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220316084148.GD30941@kili>
In-Reply-To: <20220316084148.GD30941@kili>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 17 Mar 2022 16:37:27 -0400
Message-ID: <CADnq5_OSHLyHew-emmzp99=8kigJohWjzL4z2dGCiDU=1dB-tw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Tao Zhou <tao.zhou1@amd.com>, David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Lijo Lazar <lijo.lazar@amd.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
        yipechai <YiPeng.Chai@amd.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Evan Quan <evan.quan@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dennis Li <Dennis.Li@amd.com>, Alex Xie <AlexBin.Xie@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Wed, Mar 16, 2022 at 4:42 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This post-op should be a pre-op so that we do not pass -1 as the bit
> number to test_bit().  The current code will loop downwards from 63 to
> -1.  After changing to a pre-op, it loops from 63 to 0.
>
> Fixes: 71c37505e7ea ("drm/amdgpu/gfx: move more common KIQ code to amdgpu_gfx.c")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 8fe939976224..28a736c507bb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -266,7 +266,7 @@ static int amdgpu_gfx_kiq_acquire(struct amdgpu_device *adev,
>                     * adev->gfx.mec.num_pipe_per_mec
>                     * adev->gfx.mec.num_queue_per_pipe;
>
> -       while (queue_bit-- >= 0) {
> +       while (--queue_bit >= 0) {
>                 if (test_bit(queue_bit, adev->gfx.mec.queue_bitmap))
>                         continue;
>
> --
> 2.20.1
>
