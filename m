Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDD5C7EE23
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 May 2023 08:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240361AbjEXIwG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 May 2023 04:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240438AbjEXIwE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 May 2023 04:52:04 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8AD18C
        for <kernel-janitors@vger.kernel.org>; Wed, 24 May 2023 01:52:01 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-561d249f045so6282857b3.2
        for <kernel-janitors@vger.kernel.org>; Wed, 24 May 2023 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684918321; x=1687510321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c9KLlfxZTlVXD1HXgvyCoARTi/rzjAMY1PqK/999Bs=;
        b=xNhyzd8Hh5jsW6VnCTkKMY/0MwFykvaVmY/zFTT1eRy4NA/FfEkkU5o9vzCA5hhLGr
         GA0W9VC5LrGAxiUNisXs0kQKwQBhYHYwck18kNX5lsgUixnG/bwgJFMpr8ukldam5Hxi
         374+NYX+FfWkU81pQmDRN1J4sdgwW6qbOkG7biWqrZrAINAylxYqPVFKUTRr1EgiLOBr
         14uJ8/J2tAjk0t1qhwwjYtUTrFh+K3ivCDe/rsqODlZGHmCHPWoWh6k3mZv9EhvEstvf
         DekpnMBQHGQ+5PSkGYTu8NPxhV1IXdRSA4P/zzSSQ0JDZGeflAS+6edE89YwcJ0CLgpy
         nwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918321; x=1687510321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9c9KLlfxZTlVXD1HXgvyCoARTi/rzjAMY1PqK/999Bs=;
        b=Y7Ob1Asdedm9BN69bNaaSU+UsuP2tkEb1NAEPSMcEbIpbn8y2EU/e2NcnQHLR5nj4X
         1w/rvbxQgWQie60Lo5v0tH0Qis3DOShX7UMEOyrJvyrQ7oMQjNWUL4sLqkLmxa5++ZRw
         n1FQKvX4MtXrpaO3JhDt6f9SufWdu3Pqi+fx0lPrjI2S3IoiarUioeW1koZOdAw+lVfZ
         t4nz5Vjz4Ez2KclM8NktFDgSe0SSWdTcuAO4et7voLP9emSujV7IySJkeEbWYcTFFFUW
         o2cEDTIm/kK7P6OMU0PTMV6M72CB3Y2dojASnZKvXvSHXnYSb/3RMX+US/ZEPBocUS/r
         DZOQ==
X-Gm-Message-State: AC+VfDxbmSvu970IXxmX4TMv8OjI5Xd7I+lhW6ncP44fTjfFAdE4y7HY
        OPVGGMXYCmacuSsk29qoUEarmOMBYoXJ9s4s2WGWnA==
X-Google-Smtp-Source: ACHHUZ5pfZmOIYQ8mIoyinB0Leuc8SST7V06CxGf85cEY5JraDDuw7yqI8yWVUg9SyytLYDtuMMBiApP9rEhF5IHqjM=
X-Received: by 2002:a81:5a0a:0:b0:565:3749:c24d with SMTP id
 o10-20020a815a0a000000b005653749c24dmr6414756ywb.14.1684918320912; Wed, 24
 May 2023 01:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
In-Reply-To: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 24 May 2023 10:51:50 +0200
Message-ID: <CACRpkdauaQiuJJy-VxHDixU0MHR9qf8Qd2cRW0m5TbWsKnnAzA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: fix a couple NULL vs IS_ERR() checks
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 22, 2023 at 9:45=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The devm_kasprintf_strarray() function doesn't return NULL on error,
> it returns error pointers.  Update the checks accordingly.
>
> Fixes: f494c1913cbb ("pinctrl: at91: use devm_kasprintf() to avoid potent=
ial leaks (part 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied.

Yours,
Linus Walleij
