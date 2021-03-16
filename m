Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B53EC433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 11:25:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5016465018
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 11:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233232AbhCPLZJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 07:25:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:38060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234149AbhCPLYn (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 07:24:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4CA06501D;
        Tue, 16 Mar 2021 11:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615893883;
        bh=YA5/DEgp8zbTO8UZrICqpF2+chsZ0sGx/vxKUsqgGJU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eJM8cnUpWAIFLBjR9cHlmzS6uVXCsunSTb5wubT3aRK4uDoyqYntfQwuQkFyFPOTJ
         U3TUKpYfMztrlNonZaVetek9rJIqrWRcTRqcwbO3D4Fyj0YEFiwUhrDiye9BPzrtno
         YetWBPjUt3Y93WoIm8tfAU3x2BaZhbiqMsnzDLq0=
Date:   Tue, 16 Mar 2021 12:24:40 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 1/3] staging: vt6655: remove unused variable
Message-ID: <YFCVeNKuaZ28564M@kroah.com>
References: <20210314145943.1933245-1-eantoranz@gmail.com>
 <YE4zVDlsYzB/CqkW@kroah.com>
 <CAOc6etYyX6kxKXAQBK4K7eXJdaB=Y1+RJAwPF8kC6VrhPwvppw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etYyX6kxKXAQBK4K7eXJdaB=Y1+RJAwPF8kC6VrhPwvppw@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 15, 2021 at 07:46:35PM -0600, Edmundo Carmona Antoranz wrote:
> On Sun, Mar 14, 2021 at 10:01 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > > -                     byData = inb(0x61);                     \
> > > +                     inb(0x61);                              \
> >
> > Are you sure that the compiler does not make the inb() now go away?
> 
> Hey, Greg!
> 
> Take what you are about to read with a BIG grain of salt because I'm
> just learning about the details of what's going on and the tools at my
> disposal.
> 
> On v5.11 with an allyesconfig, by changing the value of
> CB_DELAY_LOOP_WAIT in mac.h to 100 to force the compiler to include
> the `else` path that includes the for with the inb() call, comparing
> the resulting srom.o files before/after the patch:
> 
> Compiling with only the value in mac.h changed:
> 
> $ size drivers/staging/vt6655/srom.o
>   text    data     bss     dec     hex filename
>    959       0       0     959     3bf drivers/staging/vt6655/srom.o
> 
> By removing the variable in the macro:
> 
> $ size drivers/staging/vt6655/srom.o
>   text    data     bss     dec     hex filename
>    959       0       0     959     3bf drivers/staging/vt6655/srom.o
> 
> By also removing the inb() call, in other words, keeping an empty for:
> 
> $ size drivers/staging/vt6655/srom.o
>   text    data     bss     dec     hex filename
>    865       0       0     865     361 drivers/staging/vt6655/srom.
> 
> 
> That being the case, I think that inb is not fading away by removing
> the variable... at least in my environment.
> 
> Just in case, it's not like I _want_ the patch to be accepted. I took
> it as an exercise and if you think that you want to play safe and
> reject it, it's fine. It was still valuable to me because of your
> question about the function going away and me trying to find out.

Ok, I'll leave this as-is because the inb() needs to happen, so saving
the value is normal for stuff like this.

thanks,

greg k-h
