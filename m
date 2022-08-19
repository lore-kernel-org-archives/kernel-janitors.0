Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7663CC25B0E
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Aug 2022 06:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344455AbiHSG14 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Aug 2022 02:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbiHSG1v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Aug 2022 02:27:51 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40522CD7B2
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Aug 2022 23:27:50 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id de16so394139qvb.12
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Aug 2022 23:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=u1KqzyDRkxYnMy29Xf5MPFj+6FYZs5Pa7lqmHSKprJI=;
        b=UJ6UF7fjJhXDPtm+29oVQnbPXtWwfXWAHN06xBCXVJIz2JlGAJaJDfuRvr1EIZvayi
         /uxsL9bzGgra1rgdUobYvTzzeCBbtg42mDy2AqD1f8BRBx3N/3iX7T28mItcaO6+MC/1
         KHhVoMyXfQ+rOpxIpiILU+YyAHbjBL2nKGrdUbMzPea4o73yTEilCKXLDx0lzIS5phZS
         MfxL5Juj5fT+jSQ7H6HyOHLFyBiQ7BVGi7jaBRYWl7N1/5lxQVvRT78bVutR5yrLdvaU
         fjg7VYcgk5IcU0N+mABZHaS8aea94euGkr0uhWqNNdbY1gKZvXPX3Uij6F7Phr2XDepc
         IS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=u1KqzyDRkxYnMy29Xf5MPFj+6FYZs5Pa7lqmHSKprJI=;
        b=yx9ruw9n6eJGc/fWCl4tsuzK9mfzGlXG4yEQRz1qKkOWgMl4s8u5n8DWu7CUzbfgUX
         NMl/Po+wCR3Sva1N4mivtFm0g06oSstKztvF0x3S9xKnwaK1VSpOA5oJaqmFrOPc2Lz1
         b2KMO73mBNvkHfU976iHDXeKaCTfhs9jPAainjYULG/f5Vt2nteKreSMwmCggiU28TkY
         4FFkEilrLJAMwN2ZkdTg3kSowWNveA8cGYV5q7wjQJNq7oARE4d9TP/asQVBHNrHNBQ6
         ascR0LjUZmOw437SqnLSZuhDaeHzLXiL1V4L4DgGOkcarKkelECESjJx6waUMhRryBlc
         UrMg==
X-Gm-Message-State: ACgBeo2Oj/QtfjS792dY9q/HNFgfTQFYEqEso99ioZ/AFwNHU7VxJWk1
        v+mHEBGzbYJIWuNTVNPfK9R2kFkIOt1KBzr5vgIyR9flXYX8Ww==
X-Google-Smtp-Source: AA6agR74TrdSjfocyJ/Cvt/8HWnKOmGRr4x/TIynE/dnpm/pgOS3/1ywVJtVhnS6rnthL1Dbz+ixroMopM/QhnWEs+8=
X-Received: by 2002:a05:6214:5290:b0:479:5df:e654 with SMTP id
 kj16-20020a056214529000b0047905dfe654mr5093449qvb.97.1660890469227; Thu, 18
 Aug 2022 23:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <Yv8ezribLQbq5ggv@kili>
In-Reply-To: <Yv8ezribLQbq5ggv@kili>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Aug 2022 09:27:13 +0300
Message-ID: <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
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

> Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")

> From static analysis.  This code is obviously harmless however it may
> not be required.  The regmap range checking is slightly complicated and
> I haven't remembered where all it's done.

Exactement! I do not think this Fixes anything, I believe you are
adding a dead code. So, can you do deeper analysis?

-- 
With Best Regards,
Andy Shevchenko
