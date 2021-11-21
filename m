Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AF2C433F5
	for <kernel-janitors@archiver.kernel.org>; Sun, 21 Nov 2021 23:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbhKUXHQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 21 Nov 2021 18:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhKUXHQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 21 Nov 2021 18:07:16 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA40C061574
        for <kernel-janitors@vger.kernel.org>; Sun, 21 Nov 2021 15:04:10 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso26182835otr.2
        for <kernel-janitors@vger.kernel.org>; Sun, 21 Nov 2021 15:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IKUzxLRhbxmNcnwsOFKDQdF/Nr4S67ZStxmJXr/lOM0=;
        b=zSoZ2TqVC2lf3rXicbt0O+mrUpC+dHa3Y5y9BHWx7Ozsd61qvo7E7h6E+ZWsZVIt3g
         sAB3mKzhD3v/qyxa2UFPNHDn/Z6O7j+rSJqDvUk4na6B9evZ/h2GbCsmyQZXzyavR+vo
         uruDWWRGbRXuYbjdovFC8H9XnZzNLSebSXyw8n4xggjeqN9D+xXMVhj+JTzaT74lnrLF
         ChCP7/RS+7lwbojtgCfFKSAa7XmsDo4yfdkO8a3Eg3hujUDn1NXqkbM4XaipWcY/rjWa
         n/h1DRcLNtxSF4W45IDam/Q+a4I4GakkyAJGQMSDTyJNFuQxA6A5AZJqYGcp8luoVB6x
         v8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKUzxLRhbxmNcnwsOFKDQdF/Nr4S67ZStxmJXr/lOM0=;
        b=7SWvHdp19LTbZbG/qRGwptBmAshV5s97PcI8oNmWPOFCYl/THf+3iX4iph674m30Qw
         iHScd7xitka80rKqXh7eaJJ1WZu7Ouu+M0Jin3dgP65qc1njGP3zYUq7obXVS2SGou+f
         16ZXlXcJE1yl44s9uJLacy9UBQfbH3HU+xvByBbbvOLujKl2dDCgOGxVR5D90UEerDld
         2V/7g47RGXHiA9+WM5Yon7fMrD1sKmZogC0GGiug/Ow1Bl1kg7lhJNT/0IQiwfwLkQxW
         G1hC/qirIrqaFaAjGu+ew9x30edOC53ZJwzo9zqvB+d4oim5hFUfkB4bugI89F0j+v1x
         RLlQ==
X-Gm-Message-State: AOAM5310cdh4v9gPQPgWby0u3Cd5DMNEJmF/rwuqrvf6EB8j6irJ26MH
        KcqV/2BS5EomsRNz0s7dkW5XyFocZi9CcUuewF6kEA==
X-Google-Smtp-Source: ABdhPJyJftrJGkaAE01C15jlXvMwwX+b0zacf33mq/QM8/O1wDwdW/TxpLreaxzKiJSOjfGrlzGJb4lnENCZH8brIsE=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21329974otg.179.1637535849462;
 Sun, 21 Nov 2021 15:04:09 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMxBW0qM06i7TvFG+8HrwbR1eYR+9Ed648aZ95mtXiA7Tg@mail.gmail.com>
In-Reply-To: <CAKXUXMxBW0qM06i7TvFG+8HrwbR1eYR+9Ed648aZ95mtXiA7Tg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:03:57 +0100
Message-ID: <CACRpkdYfqrSOJYh9trvcioBAVXZRZsjhNEgxpCNFtpjJCPrMfg@mail.gmail.com>
Subject: Re: Removal of config MACH_FSG and dead reference in LEDS_FSG
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 12, 2021 at 8:59 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Your commit b71377b3e1e0 ("ARM: ixp4xx: Delete the Freecom FSG-3
> boardfiles") removes the config MACH_FSG. Hence, the config LEDS_FSG
> and its corresponding driver leds-fsg.c is effectively not selectable.
> I do not know much about how with device trees we ensure that specific
> drivers are selected, or how Kconfig build dependencies are combined
> with device trees properly here. So, I do not know what the right
> patch is here.
>
> Was it intended that this code is now made obsolete? Can this driver
> really be deleted?

Oops no.

> Or does it require just some further adjustment to make the leds-fsg
> driver productive again?

Yes. I'll look into it!

Yours,
Linus Walleij
