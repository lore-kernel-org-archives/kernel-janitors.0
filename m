Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F34C433E9
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 11:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C0F264FE0
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 11:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbhCLLEb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 06:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbhCLLEK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 06:04:10 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A34C061761
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 03:04:04 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id u4so7330638edv.9
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 03:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dt1Jconi7vhAXPLDEe/e1ikNWrargx4HIeN2mZt6shg=;
        b=U02CQYuzNT/l5o6a/iFgp2H4ACVS/b+TN/O0uL1cd4UBtIp0WQ0EsAGvtC2ZOcUugh
         ghcDh9kMZI2Idg4P6slc6OQvJaLTNzQmtWIyU/9fBKVEwn4mUt5xNMgHY7Awtxb7Wddn
         HKNyHcsJQztT51BYpOcHVwRPdD2LRMgXGHMoJBjfie+7nzL0O2vbGAWhw8ynfh8yUz00
         pGdPxQ+4oyrrN2DSjaQVjUhCT9xAu9O0xyukBv8DGf821bH+1eEYIUuYGHYtJxZgfazZ
         BqNgLEyi08RvJnAh/Ufwpiz1HXOe5Kji0/X/DuBw2NJNaHWWGYf+JDVFSeyO9UqTWbAR
         F/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dt1Jconi7vhAXPLDEe/e1ikNWrargx4HIeN2mZt6shg=;
        b=uGStqoG9y34n2C/w9/XqR7xoD8UBGiD5E7CujGBQVurLMyzVIzkIrx/IGARjMuUgow
         pwVBaw+Mqpz2pKqRROJV6s+YkYW+Z513KMHHyghmgwfsDb1dKEEh5LVw6Qc3cXahoSrQ
         zk2EoSH6SY/0kotS2nmF71+xScDVKo3DcFsGA6ore43sJHE0RNCnMeiP87IjFdog1FpH
         O+asJ2a/CxR6uGsvgLTwkd5yJglV5/gOiK3BoobnQ/4YutGDbdimen1cLIdAU10rxpL1
         CVsRQ9IYZRXJ4pFstemMyR5tHcJ4n59m4HtauzFXTKdcLQ4ST3v/Oxq3t9ruULow2Kvl
         cY3w==
X-Gm-Message-State: AOAM530fX+/usDYazvMnuBaOEOBmI4/JuwK+8rGCNL+nHnenw185pxRo
        E+h+cG3nx6DFiwWYzOZG5CRH3Lrr2Qc5fve5qP5MsGGUuJ8=
X-Google-Smtp-Source: ABdhPJwyuDg0uPHrInwoHv+S7M2QS7kHn756G9nstinMUDgFBc+SLZLj6r4DwwZrkMRYbyl3B+drWHkN49y6k5RYcn0=
X-Received: by 2002:aa7:d813:: with SMTP id v19mr802661edq.213.1615547042864;
 Fri, 12 Mar 2021 03:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20210312080423.278094-1-weiyongjun1@huawei.com>
In-Reply-To: <20210312080423.278094-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 12 Mar 2021 12:03:52 +0100
Message-ID: <CAMpxmJXxdTSoWYwRR2o2XwRh4aToPBEsE+C5hNaFvGiYAjkHNw@mail.gmail.com>
Subject: Re: [PATCH -next] gpiolib: Fix error return code in gpiolib_dev_init()
To:     "'Wei Yongjun" <weiyongjun1@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 12, 2021 at 8:55 AM 'Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpiolib.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index cee4333f8ac7..18086262dd48 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4242,7 +4242,8 @@ static int __init gpiolib_dev_init(void)
>                 return ret;
>         }
>
> -       if (driver_register(&gpio_stub_drv) < 0) {
> +       ret = driver_register(&gpio_stub_drv);
> +       if (ret < 0) {
>                 pr_err("gpiolib: could not register GPIO stub driver\n");
>                 bus_unregister(&gpio_bus_type);
>                 return ret;
>

Applied to fixes, thanks!

Bartosz
