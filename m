Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06B9EB64DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jun 2023 10:36:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343639AbjFOKgZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Jun 2023 06:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245475AbjFOKgW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jun 2023 06:36:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F92296E
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Jun 2023 03:35:58 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b341f83493so25876191fa.3
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Jun 2023 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686825354; x=1689417354;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=l/LIH/8tDobUxqCUyGA4SYSGQ0gjLDuFc8VDRXk4ph0=;
        b=t2KNv9IaUishhCD8drwNW62Rq/3a/FCloiSJhfAgiaUN2zs42Ens6DFX5ujvUnp9fq
         jomrw1GTw3Mnr0faUZFL5zHeQo6JYRmP9RdSbiFWVB4f7Jc7ql61P4Oz+N+yL5Ux4686
         gZZbnkPxyeDv+FIh6EiMuo/NDU4zvhJW4UU6GKIi67Xaj8x2VeitWnmw0ZmldN1z0JIX
         uZmqxWYpaqRfyMXaVzowx7ZUZf5gRVaFNSXdpao+GijdDSctsvaBkwML6x5Ub1CugnsF
         rmRkPIbbCHES0UfTtK+z+efg2XQ3E5bBMffX2LPC1bS+4y2eGzza8UYKUaLFCJ8Rkqzf
         yxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686825354; x=1689417354;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/LIH/8tDobUxqCUyGA4SYSGQ0gjLDuFc8VDRXk4ph0=;
        b=J4tHAOAXAbnQbSU2NUOAjom4OIdFf4Uqk8PUEBkjkadnC1t2hpjGaSM5egYmSXFDiv
         TimTRr7a5aWuVCRXWBpie+EFY4IczQcj3JKKc2dRRT3mhz7mhBxAqA5FMBdheATDCWmd
         UWbGL6yGCq2Sk7SHC4LaDhN8BONE52lJZJ1Efo9A+lumerYxpifkcT3FZojTGNOPveKH
         yOdLu8VM6gmVHcPwG3o4JZBX6e0dnM7Y8RaY67BE3FJ19Tw/76DsijbB+iZIJSVQtwl+
         wOCxlgnL/OlIybW8WSf3VVI0RvVcV7AqjKI06mg0aYB7DBMJ54px+/ZBmazoOCxmFJWy
         GkRw==
X-Gm-Message-State: AC+VfDzNYMj+/LDfBfub4XvqifnuWxsPTWkcEtf26/iJDBaQyW7+GhCk
        z+PCzBiftQNGPqSs0cKzP9GPzA==
X-Google-Smtp-Source: ACHHUZ5tFwQzljs2BgS9NdfeGuMyF35ugJqAUUTzva7a1d/70Bld4c6jPztkOMTnsorkzGEn8fmP7Q==
X-Received: by 2002:a05:651c:10cc:b0:2af:1c62:c133 with SMTP id l12-20020a05651c10cc00b002af1c62c133mr7693715ljn.8.1686825353802;
        Thu, 15 Jun 2023 03:35:53 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c029a00b003f7298a32ccsm20107519wmk.41.2023.06.15.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:35:53 -0700 (PDT)
References: <20230614084212.1359-1-lukas.bulwahn@gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-amlogic@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: repair pattern in ARM/Amlogic Meson SoC
 CLOCK FRAMEWORK
Date:   Thu, 15 Jun 2023 12:33:52 +0200
In-reply-to: <20230614084212.1359-1-lukas.bulwahn@gmail.com>
Message-ID: <1jbkhh2et4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Wed 14 Jun 2023 at 10:42, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit e6c6ddb397e2 ("dt-bindings: clock: meson: add A1 PLL clock
> controller bindings") adds a file entry with pattern
> "include/dt-bindings/clock/a1*" to the ARM/Amlogic Meson SoC CLOCK
> FRAMEWORK section. However, all header files added in the patch series to
> add Amlogic A1 clock controller drivers carry the prefix "amlogic,a1", and
> there are not header files matching "a1*".
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Adjust the pattern of this file entry to match the headers actually added.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Added fix tag:
Fixes: e6c6ddb397e2 ("dt-bindings: clock: meson: add A1 PLL clock controller bindings")

and applied through the amlogic clock tree.
Thx

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08c7efe271c3..08f7c69c67c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1887,7 +1887,7 @@ L:	linux-amlogic@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/amlogic*
>  F:	drivers/clk/meson/
> -F:	include/dt-bindings/clock/a1*
> +F:	include/dt-bindings/clock/amlogic,a1*
>  F:	include/dt-bindings/clock/gxbb*
>  F:	include/dt-bindings/clock/meson*

