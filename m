Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4CBC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Mar 2022 22:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244708AbiCNWbp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 14 Mar 2022 18:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233289AbiCNWbo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Mar 2022 18:31:44 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C493E5CC
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 15:30:34 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id g26so33698001ybj.10
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NlBHR6usH1gSHtmofP4iSUiv99gPnLLBTvpyEYcoxh4=;
        b=MvZ5uReWaLRuWb0aH67AkF8JXHm7LrqmDeZ87wUAEhFFqRt4AtOVbqoF7LXc4pck9C
         x/XcAXC6IUmfpQ3WpMrQjy48OPWQq0hR71Eydu9NZL/t8rCnaW2QkAZ5ObBUae/kJkpZ
         GTz4pUarx7Es/H9FYJWZoMiHHoIitGnXQ7fMyRhvBXYGQYub7QfSA12MGB5TT7qKDkV2
         /esAqJbA+TTWuD08RAVUg94hta61Z06RKT0HyVR3RzaCAHk7ppzA2+cFoIQnTotmqNXI
         rpE7L17xwj9XtaKWdiYtiZaqy3hNvQZvIQr/S1aIBX+yQGjbLvVww1yZ39Xqihkj0HPs
         kqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NlBHR6usH1gSHtmofP4iSUiv99gPnLLBTvpyEYcoxh4=;
        b=I1+1pFHS9+yxxoBNOqxqlsq48P/Hya7Kw5sLtiMXmaB/CbZMBBmMY39vp3iwHXGK1g
         SAV2DKaOOKz3OcwUyjiJY2oQBQDJUy4ah9FZsW28HpCssjIDsezfOqM1knk9TlnxI6wr
         /zsdpWDcf5UoZWQF3GTBxe+3aACqOTMvRPPUWu8Q7RCE9JqcMTW24U6qEQmrQKsr/agi
         LUgAxcIV8Y0Eg8aoq6B5bI/Htzc1BBbgSqKcyBUfxAZ2XU2PynXWlgFdw9Lo/NBd8p+J
         ulqoU6r4rGru2X9nE6lwBh6+tWjRErSnBdes9W8DDiDXuxTblDPVur8yoQvwG1Idgndv
         I6hA==
X-Gm-Message-State: AOAM532DnqrQarp9UY7OFGnYEDSWPhRQtCFrpAxLfI1srZJ0/weGximC
        usvx3U1KfvojbVj/mVG+SYRFpwcf158O3dJ4IZW2Avt+1QI=
X-Google-Smtp-Source: ABdhPJw4ajnPMAp2l22VE4wgnTHI7XHy1g/O2oEHoRMaFMihH5016jGC2cLdkd8irDT+QCje4jTuRpl7cLtaWwFyAtQ=
X-Received: by 2002:a05:6902:203:b0:628:7b6f:2845 with SMTP id
 j3-20020a056902020300b006287b6f2845mr20723906ybs.533.1647297033601; Mon, 14
 Mar 2022 15:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220311145209.17346-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220311145209.17346-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Mar 2022 23:30:22 +0100
Message-ID: <CACRpkdbjy2Cpzs7j6=iWw+wnJxBHkaxgcO2SOx6DeTLeF4ogPw@mail.gmail.com>
Subject: Re: [PATCH] mfd: ab8500: clean up definitions in header after debugfs removal
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 11, 2022 at 3:52 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 3d4d1266597c ("mfd: ab8500: Drop debugfs module") removes the config
> AB8500_DEBUG in drivers/mfd/Kconfig, but missed a reference to this config
> in include/linux/mfd/abx500/ab8500.h.
>
> The functions ab8500_dump_all_banks() and ab8500_debug_register_interrupt()
> in the ab8500 header, previously with definitions conditioned on
> AB8500_DEBUG, are now completely needless to define and handle at all.
>
> The function ab8500_debug_register_interrupt() is not used at all and can
> just be removed.
>
> The function ab8500_dump_all_banks() is just registered in the abx500_ops
> struct in the dump_all_banks field, but this is then not further referenced
> anywhere else at all. So, safely drop the dump_all_banks field from
> abx500_ops and delete the ab8500_dump_all_banks() definition.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Linus, Lee, please pick this clean-up on top of the commit above.

With Lee's requested one-character fix:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
