Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3775C7618E
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Apr 2023 08:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbjDUI7l (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Apr 2023 04:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbjDUI7C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Apr 2023 04:59:02 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C50A260
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 01:58:15 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-54f99770f86so16315947b3.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 01:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682067495; x=1684659495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tnh709okt+uP41Hcpil4IPZBFvTT3gggD3zdKbpf1Cs=;
        b=t/VhQCQGdS9C8p03FedeZO7vrHCPZ7h328TvprmMDkHuVUT5QivUzLhgQCGlM8DEcd
         Iz87fiFm6M+KEfTkAMe9yJQaxyUquICvqqvSwse7XVLDsqJcmKyezRyfwfHFFdQHcitt
         W8mWWelB/b2kcF5C8KdIAfaeKqFwB7B5rvH8C1H/YcTg3e/Eiw4FsQIRZLRqoj7Dznbm
         ZfEFDDoqvQHt73bdxMrsLimaAyYeMXqG+95/qP+pIyhoRMseFxrt3xkBdzfwKBlVwZeS
         wT0NwWOHgytg+YUR6BTBSlxUflPc4F/f7qVYTJvsFee1fdzXX+/Sw5cE1d6cfuD8FlMh
         P1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682067495; x=1684659495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tnh709okt+uP41Hcpil4IPZBFvTT3gggD3zdKbpf1Cs=;
        b=RCu1DStw0AAPzQWZbQsZehn5grJpvjw3ywAt5RJA1Ni1AFccSpMyKCslGrtwlI1JLD
         FPnzfncamv4kt6ZjYVhFJiZCX88c7I1ONZ677yD2fN5L1rnqgDK+46S39npZuSAfhJXz
         ie9W7xiPAAa5eQiW/KJ2ARaFecELha5k7yhmsPnRJKoU6c79Fge5TE/1SyVJhDUZVcQa
         IQhsqxCTHO+YO3jGLNmskgrdeafwPDljzjTG1rlPnENcolhu/7iwRiXl8Vk5iv/cciIG
         t0ifsNloojN98yR4NSoQnbocIb3kditVgb/qiz09JPychTFWA/jHDHAHq7Xi4HDBPclU
         sI+w==
X-Gm-Message-State: AAQBX9dXlKpUzreZchqBXTBC8kfoOO8Di8TpFlQd1Pjw0gj6hiYoRh+F
        4rbD9Ku69RIa8xQ2c93OizL35TxIwzvSwaPCvVmSXQ==
X-Google-Smtp-Source: AKy350a1ARMKHmgYAXdj4qmbuGefNt5X5XrEyfvLA6zisnjtQpG1+XfI6gOzF761tMUJN5V0aCqIyrvUsZbF51sXCq4=
X-Received: by 2002:a0d:d905:0:b0:556:10c4:6b1f with SMTP id
 b5-20020a0dd905000000b0055610c46b1fmr1258230ywe.36.1682067494767; Fri, 21 Apr
 2023 01:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <7de7d932-d01b-4ada-ae07-827c32438e00@kili.mountain>
In-Reply-To: <7de7d932-d01b-4ada-ae07-827c32438e00@kili.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 10:58:03 +0200
Message-ID: <CACRpkdY=-=VRf1XtjcXvSjBzmxPS_UsKT32=JNAmAoX5Lp5Ciw@mail.gmail.com>
Subject: Re: [PATCH] crypto: ixp4xx - silence uninitialized variable warning
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 19, 2023 at 4:26=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> Smatch complains that "dma" is uninitialized if dma_pool_alloc() fails.
> This is true, but also harmless.  Anyway, move the assignment after the
> error checking to silence this warning.
>
> Fixes: 586d492f2856 ("crypto: ixp4xx - fix building wiht 64-bit dma_addr_=
t")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
