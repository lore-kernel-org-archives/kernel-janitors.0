Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE78CCA47B
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Jul 2022 16:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbiGNQhS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Jul 2022 12:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiGNQhR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Jul 2022 12:37:17 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D487D5B046
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 09:37:16 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id oy13so4437660ejb.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xGhBTp6XRPi0txSgTZlfvtDUPgpddOrc4ZKc5VVIM6s=;
        b=e0uLLMIncFBbTwGIjIl1+bMVa6Sd78yc9uhbKc4xWxYJSuOISxjql2JxSbSokgAher
         T21hOslTSYyidI7/bIkAG0mp/9ZNhXTOdWXd7VPHfYtYqWJxa2uusobA0tEJBTCmMlrx
         Gt1RIlt0gFq4FB7TrPXQ4AD0saxWVXBFAR4xmycyhVB7bI0PAqz9UQKuCP8IHETcesBv
         OVbOIGe8vVn4I0AoOPaFlg0L2a+514xo87I2/eA1MwoLL8zm9t/8ryAqyPNhBp2UW/rX
         PlRsV4/4H84qomx2nhKufYlK4sC1UXTFheNIwSM4cpzz1Wpd55TxHMfdfcHWzviQG8s1
         Wi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xGhBTp6XRPi0txSgTZlfvtDUPgpddOrc4ZKc5VVIM6s=;
        b=4Cf56XwK9kqJpxvhqfYRbWlV6TsWXI4grkOdzrAdu1hhMsLSp1CtkZ7tVqtm64hjnm
         CRCryeW6/bKHkJIDUGgvRqGTvDKNeNeWD3V6p/u+600JNCd9zWS0BA51hAoknD9WFqZy
         flm5G6UxpV0whmXrWgfXz4oEe3GPU1i0Qxl5trj358gAIV+4wuHQsSdVh1QbKFTC+0Lb
         ncfuC1LB5jlAmysgBHle4+/X4/rf1leE7MjlvJGSi4bXqTeB8q9UjJWqG8sjATls5vlu
         qRFG1ngbLROP4O4p9O48Luubvgx+W5LBAw/I/r73WUHy33t9siffKf5hun65G87nRct6
         U0Rw==
X-Gm-Message-State: AJIora+gDwyEcqfCXLDhNIhZGRM5XUVd6vsG8ez1mjbSGjG7tSUkJXPZ
        lbtVBd/0BTsPIkkb0Cp7q+nD5lt+om6JVaSiYUA=
X-Google-Smtp-Source: AGRyM1v967M0anZhzBLm5GeEj5JA0DjTdKE/5DdEQ+hfX+QapVqZpyYibDMwZrZ/ei0QNlQWKcXiTfDn2+2GhjdCExk=
X-Received: by 2002:a17:906:4fc5:b0:72b:9943:6f10 with SMTP id
 i5-20020a1709064fc500b0072b99436f10mr9816539ejw.722.1657816635413; Thu, 14
 Jul 2022 09:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <Ys6tkVXQeJcgeZn0@kili>
In-Reply-To: <Ys6tkVXQeJcgeZn0@kili>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 14 Jul 2022 12:37:03 -0400
Message-ID: <CADnq5_OHKTsoXN1Oic+dFovWyWBFkVXDixX7WtERnOTns+1WzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unnecessary NULL check in commit_planes_for_stream()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        Joshua Aberback <joshua.aberback@amd.com>,
        kernel-janitors@vger.kernel.org, Alex Hung <alex.hung@amd.com>,
        Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
        David Airlie <airlied@linux.ie>, Roy Chan <roy.chan@amd.com>,
        Michael Strauss <michael.strauss@amd.com>,
        Alvin Lee <Alvin.Lee2@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Martin Leung <martin.leung@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jun Lei <Jun.Lei@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jimmy Kizito <Jimmy.Kizito@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Wed, Jul 13, 2022 at 7:34 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that:
>
>     drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3369 commit_planes_for_stream()
>     warn: variable dereferenced before check 'stream' (see line 3114)
>
> The 'stream' pointer cannot be NULL and the check can be removed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index dc2c59995a19..76f9af2c5e19 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -3366,7 +3366,7 @@ static void commit_planes_for_stream(struct dc *dc,
>                                         top_pipe_to_program->stream_res.tg,
>                                         CRTC_STATE_VACTIVE);
>
> -                       if (stream && should_use_dmub_lock(stream->link)) {
> +                       if (should_use_dmub_lock(stream->link)) {
>                                 union dmub_hw_lock_flags hw_locks = { 0 };
>                                 struct dmub_hw_lock_inst_flags inst_flags = { 0 };
>
> --
> 2.35.1
>
