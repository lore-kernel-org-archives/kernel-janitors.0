Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DE6C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Aug 2021 09:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E15860EBC
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Aug 2021 09:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbhHCJFA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 3 Aug 2021 05:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234554AbhHCJFA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Aug 2021 05:05:00 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5773C06175F;
        Tue,  3 Aug 2021 02:04:49 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id b133so2707565ybg.4;
        Tue, 03 Aug 2021 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dOVxQw7hzMqouTzTMaPZlulc5riwZNLlilwvv6ofE+E=;
        b=sQ97r/JNoBCJgkPUntBNSlD3p7drzkqCjEcAHwx/Lziby3BbKxI/N9EJy+iBdMs4E/
         c7+GimebIBY68m9tGcdstovhH6LRib3ysxl541hZW0f84BOJm2vBNNOJsMHug79eHEtU
         65NdPF7JYp863KHp7FcMV9EvbIPJwm3vKgwIxquaSh//MDbM5CFpwoxd6YdI56CFqBI1
         3M8Y0QvtTWGJWl4g1epX9EDyfHF6nbFwVwH8toXc0mu9U1j32/dwufi58nqpDMYDMRCJ
         UM0ACj/l4HfwstG6CR3Cm1ohopUsOdHRqRXkLXMXb8scIpuEPRGOgZft+0z6aMaBHkHF
         rQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dOVxQw7hzMqouTzTMaPZlulc5riwZNLlilwvv6ofE+E=;
        b=HCzzj/YcKV2ygVpWotj/Bwyrf5o2dMRF8L7PnuUbm8rpv30UX7DVTiUYiS37Mzd7Gv
         mJGtCtduvWzg/lHbq0jF32NU8dMB5HQMIsM21SVoK9nYG6LG0iYGmPaD5Sx8KnW3kmJl
         0TO6cwbzy4+zKTWeVdVima/G7WO7LqLvjbV0z82YC/nU3EMuq6SNSbNBqtRr3USj2qzj
         1yhh5iybvzaR6mHfDD8n4NVfCI1hYOPgKmL97P+HIvgugW9J+EG33XKEhANBmV8541+W
         e5WC3/bEF0RT3sKfcrd/Oq3HUD6GaAHgLI7AB1ljR8DRkfUVCG07XrJvHs5tAn67Zz4H
         sWyQ==
X-Gm-Message-State: AOAM530uTlSWdSMrCEeJemcbBCL1IV+5e18lw85HATceSdtD63P9Md1a
        n5GDEXON1nryM05hHkza26BDPWc7b5QGKVn4f84=
X-Google-Smtp-Source: ABdhPJyrKEqicYc3NhFDQcYPh9BmSWMMTJbWGej2LVyhJGiCSkSNvAjmLhOmgZ6vY7YnZswvIRqqBYRbX1HyMmKrk1Y=
X-Received: by 2002:a25:d290:: with SMTP id j138mr28773857ybg.151.1627981488909;
 Tue, 03 Aug 2021 02:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210803071811.8142-1-lukas.bulwahn@gmail.com> <CAA=Fs0=V_gcfDUxn1m9OkR78cht0S=j02BsHajG1A3vuGTqQJw@mail.gmail.com>
In-Reply-To: <CAA=Fs0=V_gcfDUxn1m9OkR78cht0S=j02BsHajG1A3vuGTqQJw@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 3 Aug 2021 11:04:38 +0200
Message-ID: <CAKXUXMygDgw6oehMshsHuDo8a5j01=wErDxpgA9oiW-KMLF7=g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update STAGING - REALTEK RTL8188EU DRIVERS
To:     Phillip Potter <phil@philpotter.co.uk>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 3, 2021 at 10:56 AM Phillip Potter <phil@philpotter.co.uk> wrote:
>
> On Tue, 3 Aug 2021 at 08:18, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 55dfa29b43d2 ("staging: rtl8188eu: remove rtl8188eu driver from
> > staging dir") removes ./drivers/staging/rtl8188eu, but misses to adjust
> > the STAGING - REALTEK RTL8188EU DRIVERS section in MAINTAINERS.
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   no file matches    F:    drivers/staging/rtl8188eu/
> >
> > A refurnished rtl8188eu driver is available in ./drivers/staging/r8188eu/
> > and there is no existing section in MAINTAINERS for that directory.
> >
> > So, reuse the STAGING - REALTEK RTL8188EU DRIVERS section and point to the
> > refurnished driver with its current developers and maintainers according
> > to the current git log.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210803
> >
> > Philipp, Larry, please ack.
> >
> > Greg, please pick this minor cleanup on your staging-next tree.
> >
> >  MAINTAINERS | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 36aee8517ab0..ef32c02b3e4d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17723,8 +17723,9 @@ F:      drivers/staging/olpc_dcon/
> >
> >  STAGING - REALTEK RTL8188EU DRIVERS
> >  M:     Larry Finger <Larry.Finger@lwfinger.net>
> > -S:     Odd Fixes
> > -F:     drivers/staging/rtl8188eu/
> > +M:     Phillip Potter <phil@philpotter.co.uk>
> > +S:     Supported
> > +F:     drivers/staging/r8188eu/
> >
> >  STAGING - REALTEK RTL8712U DRIVERS
> >  M:     Larry Finger <Larry.Finger@lwfinger.net>
> > --
> > 2.17.1
> >
> Sorry, not sure how I missed this :-)
>

No worries. That is what janitors are good for... ;)

Lukas
