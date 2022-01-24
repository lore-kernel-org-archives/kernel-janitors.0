Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE15C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jan 2022 22:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380795AbiAXWEb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jan 2022 17:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1454661AbiAXVdT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jan 2022 16:33:19 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583BFC075974
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jan 2022 12:21:22 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id n8so11960921lfq.4
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jan 2022 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wyMvRdYooGkNnpiPbja1/uSfdA1/U9snsdIqkkHvJEc=;
        b=htyyJ1Z3GRsmUZan58N3Prr0pEBcELIKOR7HkjpOyyQX11oHKKsVhGziUzHRAk9gAQ
         qKIJ1la4FQPjdeduY0TumzsXC1keATPYK+6nRTIgrBg2Yx3j+qLswnmWYNKKkUD32SGa
         NEUVgy1cbCWp9ftv9S/S5W24Xf77OuvIUUPVXQgqfByM1wogeIS6Un6jOyUF9MMCkpXG
         teWa0koFmo2WyVhH9ii5kbYSuulkh24QTq4DkaKRlSHApSrAqcmB2KzC4vQu8X9FU9gv
         2EOV8xLbbtvhhc9TN8f/mQhQ6bw3lBLH/4ZukkYU7sfiq5QPCY/xyIFbbSA1hYPq/sPZ
         OO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wyMvRdYooGkNnpiPbja1/uSfdA1/U9snsdIqkkHvJEc=;
        b=SRdmrr/L/d9fpXV9/liAgfgTKGLPDxr7/OTw6QX5f7nVs+9ReA19OsKKMlRCFSYPGW
         1EoLZ0lZ/bDxwry7Jtqqme7uWPbxW7pUH0XhsEYvDchj+UMioVdesivpuCyMdxsdVdPy
         spTLsw7nYKrNc1EN9TKbBabmp+3iVq8cJophkyDi4nnHbmg1KBvjo0oPN0cbT3dZvHIa
         /FHwhwkNP8ZZ/yzcb4ddBa/cTe//Uq5Kla/zmADuCZo4L+ydMUj23fdRjninYbYSpqrs
         5jJ/2xKm2d5569yDhpnsgW9lxTKX1ctqEa/JL+SHPqxQ0/oxUvUwy27L47/XOy8Zf7Xz
         TgJA==
X-Gm-Message-State: AOAM530F4VEEcR8JD1SLf2oJHjkq4s91uxp82/Nk9EN1SfOryf1hoaZL
        9VKTv1gRVvihrs49HLxG/FoA/DrfFuERoaya4B2oWg==
X-Google-Smtp-Source: ABdhPJzNbWHLfVK0G4oHmQubeJbQeEM15S/l2in0t/MpUPzxIWlbk0Bzs9ERTx3WfdkjIX9h30ubfENOdawlZCrT2bU=
X-Received: by 2002:a19:ad02:: with SMTP id t2mr14058303lfc.82.1643055680456;
 Mon, 24 Jan 2022 12:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20220119224628.123084-1-colin.i.king@gmail.com>
In-Reply-To: <20220119224628.123084-1-colin.i.king@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 24 Jan 2022 12:21:07 -0800
Message-ID: <CAKwvOdnMibw77AvvWw7seB2PPamS_OLMUarSjdsa4w4OP1isKg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove redundant assignment to reg
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jan 19, 2022 at 2:46 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The pointer reg is being assigned a value that is not read, the
> exit path via label 'out' never accesses it. The assignment is
> redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/gpu/drm/radeon/radeon_object.c:570:3: warning: Value
> stored to 'reg' is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/radeon/radeon_object.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index 56ede9d63b12..87536d205593 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -567,7 +567,6 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
>                 return 0;
>
>         if (bo->surface_reg >= 0) {
> -               reg = &rdev->surface_regs[bo->surface_reg];
>                 i = bo->surface_reg;
>                 goto out;
>         }
> --
> 2.33.1
>
>


-- 
Thanks,
~Nick Desaulniers
