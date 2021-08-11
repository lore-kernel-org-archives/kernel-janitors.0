Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A138C4338F
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Aug 2021 13:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 688B860FC0
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Aug 2021 13:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhHKNeO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Aug 2021 09:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbhHKNeN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Aug 2021 09:34:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771BCC061765
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Aug 2021 06:33:49 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x27so5781188lfu.5
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Aug 2021 06:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UpMZAUiu4CHidBpx9zRuTRmjPXDZ5iwYMFLqgNELNuE=;
        b=FfCZF8D4xFPjIX1+di0EhQfTW4wx0dhjkLAqyPBwWNhOGN8XvxqM3fXl+tvJTFnlem
         v2bXWWauVd0qZ1ptB2PtX+WPcZW45fAtlrjIlssMtnwZMrnqoG4MIlO2jO9+loGK5DeV
         FknQsDTiHHjON/r60/6+mnFfD1yEqa1+LlXPoqtEj4JQzwOsTR+CP5rvIznsAJUUKz3/
         WTbasN5+5bAvp45BpC9JPoFoLKSU0eeOaJYlwKOeh3YKUkrD4n7NmL/98JMQQ3gl3ami
         2xmHhmRP/Mh1DOCt0Or/0i16maEj31JnmXSBZN0We8elI7aFpBQn5qDHK5F2tqK1er0j
         QCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UpMZAUiu4CHidBpx9zRuTRmjPXDZ5iwYMFLqgNELNuE=;
        b=juP/juLyOpbtqlArXKNYiI6BVz3/5R7xNQVdgwgFJ1/csobMO6SbJij9VY82UWJtPL
         5QtwoEpO6d1oxe3f5EWUow42JiG3mN0okcPSCpjUy9mC9JFPrq6DoMNfGzOXTH30dtKC
         B0Hne5WuJXd3VO6pWzgCVgWHPVL1lBVcSNV4uvHAvuYnM6lLxn7AZEXz80izXNOsaUDO
         Yp01L+/wXflDAKTsvt3iO83S7QBf1Y0SIWbtNaXsDCtCJUFsqN99HFYX4ATBt1eTfHTu
         mDeOc1k68yWfS50cdEaqhKwGWi+8ZGrVel2c+ni85dQX1KLLmxmG4MfkpHIYWkCvX+Nj
         eXsg==
X-Gm-Message-State: AOAM530CFAx2W2J4N7A3Q+h9QadJWic5K0XLVsNa3MIivLMU3EaewjlY
        8QA5371jUBSejOdQMNiCS6rwA6S2sjpoy3y0HYd/kA==
X-Google-Smtp-Source: ABdhPJw/s61tPbcLYdIVemcOcuVHrDRJbkbD9xzP1eg2Tu6BRNW+LPTD/jTUlAvQbqg/p3pm6Ne4iiLVxITFONIXJuA=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr25216383lff.465.1628688827875;
 Wed, 11 Aug 2021 06:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210810191724.24452-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210810191724.24452-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 15:33:37 +0200
Message-ID: <CACRpkdaoheT3b8oZkQCUOVw9bdioG+b5BW4T5-Hj8dHoD5yX0Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust ARM/NOMADIK/Ux500 ARCHITECTURES to
 file renaming
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 10, 2021 at 9:17 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 8f00b3c41ae7 ("mfd: db8500-prcmu: Rename register header") renames
> dbx500-prcmu-regs.h to db8500-prcmu-regs.h in ./drivers/mfd/, but misses
> to adjust the ARM/NOMADIK/Ux500 ARCHITECTURES section in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches    F:    drivers/mfd/dbx500*
>
> Remove the obsolete file entry after this file renaming.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210810
>
> Linus, Lee, please pick this patch on your -next tree on top of the patch
> mentioned above.

Thanks for fixing this Lukas, I see Lee already applied the patch!

Yours,
Linus Walleij
