Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8305EC433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Apr 2021 16:23:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50F626115B
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Apr 2021 16:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhDOQYQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Apr 2021 12:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbhDOQYM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Apr 2021 12:24:12 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFA2C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Apr 2021 09:23:47 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id i18so3306876oii.2
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Apr 2021 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jXfRBBk0JPaYI5Z5HEgmHkynq+uw0ZW/JO/1K44osvA=;
        b=YXLg5KuFZVN4vU3sAvllAvmwTloIbA2P3M6Wir6P/9nBVGCImakgm4jSFMM8iGPlAT
         B+Z8PHp/GrR+3khPE3XVYOc+AIJvzlW3+1x6BAAsROsvaUwq+oUmWPPLAnOG4tRRKtyh
         vIPo7uJgDxwkFi9aNwq8QTItJmJcS1ZwDIHozEU7i1vVkmxTFLfu10A731xnmw7MqeTt
         OrgB34w7IGNkuRCn2D1jRc2BUevOxg0UAn061ecn1YSR+L0PxkWL8jeI8Ivzt6Yn9v/U
         l8lt7E119+61437nMOAd/kF9AFTVukzQ3R1f4INnYc4K+d6n74MUlYGBoLnTZlAiQRYC
         +bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jXfRBBk0JPaYI5Z5HEgmHkynq+uw0ZW/JO/1K44osvA=;
        b=XDgFlVkUI8rM9eOl15E864+Mx2w6aVZRs+hGOOXq8RhC8ZwARuAdMiKFfoz3Sshv7D
         C90rruAYsTW5JbHrhgwZO15GQovsY8xXbCHyx94wklwsZtmqNE3aD40mOO6gf6a4chu9
         7WlRqWitbD1ylcCswfJxUx9jLdw3TV9bwCvDm9QbOqLBKx9FosN8t4AVlWwLz5ULbAs6
         gyCwfkyjdYcelTLE9JRqUYVqMQF/gpPz3lp+XSbh5fByFuT0mbLFB8E1/iirmVmzs08b
         s7SjM9C6We0ikI1P2RlcwjnjF27ynMuUmkQiRbAA9h4m3bpvZsNHDGdrzk6ZMv8uzlmW
         43GQ==
X-Gm-Message-State: AOAM532X30kQYAVztKf8c0GFmfplo/os0cVPWk2eDv++8ZHJRfnRxm/R
        C4WFRH/zKiCN1xZf/uHbVY9w4EQg/uOejRGB4VdBBz2QySVidA==
X-Google-Smtp-Source: ABdhPJxOk3GIJTM4+56m3f0143Ty3G0wU5BP4zf4znCV82m7VpFkBSaw2z2SHKUjpoJm/PrRvp2MTLn+7giHxjJ1Buo=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr2983922oif.5.1618503827170;
 Thu, 15 Apr 2021 09:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <YHaEutSVsa63kcFZ@mwanda>
In-Reply-To: <YHaEutSVsa63kcFZ@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 15 Apr 2021 12:23:35 -0400
Message-ID: <CADnq5_PwkGzwLq_Jy_stMB4pN4ta6E5STrcMkE7HsAvg3Ln37w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix error code in smu_set_power_limit()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Lijo Lazar <lijo.lazar@amd.com>,
        David Airlie <airlied@linux.ie>,
        Kevin Wang <kevin1.wang@amd.com>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Wed, Apr 14, 2021 at 1:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We should return -EINVAL instead of success if the "limit" is too high.
>
> Fixes: e098bc9612c2 ("drm/amd/pm: optimize the power related source code layout")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index e0eb7ca112e2..c29d8b3131b7 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -2221,6 +2221,7 @@ static int smu_set_power_limit(void *handle, uint32_t limit)
>                 dev_err(smu->adev->dev,
>                         "New power limit (%d) is over the max allowed %d\n",
>                         limit, smu->max_power_limit);
> +               ret = -EINVAL;
>                 goto out;
>         }
>
> --
> 2.30.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
