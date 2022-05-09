Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946E1C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon,  9 May 2022 14:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237708AbiEIOyV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 9 May 2022 10:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237667AbiEIOyT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 May 2022 10:54:19 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A1724DC45
        for <kernel-janitors@vger.kernel.org>; Mon,  9 May 2022 07:50:25 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id s12-20020a4aeacc000000b0035ebb6d1a5fso2617367ooh.3
        for <kernel-janitors@vger.kernel.org>; Mon, 09 May 2022 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l8GVQ6AWSjvYXNMikMsGU4XP+3VFDIhtmfbdHby1tIU=;
        b=MAH4/W/EnlsZReUhYlXq7IPFuzRWwZ+GgYW4b/HfcBIMcrlKobSxWTUlvxGfAiC15G
         h0kP/9J6s0OoKyhcRmKB941IevBiWNj8EqLlOhNkSQkcjto8uvFYEdAJ3yV3+2kx3a4M
         fEuJrWvmc6KfneN54ZuAPDwvYbqNDlhuqd7c+LfknkI0IVi9Px1CaCRjS7CaQagyiuZc
         /y/S6zHQxNxMoW4FD3RSW6iVV7miezmXFfkK9eTiqR6SIztxXAIvl22/ACPXsXcnrPYK
         abGOFEIywkytA3+ZeA9PI+osobX9dTVVtPR3BiA2FTqtiWZi9qFKR7Rxj+s0hxaX7/gu
         PWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l8GVQ6AWSjvYXNMikMsGU4XP+3VFDIhtmfbdHby1tIU=;
        b=xYRelDSPdRzUGUcoT4OgoBjdlekAQlQWLpXOcV9AXfRRwKd7eeb/cIswIm4G0wJJpU
         f4V5/Y4CUqXfDrPVaLUcYG7fATfWVietmp+h8dej48XtzLOeoUOva8DVCxgx0We2UCW1
         +/pG/LYYtnp11hBmkU8FHuZUsIFEm2oFiQyo62WxKLy3LYsZkCudfc3vbsVLB0i+cmNO
         cJkjOSYjC2wobCXdH0S6rzzvi18n+IyGeaD4b8kDrVgrkbQWUiWCkSsJsTuXzDHmhlJ4
         lkgsaCA6mzTa0Q17Gawv9zrWal8v8uqlxPnNu2ndC6OzFwAgcFp+EG/uhgKP4GL5O+Vm
         Bt5g==
X-Gm-Message-State: AOAM530zYRcfGO4yHWZ9c61ZQG3YdOVRepWoyyCldmiPUqa7qd2hDBDG
        mSHQklhDwrbfzyXGFkFRFHrx/QOUL6Bv0xFXnUA=
X-Google-Smtp-Source: ABdhPJzVFKnY+vaV0aAQObkc8q5Qx9D28UM0iNcDxV/+JtlTF+4SLXiYvwkyg9gmeEQESIqBWioY2axN1f/mrOeKRVo=
X-Received: by 2002:a4a:4a86:0:b0:35e:a2d3:763b with SMTP id
 k128-20020a4a4a86000000b0035ea2d3763bmr6024003oob.23.1652107824577; Mon, 09
 May 2022 07:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <YnjaIZN/Wj+QvVGP@kili>
In-Reply-To: <YnjaIZN/Wj+QvVGP@kili>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 9 May 2022 10:50:13 -0400
Message-ID: <CADnq5_NjvWfOq6i0unf1SmfBc_tdE=V5_AEn-ak0C4+4H24cTA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx11: unlock on error in gfx_v11_0_kiq_resume()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Jack Xiao <Jack.Xiao@amd.com>, David Airlie <airlied@linux.ie>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org,
        Wenhui Sheng <Wenhui.Sheng@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Mon, May 9, 2022 at 5:09 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Add a missing amdgpu_bo_unreserve(ring->mqd_obj) to an error path in
> gfx_v11_0_kiq_resume().
>
> Fixes: 3d879e81f0f9 ("drm/amdgpu: add init support for GFX11 (v2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> index 184bf554acca..92312f7c7f29 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -4312,8 +4312,10 @@ static int gfx_v11_0_kiq_resume(struct amdgpu_device *adev)
>                 return r;
>
>         r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> -       if (unlikely(r != 0))
> +       if (unlikely(r != 0)) {
> +               amdgpu_bo_unreserve(ring->mqd_obj);
>                 return r;
> +       }
>
>         gfx_v11_0_kiq_init_queue(ring);
>         amdgpu_bo_kunmap(ring->mqd_obj);
> --
> 2.35.1
>
