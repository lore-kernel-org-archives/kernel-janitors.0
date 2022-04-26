Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A81AC433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Apr 2022 14:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346733AbiDZOvR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Apr 2022 10:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiDZOvQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Apr 2022 10:51:16 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 003343614A
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Apr 2022 07:48:08 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-e93ff05b23so6480245fac.9
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Apr 2022 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DpnqB2AGxqyw3CoghEbJ2vm3YwFMuogHkt07765d/4Y=;
        b=h909C1DU4Y9hMLFITeZRFzhAHAaMyz19mocTiohQwpgkCha4ONej9EKuUPpjNZB+yo
         vu1EfhlAWA8mbuJTvlOdv3/80apueEWsh9Ub8i0+PKlnnRQEKJMqQE2ic1Hd3bZad047
         jri7ooT5HWOq1GlgFbyWHpX09AxYt5Wf5NtwB8uUZrH/VjcTyClTrWr7I6AtfaqGZrA8
         W2XP/6XZoMBke5EGQ4TGnV7x9AxEyrn4nfaMiBITpL+usINt+BxyHtAZJM2Zvl1lHIlA
         zLWDpjL6NwRBgB1MPOXXFodoJKzqea0k+A7d3Tbp13h6ZCPXh/hwNPke5X+4pjGJ82+k
         Ctmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DpnqB2AGxqyw3CoghEbJ2vm3YwFMuogHkt07765d/4Y=;
        b=j3NOxxI82tcPC109TsQPqA8FmFcw+qy/LLGIkdvY3NUTsI2tAZftQDjnREzuwHbcGv
         NNOE0aCSX2lRh7zX7B3Jw1pVrWJzSV+pdWhUUowdLr/xBK1ah2Q8DCOYzW7xjWrvC0MO
         hXUa1ObZN5lSotTEhQeeMsF9AcQbbkVcBTs41tM6pEZIdPBu62ah3X7afB00FziLnBd6
         43UDyiW/jA5+cPynUxQh2knOeq73D/axppejIEaGL5PEMamzYaLg+42nvelo9EFHc6cE
         lgo6gud/9ILuITwmccIxovoZW06QJsvLNfBZ0bbGZugVJ+sIXuqf6+iUsk5dUG4MwjdN
         pOOw==
X-Gm-Message-State: AOAM532fKoELnRMoXx3enfWmL+88+HGitZNFwkHk+AdbIjPF2WS0mBgS
        gKWbLh/pe+WPTC1i7ESjo5ogM/Z8m7koLS6xuKE=
X-Google-Smtp-Source: ABdhPJxFZ1eTsOp1jW5ozMJ2r23INM9MidyGZO+m3ftYvOYdGMzSgXchHTKbRpG06n7GC5DcvbYoEu8DHzJ624Cw3u0=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr12934047oaa.200.1650984488340; Tue, 26
 Apr 2022 07:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <Ymexw96moFElQvqG@kili> <YmeyEF4djrguNMEF@kili>
In-Reply-To: <YmeyEF4djrguNMEF@kili>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 26 Apr 2022 10:47:57 -0400
Message-ID: <CADnq5_PmoHWzJ9Mh=-ghMzOexv20h-Du2hGsoaR0owdDBnc8iw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: debugfs: fix NULL dereference in ta_if_invoke_debugfs_write()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Candice Li <candice.li@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
        David Airlie <airlied@linux.ie>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        John Clements <john.clements@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied the series.  Thanks!

Alex

On Tue, Apr 26, 2022 at 4:49 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If the kzalloc() fails then this code will crash.  Return -ENOMEM instead.
>
> Fixes: e50d9ba0d2cd ("drm/amdgpu: Add debugfs TA load/unload/invoke support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This would look nicer as:
>
>         shared_buf = memdup_user(&buf[copy_pos], shared_buf_len);
>         if (IS_ERR(shared_buf))
>                 return PTR_ERR(shared_buf);
>
> Probably eventually this will be sent as an automated Coccinelle patch?
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> index 32bcc20b9e3f..6806deb098d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> @@ -254,7 +254,7 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
>
>         shared_buf = kzalloc(shared_buf_len, GFP_KERNEL);
>         if (!shared_buf)
> -               ret = -ENOMEM;
> +               return -ENOMEM;
>         if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len)) {
>                 ret = -EFAULT;
>                 goto err_free_shared_buf;
> --
> 2.35.1
>
