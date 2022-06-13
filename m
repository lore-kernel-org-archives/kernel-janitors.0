Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAF4CCA482
	for <kernel-janitors@archiver.kernel.org>; Mon, 13 Jun 2022 18:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245535AbiFMS7M (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 13 Jun 2022 14:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346662AbiFMS6p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Jun 2022 14:58:45 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9098A33D
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jun 2022 09:12:05 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id m20so12066628ejj.10
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jun 2022 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P6lLiFcHNk1LYk41lJatoeCKPrB/NP5ibxP6H+rfMbU=;
        b=WKjgJI44QJjFEdeEeg/V2vwM/ysH6UBEf+SThMJYB5k09nHUmBiCxZOHTcE4OFYK9G
         4gwuPgOXVkN8MSTNMJqrJotfevsWvTOppvK5mjEDbE63hHncgUm5WtROMqoFC8tIU3KN
         c7cJnqGtS7qtrR5yio6WY6UeqUY8TyaYpUna1AIbtVZKqT+Pz9h7JtOR0HTCXCZpXAeN
         Ds/HgqD1bQj+A5ndGZt6DywKpjRr3QTmezSmJctLKy4gE7/z3Y3HuYwzucKsWoINTHvK
         UNJfuTFBTNXgpezdv0/iQqbkPBZ0EWSUi+nzqcMCL6sBvZbjOH8LHbmJzjdl2SjeAVDG
         QKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P6lLiFcHNk1LYk41lJatoeCKPrB/NP5ibxP6H+rfMbU=;
        b=h0PmlgH2aNz+WoBAT7h6lZKn3Uh1ZvearKnLYLZXtbZBSNgFjfZ6b69SrD2nfDS8BN
         fyPkHGSirMOX4VBhBCbYvXvB/xZov70EU9xIeFoYSG59BH8niHYIoH+97AG1P5A4ZY+O
         t7Vr+RB+eXhdYNdBfXJ8+skwJT0MwhrMrMel+/I2YlmmTGctBpg6U2ezq8jW7MmuHVAt
         nGX2qQQLn57iPubHsoJuuN41+jk/EmO6R8qvcO9AZTFCFy64HR606Ld+1xafZe4TxJGE
         BdvncqW+B7MRWNX8g5TX4Xwn29r9Alssm34PLUPvqZs7hqIrjVlkjHFekRyUM65Mu4pB
         06oQ==
X-Gm-Message-State: AOAM530HA5kV7UsgkTlri6u7H86CJLXVqXS6kqmHZu0dZP6+xzefVCg/
        kD+HLNKDobrsQm4RBrT9W0MG0hkAKrvjIct3SAz6eg==
X-Google-Smtp-Source: ABdhPJx2YYY2W4TYzHoJIpn3Y15QBwZlPUgrmzriy3AcwiEjKh9UPDmSvoXAIQ/te02GZgqwsYirtnk0B8+m8D7JYxM=
X-Received: by 2002:a17:907:3e21:b0:711:ea36:914e with SMTP id
 hp33-20020a1709073e2100b00711ea36914emr493892ejc.101.1655136723646; Mon, 13
 Jun 2022 09:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111134.23255-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220613111134.23255-1-lukas.bulwahn@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Jun 2022 18:11:52 +0200
Message-ID: <CAMRc=Mfa8fMPFTGZcB5Tpj6e-w54u+Oa626+xJyLwHSzcyWCow@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add include/dt-bindings/gpio to GPIO SUBSYSTEM
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 13, 2022 at 1:11 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Maintainers of the directory Documentation/devicetree/bindings/gpio
> are also the maintainers of the corresponding directory
> include/dt-bindings/gpio.
>
> Add the file entry for include/dt-bindings/gpio to the appropriate
> section in MAINTAINERS.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Linus, Bartosz, please pick this MAINTAINERS addition to your section.
>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1adf8767422b..d04e74ade88a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8517,6 +8517,7 @@ F:        Documentation/devicetree/bindings/gpio/
>  F:     Documentation/driver-api/gpio/
>  F:     drivers/gpio/
>  F:     include/asm-generic/gpio.h
> +F:     include/dt-bindings/gpio/
>  F:     include/linux/gpio.h
>  F:     include/linux/gpio/
>  F:     include/linux/of_gpio.h
> --
> 2.17.1
>

Applied, thanks!

Bart
