Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E3BC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 10:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CD0E61247
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 10:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbhKKKnj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Nov 2021 05:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbhKKKng (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Nov 2021 05:43:36 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FDEC061205
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 02:40:45 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 7so672061oip.12
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WYwaEKCKS/S+KMPpSUbw1eQf1s6zmuCQeeq0EOP0iO4=;
        b=ekthIOhoS2xnKonG7qe/GeGCK1yMfkJMn5ZfAHVnzhUmcPwObSvfStqHXw4Zji6X9v
         fVemDQ7rZkbOsWQLfINsi0xQjWuGYZ+IHA817H2i4651BmV5TQXHXzOhfOOH3zry1ms5
         vAhmm2mnPSKRC6XLsvzZiBw1AR0nvKDp75puA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WYwaEKCKS/S+KMPpSUbw1eQf1s6zmuCQeeq0EOP0iO4=;
        b=2J0C2vATDUH8yEsZplobsIWx/qof+mysnSou3HZgw6TIwSK0ZY7jl0xV9zPdPs5a1c
         gQhdd9+5KQUHnZ5hue+3oMAAHESNkvFYeEF8sDyNYovGfKq8ci/CMkiPqc6hvZ86LvUD
         x183qfPXWVjiHYcDFfFfknJBhzHeUnrmOPMcD5bEJef2qrZNGorMDImWBRfRHfs8DM1o
         sZgGzDWy/TlBkoS/5VQoIrEuSscEl1C63Y/cRuyWVyzKR2PIuenwAA8/GiFVwcDqYuNg
         nuuAu4FKUb2ArcCRUMLxIqwyb9z7yQ993TMe/hr64C5JkgLtbp5g1qqydfw3COAOWype
         N9rw==
X-Gm-Message-State: AOAM5332Ye3XFQVgoKZm/1r9FPPbML4Du8P3B1hDkBFKLIZBhPkP18ym
        veZ/npVBbwgfGDpLx/pByhr97oZ6tHTnGw==
X-Google-Smtp-Source: ABdhPJxhiQ2wkMmuwX3qxyFhNRHHLi3xb/1wKgZte/Qk34oH6h0zGFiSvSqBlX14w7CmPTBJMnX1rQ==
X-Received: by 2002:a54:4e93:: with SMTP id c19mr19248160oiy.11.1636627244875;
        Thu, 11 Nov 2021 02:40:44 -0800 (PST)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com. [209.85.161.45])
        by smtp.gmail.com with ESMTPSA id j10sm467772ooq.5.2021.11.11.02.40.44
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 02:40:44 -0800 (PST)
Received: by mail-oo1-f45.google.com with SMTP id b31-20020a4a98e2000000b002bce352296cso1736279ooj.1
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 02:40:44 -0800 (PST)
X-Received: by 2002:a4a:5a45:: with SMTP id v66mr3659908ooa.26.1636627243818;
 Thu, 11 Nov 2021 02:40:43 -0800 (PST)
MIME-Version: 1.0
References: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
 <20211111103303.GQ2001@kadam>
In-Reply-To: <20211111103303.GQ2001@kadam>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Nov 2021 11:40:32 +0100
X-Gmail-Original-Message-ID: <CANiDSCvuk1M2C0HuErXnRcVAj6VgFESaPGPFes2OxC9Qtx5P5A@mail.gmail.com>
Message-ID: <CANiDSCvuk1M2C0HuErXnRcVAj6VgFESaPGPFes2OxC9Qtx5P5A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix a memory leak in an error handling
 path of 'uvc_ioctl_ctrl_map()'
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I belive this is also addressed by this patch that is under review:

https://patchwork.linuxtv.org/project/linux-media/patch/20211008120914.69175-1-ribalda@chromium.org/

On Thu, 11 Nov 2021 at 11:33, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Nov 11, 2021 at 09:06:11AM +0100, Christophe JAILLET wrote:
> > If 'map->name' can't be allocated, 'map' must be released before returning.
> >
> > Fixes: 70fa906d6fce ("media: uvcvideo: Use control names from framework")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index f4e4aff8ddf7..5aa76a9a6080 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
> >       if (v4l2_ctrl_get_name(map->id) == NULL) {
> >               map->name = kmemdup(xmap->name, sizeof(xmap->name),
> >                                   GFP_KERNEL);
> > -             if (!map->name)
> > +             if (!map->name) {
> > +                     kfree(map);
> >                       return -ENOMEM;
> > +             }
>
> Your patch is fine but there is a second issue.  The error handling
> should free "map->name" as well.  The problem is that this function
> frees everything on the success path at all, but freeing map->name on
> the success path will lead to a crash so you have to do something
> weird like:
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4e4aff8ddf7..953a5cbf7945 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -90,6 +90,9 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>         ret = uvc_ctrl_add_mapping(chain, map);
>
>         kfree(map->menu_info);
> +free_name:
> +       if (ret)
> +               kfree(map->name);
>  free_map:
>         kfree(map);
>
>


-- 
Ricardo Ribalda
