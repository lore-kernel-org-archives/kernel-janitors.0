Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7F2C3DA78
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Jan 2023 19:08:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjAMTH7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Jan 2023 14:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjAMTH4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Jan 2023 14:07:56 -0500
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADE365363
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Jan 2023 11:07:55 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-15eeec85280so2153537fac.11
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Jan 2023 11:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9/++tYBx4/CS9oFbvJdyuPyBg3xARMphBR/Ge5oHz/4=;
        b=EqT8rCrUXsb83eM5PH27bLad2RfhDACW+8ErSCKO8faaPXz+l0tBcqpkQ8J4eDQ5nn
         dZOYMgCldb6f1soJS5MVB5gm7Qzux+3xtZuqzlx+rSgQDw2Z7g3pRsHMEA7lRr+CfCEB
         JShMsWbab0bGtYIm6eFi0qNUxAPml8sO/F7GXKEqTEgQ3k0XgWBxHB4bDnKN0m7Rn1nK
         VQBzjgw2AzMs/Z0SYJtB9/nsm8nnV7vTKfOxJS0c/hb5YQEI87WXsHEunl7Jolao2bkY
         xg7yuKn/xRpu2Wuu5jnIP23S9+rSO/tJVgaky6Kn3Gh9X2RhLrY5ByfYD33aC2kM8mLv
         ZV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/++tYBx4/CS9oFbvJdyuPyBg3xARMphBR/Ge5oHz/4=;
        b=i7TgXJfOIk6kC9ZeK2jKLF2gm1xvcWSXN8bs0djLBRRXhf1uVqkKegcXcEtduwwwIp
         sv0d0fxCAO2o6cVH4lvQ/nrFK3+4hMzy03Jqv99bjDmYmPaHtUkc9aJj8UbxRryyxgHc
         XSudsbckxaY7DFRoQ8rQsJMbQ1DVx/cNJdGx6p5Akngy2vBxGPTiiYFNJATv8ywYo12N
         E1t0yJ+paY4Fk6rmFYceFCAHANLrl/eFOaM37h5Ot8tHEeFx2UlAeIlq5NlZZIES00BQ
         fTQaCoM1hJbdRB8AiC6VajUTBs2phpxdJyNC7KIlv17Os+xJCAADS9wLUr7flixRI8RY
         0o+Q==
X-Gm-Message-State: AFqh2kp50QM6NJaMWR5J3Mz1R0IMvxW58Kb2C6KwA46MjUijLKbd7fGI
        ezgxef37hwaZwKXJ4prsEYHTVTU2Cf7sUsyP3F6v0LAd
X-Google-Smtp-Source: AMrXdXtpQSgU1PV1XJK3cFJA5lOvfVijyOp0bzqMhFGbsrzplgtF8yyrzgqJYOzu3JV43x8bPHa3IO8vZQkZkeX+fJw=
X-Received: by 2002:a05:6870:c59c:b0:150:d9aa:4011 with SMTP id
 ba28-20020a056870c59c00b00150d9aa4011mr3293252oab.96.1673636874615; Fri, 13
 Jan 2023 11:07:54 -0800 (PST)
MIME-Version: 1.0
References: <Y8EtbpVGFJSDxM/m@kili>
In-Reply-To: <Y8EtbpVGFJSDxM/m@kili>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Jan 2023 14:07:43 -0500
Message-ID: <CADnq5_PvyeKXopyUA4JQFRs7ftfZUuaj6juWvE4B0Cy6Yrt2JQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add a missing tab
To:     Dan Carpenter <error27@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Jack Xiao <Jack.Xiao@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
        kernel-janitors@vger.kernel.org, David Airlie <airlied@gmail.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Haohui Mai <ricetons@gmail.com>, amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>,
        Lang Yu <Lang.Yu@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Fri, Jan 13, 2023 at 9:46 AM Dan Carpenter <error27@gmail.com> wrote:
>
> This tab was deleted accidentally and triggers a Smatch warning:
>
>     drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:1006 gfx_v8_0_init_microcode()
>     warn: inconsistent indenting
>
> Add it back.
>
> Fixes: 0aaafb7359d2 ("drm/amd: Use `amdgpu_ucode_*` helpers for GFX8")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> index 4fb577d047fd..b1f2684d854a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -1003,7 +1003,7 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
>                 err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
>                 if (err == -ENODEV) {
>                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
> -               err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
> +                       err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
>                 }
>         } else {
>                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
> --
> 2.35.1
