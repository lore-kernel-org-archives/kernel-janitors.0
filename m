Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9013C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Jun 2022 20:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiFWUbc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Jun 2022 16:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiFWUbb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jun 2022 16:31:31 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BC854F88
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 13:31:31 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id c65so604952edf.4
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 13:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DCZ2XHP05VxtgmiRgjao5k7aHC4OaYSNudzicymZ1wE=;
        b=uc+YKK94fwq49iJwxmPKhkTK5XKnBnI3YX1oXB7Uab4wZ4j4ijggEB5oFUzmh5/ZL7
         on8ZDQKvzKUtGtu20Lovz1pnEF7/nkJjj9ka0EltvWLUqV+A7zub4NqsaOtzpOv1Tjd1
         Y8qUfy8N9qWXVUIQ8fChJbLklf9LDYzggpdEG2hgJy85Q4zdWkCsEu3+ofnhUIt6wA4q
         xIr87s6HZ908VQPulOWVQRqoHjFILXnfOdH8U0gI/VUIiqUxa0VqR4KlJ+OG1axauAD3
         mhGNvIwonaCnRuapqLk1JMisHn3EWKIpv8B6f8QNQ50VQrdSCrwUIrFMWQQrcBmkuy9y
         bjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DCZ2XHP05VxtgmiRgjao5k7aHC4OaYSNudzicymZ1wE=;
        b=IrXGp3f5rS5eIHnMr9MDRYMDcmyDUIkfCWBwPWD3Spvd8z3x9pafrV+ZORYc8kEwMw
         RmqobMZjZfA1tULVxYDxlA+EsCoqIlteMwBaP/n4trgnlse7jRPdjFXRvq1VOrsgFF+p
         q1q312psJLYIfg/JVXvXubBulr+g5CesIFtsl7VaNtnd4GtWrzAK6voPC+SupPc3LhaE
         BRpz96wnoQh1H1yU/cUIhB9+7sJ+76406aUc1OK928Y4Iqv0dOdgldJex5X0W0u8sUq/
         3A1r01sdYW8L53FhMRtSsTbSvs1enwDYQb0PwUW0Xtk0Gnkv9yHv0WTBzKjQ23dz7AJh
         Dj8Q==
X-Gm-Message-State: AJIora/kojz4gdKXlUo8BmfamnAOVLYqpER0gP6bvFN5J5/cozzoIrS8
        ZGc+F5H8VwC7ivRUgIAiZJt+C9M1c9mS3Ojpc4kb/g==
X-Google-Smtp-Source: AGRyM1tjnPoft26dvpdnhsTXSuT/m8XtJUqLXM8cpMSUyP8oXrtinFxbOkfMh4vIcxru71+K01j/EQxCoO5fZJLOxhw=
X-Received: by 2002:a05:6402:2786:b0:435:da07:14cb with SMTP id
 b6-20020a056402278600b00435da0714cbmr4670783ede.408.1656016289692; Thu, 23
 Jun 2022 13:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220601050200.22213-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220601050200.22213-1-lukas.bulwahn@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 22:31:19 +0200
Message-ID: <CAMRc=McvogqVVvBoTCVqSPHyD0YLXGZ9d1j+e1SsNicA7+QSyw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust ARM/INTEL IXP4XX ARM ARCHITECTURE to
 ixp4xx clean-up
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 1, 2022 at 7:02 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit c83227a5d05e ("irq/gpio: ixp4xx: Drop boardfile probe path") and
> commit 155e4306107f ("clocksource/drivers/ixp4xx: Drop boardfile probe
> path") remove files include/linux/irqchip/irq-ixp4xx.h and
> include/linux/platform_data/timer-ixp4xx.h, but miss to adjust MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about
> broken references.
>
> Remove file entries for those files in ARM/INTEL IXP4XX ARM ARCHITECTURE.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Linus, please pick this minor non-urgent clean-up patch for ixp4xx arm.
>
>  MAINTAINERS | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58e751b9346e..e0f5895feb6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2196,8 +2196,6 @@ F:        drivers/clocksource/timer-ixp4xx.c
>  F:     drivers/crypto/ixp4xx_crypto.c
>  F:     drivers/gpio/gpio-ixp4xx.c
>  F:     drivers/irqchip/irq-ixp4xx.c
> -F:     include/linux/irqchip/irq-ixp4xx.h
> -F:     include/linux/platform_data/timer-ixp4xx.h
>
>  ARM/INTEL KEEMBAY ARCHITECTURE
>  M:     Paul J. Murphy <paul.j.murphy@intel.com>
> --
> 2.17.1
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
