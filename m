Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F4CC4338F
	for <kernel-janitors@archiver.kernel.org>; Sat,  7 Aug 2021 22:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 191DA60FE7
	for <kernel-janitors@archiver.kernel.org>; Sat,  7 Aug 2021 22:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhHGWuT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 7 Aug 2021 18:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhHGWuQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 7 Aug 2021 18:50:16 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED939C0613CF
        for <kernel-janitors@vger.kernel.org>; Sat,  7 Aug 2021 15:49:56 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id m18so6431487ljo.1
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Aug 2021 15:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3qubOv31EtfKaNfHjdn82lhl+sbwGCg3V0u0FRk8QU=;
        b=Y5j9Tu28amnZUpN7zY3veiU+uMmDpe7mXmuIxCaWmknHVC9q/wX1UIEStgoXdiliru
         sCB9DqfQoYAh5RKWrnXgvRcICfc/f0fcV42tLxdpKas7JSPMdVhHDM6yrLRFNFDkNuuD
         VohfMEWE745XxofOXaDtB+auVIkcBbPrH7KR5pbVcbyorTCxcXj4UEBM/gHIIAPDoveI
         LVzyqtK+Ac7BuSOw0eBATVVbSSg8p24ja7WNFNtBYAsaSzBvltwlFx4dXEHczCxozscK
         hbyiYi5E5KXBh0dYZ5Sr1ItPhOyil7Vs8jSU/nUaD2Bzav7+bc2FnzrYGG32Pb69w9jT
         6TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3qubOv31EtfKaNfHjdn82lhl+sbwGCg3V0u0FRk8QU=;
        b=XMasA0/KK5htVbCbpBg/eogNI9YMj4RtfigL/zN/VG33dFRsVo+1XxN0P0O1HxqINm
         ND0zj7kO+aUZKeRxD5gS537YeIAxVb0/JxnNftrCyr/RCz4zIsQW1+B2pL4THSmO//QK
         MirRfvWIWQcuX00SrRrkOPo3kgjmSCgQOhUSVmWib5i/3ZcbMvKjNQkJJgImAYfcBRDN
         roJZDAOd58juN9vqAUwWSAGZ9TDGgnUnKJL4PrWuxoE+lOdcza8a4mL1nxbaYAeTxgrs
         cdWk3sPbUyMKhND+DhmPZYHtchS1i73lc8QgqAz7doxxZZDMLvF/7keLCBgbqmAxWnJM
         LPHg==
X-Gm-Message-State: AOAM531VYFKpHR77bd+EA/NChjGHvBY0fjZrz59Jejm9xQJ/a/Lr2aP5
        cMmYM2REM1QGpXz7rQ62xKmjzAHUgY6KE98sy3paEg==
X-Google-Smtp-Source: ABdhPJy37zMjQasEWY5yuOKqQeAD/LtnA/iupXOAzZdWOxAY1eLppLhmy87rbgJCog2CdlEf1M473Rw22pP5qV2Xf4A=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr10702122ljo.438.1628376595192;
 Sat, 07 Aug 2021 15:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210806150000.GA15586@kili>
In-Reply-To: <20210806150000.GA15586@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 8 Aug 2021 00:49:44 +0200
Message-ID: <CACRpkdZgSUyL99166Hoz_8_Gw0ApQOhFbUwBUecMb8XJVn4X_Q@mail.gmail.com>
Subject: Re: [PATCH] bus: ixp4xx: return on error in ixp4xx_exp_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 6, 2021 at 5:00 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This code was intended to return an error code if regmap_read() fails
> but the return statement was missing.
>
> Fixes: 1c953bda90ca ("bus: ixp4xx: Add a driver for IXP4xx expansion bus")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Ooops that's a bug.

Patch applied, I will relay this to the ARM SoC tree.

Yours,
Linus Walleij
