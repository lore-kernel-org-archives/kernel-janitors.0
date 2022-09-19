Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC46ECAAA1
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Sep 2022 21:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiISVNT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Sep 2022 17:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiISVNS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Sep 2022 17:13:18 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C6F48C9A
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Sep 2022 14:13:17 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y3so1676560ejc.1
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Sep 2022 14:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bhPmmvgwrI1UWM0Mt5gyQZnNHupU9etq5Dz6jZIcg4M=;
        b=mejDcyLSWZX5mTMuwttKSMZJm/QXJls6I8T91VDCeShs4ASYX1lvxUPBvTC3zrre4q
         All/qoUAXzFIgQJ4R7mPOegXTUDzQ2Kk0QO+zGqSftVDPMFjE9rDOKC6kEtTaefrbyzJ
         3OYEsoyVN0+wUQTC0yPVPfclgxmA9DYEAYu3amjVekoKyDfz+7Xy2OqePk1BQ2SQLcgc
         netRXOM6oxDD1Q2oNxcEYcWljqaceOfKeLLZsF8F69hkNa4/OS/oWDkfMD2lnCXRSecH
         MTXI2/iv2VNj3MRrI8NjCwUeyWV+xUl63IntLIyiHz0sh32s9dMbyn7M87+Y4R2oOkb3
         ChUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bhPmmvgwrI1UWM0Mt5gyQZnNHupU9etq5Dz6jZIcg4M=;
        b=b6pqG7Cb4bI/A+/6sWMfa3fv5azvYibgMCh8WFXk0TcatgUbJlejJPjHBPD/5ykAl3
         eNrUKCfwnLDxa5R/ml3NqK3awKnXK7HEmDGhWw3WhX8NYFSJNF1o9xI6h6G3210bxUK4
         3r0bUBljV+7oUQz8Z54OtokNWEk/72yPimo5r88HP9QvCiJzCY9xJvtshh8ntRyWTmgh
         I9V8jCz9vleSdOutSV39QnJNjCrnkyBbtXDwWq6ren4rKciP9Q/iYYFfndJGmlmyMt/W
         95+iHA9IfKtC/pTRWI8TBLoYdn82e75dJfEoFpkSFhdb8FsZUh3RMD7pKgjQERY7wyVP
         jeSQ==
X-Gm-Message-State: ACrzQf1yHS0JwENk0h3gpkXHkUQTARGG/T9MZrmazkQBzlsXGurrGpaZ
        SSzgPp1PNg+qkP05itSWjK/4oCGPm5Rjb5Ybotg=
X-Google-Smtp-Source: AMsMyM7zA8miSzkjN6wj3Wenio+9x9e3vwc1VxojIm7Bo9m4q5oppQbWwS1UZxQZlPWbppFokj1RitvLKfh3ykEyn3E=
X-Received: by 2002:a17:907:6d09:b0:780:aef0:694c with SMTP id
 sa9-20020a1709076d0900b00780aef0694cmr12570553ejc.717.1663621995972; Mon, 19
 Sep 2022 14:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <YygN7jY0GdUSQSy0@kili>
In-Reply-To: <YygN7jY0GdUSQSy0@kili>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Mon, 19 Sep 2022 14:13:04 -0700
Message-ID: <CAPaKu7RbWXTziR0pCeqgYiq-hVdayG8gh_hd_t0gu1swZtA9uw@mail.gmail.com>
Subject: Re: [PATCH v2] virtio-gpu: fix shift wrapping bug in virtio_gpu_fence_event_create()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Nicholas Verne <nverne@chromium.org>,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Sep 18, 2022 at 11:36 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The ->ring_idx_mask variable is a u64 so static checkers, Smatch in
> this case, complain if the BIT() is not also a u64.
>
> drivers/gpu/drm/virtio/virtgpu_ioctl.c:50 virtio_gpu_fence_event_create()
> warn: should '(1 << ring_idx)' be a 64 bit type?
>
> Fixes: cd7f5ca33585 ("drm/virtio: implement context init: add virtio_gpu_fence_event")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Style change.  Use BIT_ULL().
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
>
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 3b1701607aae..5d05093014ac 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -47,7 +47,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
>         struct virtio_gpu_fence_event *e = NULL;
>         int ret;
>
> -       if (!(vfpriv->ring_idx_mask & (1 << ring_idx)))
> +       if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
>                 return 0;
>
>         e = kzalloc(sizeof(*e), GFP_KERNEL);
> --
> 2.35.1
>
