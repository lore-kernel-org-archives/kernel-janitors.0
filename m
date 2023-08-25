Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34670C71133
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Aug 2023 08:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242940AbjHYInO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 25 Aug 2023 04:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243926AbjHYInA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Aug 2023 04:43:00 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A512688
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Aug 2023 01:42:26 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d77f614243aso672292276.0
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Aug 2023 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692952936; x=1693557736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paPaNBgdy8fC81NTESXp1GcybAQpiRbyhR1Y6LYNTlA=;
        b=UEwtWD8cjlTAVSHsFw5Zp4/mr0/l3+aZwHQuhmEFr7b6685U7R7GnTDdnV21BNSKlT
         EhkZn2ver6+pmnGz4oy7F9+4/nibRpgQZEx9oK3Vvczbf3oCDPx2mKTLDt22bak8ZIFj
         4WYMa6BeMkgdZNWcONmE4Vdaz4Hhl60K0Z0J6wQul4rzgCR5LJ7mq/F2mXP9WHWWYmOl
         2Wzd9iha3q/8dnndQN0TPTkscWnfPYCQiR2GM8f5TbfM6U9Q+wVE+rhwclLNVEn9gpmN
         MXkRNgPlTm34skRZJ2YhfjIcBTgnhmKlvoaXS59Fb5v+6ua/FqwqqJcEdhVj9uCywD9n
         ya7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692952936; x=1693557736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paPaNBgdy8fC81NTESXp1GcybAQpiRbyhR1Y6LYNTlA=;
        b=aYZ3cypB6wyyhMHl+RbrD4VlVSoTwoa2LyvXVXtLqS3zW2QCCnhBEFUkiVcBl5Rjjp
         0nFmdvLiZuhZd4YoIkXShBc0LZ5pKNLCLbKIcPlvrzn2R+jjytEp8t0xr2Ek3mVlT++9
         VNRXLfWGHZckK7+Teros6oHl8JHselTDJ35DLwwJg1fY3PDPSGCNsoTateQ0/chAqo2J
         QxewrgoZYPLndFDPz5/8b2eVGjAewu5cDFV8YTtFZn6IB4jkqc6QUtDmwyvfGI0y591X
         KzGmIxTV+qzLZii8A6khY25pE6QFMP/YoQcD54Lvf4FTWd0SQU1I8VXWkmcFH4+Kq/4T
         g90Q==
X-Gm-Message-State: AOJu0YzSwsUYQCjUs1+hwCdWxmSe/wRojzzjfQuxyX7rH6U57szmJNsR
        VAMn3dUqYMJTbTWRIAMapzdpJz64mnNaAmBxGXc5c7xK+T6o9klg
X-Google-Smtp-Source: AGHT+IFUJlU5/qBTUdIhAJDXncihHOCmd0RSL/+XkaajLB1RBuxUUa4sOsQ56q6Awg6wjBB56OfCUhU8LLtIvuaGiUE=
X-Received: by 2002:a25:b309:0:b0:cc6:26f7:f0ea with SMTP id
 l9-20020a25b309000000b00cc626f7f0eamr16232194ybj.27.1692952936378; Fri, 25
 Aug 2023 01:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230825053910.17941-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230825053910.17941-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Aug 2023 10:42:05 +0200
Message-ID: <CACRpkdaP1_57rYv0C4gf=1XQxtCC=BvxzeU15b0uY+uTFhMCQA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove obsolete pattern in RTC SUBSYSTEM section
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 25, 2023 at 7:39=E2=80=AFAM Lukas Bulwahn <lukas.bulwahn@gmail.=
com> wrote:

> Commit d890cfc25fe9 ("rtc: ds2404: Convert to GPIO descriptors") removes
> the rtc-ds2404.h platform data and with that, there is no file remaining
> matching the pattern 'include/linux/platform_data/rtc-*'. Hence,
> ./scripts/get_maintainer.pl --self-test=3Dpatterns complains about a brok=
en
> reference.
>
> Remove the obsolete file pattern in the REAL TIME CLOCK (RTC) SUBSYSTEM.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Linus, please ack.

Excellent attention to detail here Lukas,
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
