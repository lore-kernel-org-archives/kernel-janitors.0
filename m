Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0980FC32771
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Aug 2022 12:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348721AbiHSMfB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Aug 2022 08:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348513AbiHSMe7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Aug 2022 08:34:59 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396B4D83E5
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Aug 2022 05:34:57 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a7so8583064ejp.2
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Aug 2022 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XZFDaDB8tTHmQs+ge0GoXWvB83xSHTtt9LztyWrp1tM=;
        b=DEKkpJjZoN83asNH+cT99OF2dl2c3QRLw3RqCJ6SvhZEsaqEjFPGBoSSxd9E9Xv0Ge
         MXMBp6wNlGdhr8n23P2iSkn1doBUGxR42OWDLvwAJ3hmARiowyPkAXfTXy0nF06ym/+O
         9HBmNPKP0NtqQqjJfpJVAnhrQotKtj+MQQJTBjRq1HyPKUEkoe/bd5BNBHt1vCPCEhIN
         nBxpDOVi4ooRpyvkZynuGa0ubm9pG36Tnt+Y2apE4+v/HfkxFHS6QQUwdK75r2RgsF3Z
         ubEHzmZ8lEdKdBOuFQ7y8ceLMEIzWOxKt3zk7VMliyqi5LXOwhu1Udifz+Tp5eagnll9
         McOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XZFDaDB8tTHmQs+ge0GoXWvB83xSHTtt9LztyWrp1tM=;
        b=o7TMRC9sornxkhJvHsnR9FJQeZ/d2sHAA/+CZAwyQOESrz0JTNhCiakJTXcNpOJc3N
         4x1skDT9ds1mqZse68laH4jLBbhUnvxiYGT7ovXlCguaGx/tOPJ//uHZckKUTTXp3nfN
         fyELZ9rhm35v/XUD40/7T3u0SmBOK3B69MHpTAYl/n2poaeDjmN3yx8zp3uPQWeP4Ero
         9quZFTxW5ooO9XhIoTTjRgNvIGImffHQoqQo9BMGn5iPS2h3uutJNMX85xBHsbA7nkjW
         PGdlYVwS2jZ24Lf1wdiVR2m/OS5OIaMSNr9/1kZTHllA6yM512VaKJSGrWVopB2k4idI
         ip7w==
X-Gm-Message-State: ACgBeo1562XpiNNJSy47GfwQ4z6skQQdnxdbQfkXuEB0XDu2KzSJ4HYh
        MOLrAvL4R/Rf+NellrnWwcYeHb+CJdETAevazFJ+qw==
X-Google-Smtp-Source: AA6agR7Iz0vh/NqBU04llNk+iQe95LhnVouGyVj9cXHSEkzRKQCmdHCz3iLMfYGmqpJOkioJOXN0gEhAzdvYSU9mOSQ=
X-Received: by 2002:a17:907:2722:b0:731:2aeb:7942 with SMTP id
 d2-20020a170907272200b007312aeb7942mr4696285ejl.734.1660912495811; Fri, 19
 Aug 2022 05:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220816073952.31619-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220816073952.31619-1-lukas.bulwahn@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 19 Aug 2022 14:34:45 +0200
Message-ID: <CAMRc=Mehk8gH1yiE7rZF9P7qrjzkAvDg=_hZ_f+R9S-eZabyng@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for XILINX GPIO DRIVER
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 16, 2022 at 9:40 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit ba96b2e7974b ("dt-bindings: gpio: gpio-xilinx: Convert Xilinx axi
> gpio binding to YAML") converts gpio-xilinx.txt to xlnx,gpio-xilinx.yaml,
> but missed to adjust its reference in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Repair this file reference in XILINX GPIO DRIVER.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f69a1c5212bd..7c20a1c9eb78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22344,7 +22344,7 @@ M:      Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>  R:     Srinivas Neeli <srinivas.neeli@xilinx.com>
>  R:     Michal Simek <michal.simek@xilinx.com>
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
> +F:     Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
>  F:     Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
>  F:     drivers/gpio/gpio-xilinx.c
>  F:     drivers/gpio/gpio-zynq.c
> --
> 2.17.1
>

Queued for fixes.

Thanks!
Bart
