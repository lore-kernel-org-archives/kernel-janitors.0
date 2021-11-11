Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16DAC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 08:12:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93B45610C8
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 08:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhKKIPc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Nov 2021 03:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhKKIPb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Nov 2021 03:15:31 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB201C061766
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 00:12:42 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id m6so10302964oim.2
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 00:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQq/BQSI+/+gb2fPGmG7DEX6ES551D0y01me3Mg5Cvk=;
        b=grffX+6iRJp/AuG8bzCb596zILz1Ddz2xAkvUAEL4mdY08rdPabLMt4cHLeaNW39g3
         RWdKkKMWez+bBKfMZkTBhxNHbTDQWO/yy5isw8RVc4MmEGIT7Pp3lW9QhhKrnMRFsh23
         AnwHXTaQdTA8wAsGQHr8tjfYEyrDxB6XJfu4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQq/BQSI+/+gb2fPGmG7DEX6ES551D0y01me3Mg5Cvk=;
        b=DuY6zzPPjj8pJrsHXOukRBFfmHKg7Zmq1M5Ia6cfiUrK2LlsRbUSBA3+sYWlwAWulo
         b+ocml8XzhYfFBOod6PqXqMEXR7ujuLErDiCr2Cn2OPtPxBav8hH5kkyav2Y1u9cXdR/
         r4PO87ZGAfDw9DrjhX2LkDOpV/o1kCwfpMOWPYkif6JtOL4PkQIMlu33ELPcbQFry8BW
         Ftsm1KFr4avmSrr/MKOLWpLxfHP2tnWMU0wsPsxe/4TMOKDcQyfIyfGKYvxmNdsM2dq2
         4RgeN0TcaBhUW8MgnMKyEp5sg5lFY4JI2ywCuXUIDsaAAjpwUrAzPHweSx+1uDwc5UPN
         67Kg==
X-Gm-Message-State: AOAM532VQBwOKyzFMqGnhXdtNuxzm6P0gm7hXZDLpMmH3NmGJJa5ADLX
        eyKVTLV13EKLYg4PwdyWRNEkWHF/Zda79Q==
X-Google-Smtp-Source: ABdhPJwXHtMQxZm9Tc8bYM3fDLxAS/4IkNgG7WC5LMH0stqMoYXQraKAoI5/ao01KKyfdqXnE7bBhA==
X-Received: by 2002:a05:6808:1403:: with SMTP id w3mr6669335oiv.80.1636618361884;
        Thu, 11 Nov 2021 00:12:41 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id f25sm421766oog.44.2021.11.11.00.12.41
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 00:12:41 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so7891702otf.2
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 00:12:41 -0800 (PST)
X-Received: by 2002:a9d:5541:: with SMTP id h1mr4442058oti.229.1636618360946;
 Thu, 11 Nov 2021 00:12:40 -0800 (PST)
MIME-Version: 1.0
References: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Nov 2021 09:12:29 +0100
X-Gmail-Original-Message-ID: <CANiDSCsWE+cr70hdNkqXKxj8EXdJ-bRtXqLDgiGhYVdHYTFHBQ@mail.gmail.com>
Message-ID: <CANiDSCsWE+cr70hdNkqXKxj8EXdJ-bRtXqLDgiGhYVdHYTFHBQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix a memory leak in an error handling
 path of 'uvc_ioctl_ctrl_map()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe

I believe this is a dup of:
https://lore.kernel.org/lkml/20210917114930.47261-1-colin.king@canonical.com/

Thanks

On Thu, 11 Nov 2021 at 09:06, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If 'map->name' can't be allocated, 'map' must be released before returning.
>
> Fixes: 70fa906d6fce ("media: uvcvideo: Use control names from framework")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4e4aff8ddf7..5aa76a9a6080 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>         if (v4l2_ctrl_get_name(map->id) == NULL) {
>                 map->name = kmemdup(xmap->name, sizeof(xmap->name),
>                                     GFP_KERNEL);
> -               if (!map->name)
> +               if (!map->name) {
> +                       kfree(map);
>                         return -ENOMEM;
> +               }
>         }
>         memcpy(map->entity, xmap->entity, sizeof(map->entity));
>         map->selector = xmap->selector;
> --
> 2.30.2
>


-- 
Ricardo Ribalda
