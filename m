Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7FCC32796
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Aug 2022 22:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbiHWWK5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Aug 2022 18:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbiHWWK2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Aug 2022 18:10:28 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9D9760D3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Aug 2022 15:10:10 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id de16so9248167qvb.12
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Aug 2022 15:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kRCQSo6l4zJ++6phjTX6BnXETYs1Dv7j76EcPfueoIM=;
        b=KUSvkEThpk6P/ZesUxxvBZWaLlsiCeTkILRawlUZluJmyxfTJ5cum2o48WpbLGVRaY
         R41irTzezKFB/7bTmwd/rx4AHeN/y9cn7dJy85mMEoCfiYChBrUfoVypjcbJW6FC6oxV
         ey4kBqVNSC3pfQjXCwBCDLoxgxoe8jUFKMQzXVZCr/YUrPG70/4dfMptmCoX/inzluHK
         UKiHmfQVeTJKY6ngdFLni0vrYVbuwxOojHuSH9kPU3ocndZ3wLNfxXehMbI2awI2NwBW
         AhfVzAJmtn14rDzC1sSeS9JNFr2m13YOCo5JBsTNCDmBub3pDPHOB4wpbV3ZiES3+TUQ
         cSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kRCQSo6l4zJ++6phjTX6BnXETYs1Dv7j76EcPfueoIM=;
        b=nPDrAcLOuZr68fSZHlQ8rbtRwnxahM0+aZu1RoImP6W95CuEk3P4bQCwnKGmYEPSjp
         XUwGgoozL93XIj0Td70jdtJdFPnT9d9Lfh7T86sdqSOkX7A1fAsZBFwpIhvnECDxWj+l
         6MviPUFZl5aeLRbdEJsQbiuRNpgWNf/OwpCKmSvQZDJSgybraxnTf7kzJHGRhMJmoW8J
         DeByjqS/D6ZfZfLW7Z8TBBXhX4NH+RB3YVb348UJl4S3UlKGCAxoKDqGcAp5ni9krvhs
         BBocETG269z+TCwGNQ/Qqg7AX3H4jTp7+pjrgPPFDfWSaFtnC9MQh+IsPae6dKJEOp68
         LjUQ==
X-Gm-Message-State: ACgBeo1jB6n3e5hUjMkOeCoLro3taa9cUeA/pVir9nWDkiudh6eWmQ8O
        dwplpjLfeCo5FP1MvoRefmPXXSqqUyCSyU2OfPA=
X-Google-Smtp-Source: AA6agR7e8DszsroSOTOrtOTMDfu6d2xbEVOQPEuU6NWJk0zIdhPqX8oKoqMIXH84sbQqkWkDAf0f/5z9V5M51lMZPZI=
X-Received: by 2002:a05:6214:c22:b0:497:10a8:3067 with SMTP id
 a2-20020a0562140c2200b0049710a83067mr1372524qvd.48.1661292609347; Tue, 23 Aug
 2022 15:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <Yv8ezribLQbq5ggv@kili>
In-Reply-To: <Yv8ezribLQbq5ggv@kili>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Aug 2022 01:09:32 +0300
Message-ID: <CAHp75Vc50W5m7G1xK_zn0z2DeH+a1vPtxiTWE5KjXyQSuknvqg@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write functions
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> It looks like there are a potential out of bounds accesses in the
> read/write() functions.  Also can "len" be negative?  Let's check for
> that too.

...

> +       if (bank_idx >= ARRAY_SIZE(info->i2c))

Okay, the index of the bank comes from arbitrary data and here you
want to prevent it from overflowing.

> +               return -EINVAL;

...

> +       if (len < 0 || bank_idx >= ARRAY_SIZE(info->i2c))
> +               return -EINVAL;

Ditto here. But what I would do differently is a check for len.
Instead split the assignment and do a check beforehand.

unsigned int len;

if (count < MT6370_MAX_ADDRLEN)
  return -EINVAL;

len = count - MT6370_MAX_ADDRLEN;

-- 
With Best Regards,
Andy Shevchenko
