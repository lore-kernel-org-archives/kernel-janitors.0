Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B3AC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Sep 2021 07:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F57A60F9E
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Sep 2021 07:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239941AbhIFHKt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 6 Sep 2021 03:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239829AbhIFHKq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Sep 2021 03:10:46 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BF1C06175F
        for <kernel-janitors@vger.kernel.org>; Mon,  6 Sep 2021 00:09:42 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id v16so5892218ilo.10
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Sep 2021 00:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t6hG9tjceGU3kqViByrG+996KWcAe362teOFSdA60G4=;
        b=jSxDw3iEBpqW+qFNyYXJtKA0bpHj6GXzxG3qcwsmRo6dXmDQ2kSqURUZxgnfOczqi7
         6NuJ5GGZKkyRgg9nECZ08OiJi4xT+yRsTtOvo3WJJcHEQiqICpLq/CuS29QUNhS1AMWQ
         9TLsFanGHWEF5U/9caJd5zGEUYH6iPeTQO6Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t6hG9tjceGU3kqViByrG+996KWcAe362teOFSdA60G4=;
        b=HfXQKVkAr8JI5dkThhfocovAjOoJ4kRxoZLvSXvokWUNxB9XHcSkWDa/pJ8Vt/zed+
         3aCI+U+2UAIJVhh+MUshVxy/J9h3sfz1QncrvR5VkJeCfp4K/yOijBLx7k4OUQo9l6gT
         QDERtKSDaiJmxpcmq6ofCTUA3VyPzIuDmemLche42vpKhcqY3+4ectXhiPJZQKxpbdZF
         KbVlPKipNGfemJS4L6ijCzkF0Dq1rRrRtM3MINPLGrW9vUTAMC7uIb3iL+4bnsEX7WkY
         arthiODnvYsQm2sBg3V6SbJrXx7HIcqfz2TSvSNpwIn89v/H/Ie9EdaD+Le+6hS4aPHI
         KFPA==
X-Gm-Message-State: AOAM531+SbFgHYGKVL2zl9CECow/QVRCZyRk/a1ZHKBIMQ+tmYXrUzCD
        i3maK7mopUPpTQTAj0nOswPITxkaVJW2hg==
X-Google-Smtp-Source: ABdhPJxwkV5M4AIosJP6gtW33ctCRVhBb0PWpevay0Q+nN3dmdkckxfo+4FrWmOIiAyZi8o4wk9wlQ==
X-Received: by 2002:a05:6e02:144:: with SMTP id j4mr7675383ilr.75.1630912181806;
        Mon, 06 Sep 2021 00:09:41 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id d17sm4185049ilf.49.2021.09.06.00.09.39
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 00:09:40 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id g9so7448439ioq.11
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Sep 2021 00:09:39 -0700 (PDT)
X-Received: by 2002:a6b:f610:: with SMTP id n16mr8835657ioh.139.1630912179530;
 Mon, 06 Sep 2021 00:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <4c96691f21293dea1c3584f80a58138e2a2f9219.1630736273.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <4c96691f21293dea1c3584f80a58138e2a2f9219.1630736273.git.christophe.jaillet@wanadoo.fr>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 6 Sep 2021 09:09:28 +0200
X-Gmail-Original-Message-ID: <CANiDSCsJB-WMPwrfLK2i_oZHnS4Oo+WBx_inPDOfnDSXcAhhPg@mail.gmail.com>
Message-ID: <CANiDSCsJB-WMPwrfLK2i_oZHnS4Oo+WBx_inPDOfnDSXcAhhPg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix a memory leak in error handling code
 in 'uvc_gpio_parse()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe

Indeed, there is a bug, uvc_delete will not free the entity because it
has not been added yet.

Thanks for catching it up.

Reviewed by: Ricardo Ribalda <ribalda@chromium.org>

On Sat, 4 Sept 2021 at 08:20, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Memory allocated in 'uvc_alloc_entity()' should be freed if an error
> occurs after it.
>
> Reorder the code in order to avoid the leak.
>
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b1b055784f8d..a4c45424ba7e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1533,10 +1533,6 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>         if (IS_ERR_OR_NULL(gpio_privacy))
>                 return PTR_ERR_OR_ZERO(gpio_privacy);
>
> -       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> -       if (!unit)
> -               return -ENOMEM;
> -
>         irq = gpiod_to_irq(gpio_privacy);
>         if (irq < 0) {
>                 if (irq != EPROBE_DEFER)
> @@ -1545,6 +1541,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 return irq;
>         }
>
> +       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +       if (!unit)
> +               return -ENOMEM;
> +
>         unit->gpio.gpio_privacy = gpio_privacy;
>         unit->gpio.irq = irq;
>         unit->gpio.bControlSize = 1;
> --
> 2.30.2
>


-- 
Ricardo Ribalda
