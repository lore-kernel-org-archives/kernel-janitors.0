Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25221EB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 15:48:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbjGUPsB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbjGUPr6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 11:47:58 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831D61BD
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 08:47:57 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a38953c928so1470376b6e.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689954477; x=1690559277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85BEVu4yQdhInWHjBPNn/bUdJhVBiL/B5hoGlXbtQnQ=;
        b=UfU33fGHSy87HgdkmMlQAqg9vR7xlzd5Vcw+ZqIUVoOhV5ImK5apggHbgJ/etBauaU
         ptl/07DxVUxNst/MyBPQz7NI55XahpK8pXEia7IqBFWm1Oqo9YcSUGQbziudnlIXRWDl
         AKhgxvHZ09sB6i/rNb8++hvXuuAKD2KRP4T2U3hfXc3R7dzw253q1neb4J/2hlV9LloW
         BixP+2CmYaKXqp0lseNCN1lSojUIiTkWD6rHfzBDxDFpAT0bnLbKqiOqre0LPdUzlkOA
         rwToD6c4Jdrytl3eehvcdbnrZYs4dcXCinzdSHlIWvdA5ca1LTr9t1KA4KXc2PO9jUFF
         v8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689954477; x=1690559277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85BEVu4yQdhInWHjBPNn/bUdJhVBiL/B5hoGlXbtQnQ=;
        b=EaSOk0V5z7LTyEKZHQhTgC36qpp2zUHozhbGJjhpT/HI7ow9VkdskHmh4EjQpa9Osc
         jqhijQ+Ssm6Fap057olNQ1ruEWoUAsQZ5KYzjRM+7LrtZ9m0PUN9+wTLwdvRKkRlkI+r
         IDetf+MWUr6JoX2gnouHCxS1GLm8Q0aY/Z3Iz3N3lmvi3kop8oFVO1A1qKdc6awPPtfm
         8KEJkLa7AQZziInKX3SuzCOm8mO0KT/+dTsH+eie9ldrR0kMrkuQybgpYbC9V8SsAaQJ
         n0LEyxq0rIiL++0zO1tt99s6+ngdVd4ve4AA3aRdp4fdwVN4iksUn8UVO6Bc+Ik7dr3u
         48Xg==
X-Gm-Message-State: ABy/qLaEWqStD4CSsGyzhozeew+7hMn5rJHUw6/X6NNlN4yXC5XAvSFF
        uSUnLO3moA3VPI0u3oh/cY7EQwZA+vAHKwN2ZR4u+neY
X-Google-Smtp-Source: APBJJlE/RRfy/2JXiahuX+7/L9bWZm70AmvtHOV5SKdDHjS9uJ2Ijtsve26XT3f2xiOGU5p0ojQ03HpKbWXRlIhi4JE=
X-Received: by 2002:a05:6808:14c9:b0:38e:a824:27d3 with SMTP id
 f9-20020a05680814c900b0038ea82427d3mr3154456oiw.27.1689954476846; Fri, 21 Jul
 2023 08:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <0a4b4a77-75e0-4a1f-a944-6ea5c75a2bb9@moroto.mountain>
In-Reply-To: <0a4b4a77-75e0-4a1f-a944-6ea5c75a2bb9@moroto.mountain>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 21 Jul 2023 11:47:45 -0400
Message-ID: <CADnq5_Nnok5tPbcuVqTJX+t3u4mdTFFjiC60et=19O7=Rt5T+w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Unlock on error path in dm_handle_mst_sideband_msg_ready_event()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Wayne Lin <wayne.lin@amd.com>, Alan Liu <haoping.liu@amd.com>,
        kernel-janitors@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
        David Airlie <airlied@gmail.com>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx@lists.freedesktop.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        Hamza Mahfooz <hamza.mahfooz@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 21, 2023 at 10:57=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> This error path needs to unlock the "aconnector->handle_mst_msg_ready"
> mutex before returning.
>
> Fixes: bb4fa525f327 ("drm/amd/display: Add polling method to handle MST r=
eply packet")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 1abdec14344e..943959012d04 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -707,7 +707,7 @@ void dm_handle_mst_sideband_msg_ready_event(
>
>                         if (retry =3D=3D 3) {
>                                 DRM_ERROR("Failed to ack MST event.\n");
> -                               return;
> +                               break;
>                         }
>
>                         drm_dp_mst_hpd_irq_send_new_request(&aconnector->=
mst_mgr);
> --
> 2.39.2
>
