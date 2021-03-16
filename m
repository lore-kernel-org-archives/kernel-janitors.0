Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31D8C433E0
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 01:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A78F664FB9
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 01:47:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhCPBqz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Mar 2021 21:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhCPBqr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Mar 2021 21:46:47 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45AEC06174A
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Mar 2021 18:46:46 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id y20so17187625iot.4
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Mar 2021 18:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ch0sNEB33Nsu0fipx3+8/W+McXWjzcIJVV9du2gugT8=;
        b=D7ULs0aZy6wBJd0R/fbiCBauwQ1Fen539rTvOBOXliS5G8qoYMUdEG9BviTDkJfpTp
         rTcbaJViMifCwva1+Opw0Smz9j12gQZZdkp4fkhppMQ23VzNDhak3FJ7L+Qx7SlD51wI
         xvS2WiPxDgNvFe4P0aM/Foz4jKWnJ2N2ujroChBH2WuohUplffUs70VbzSfoaDffHFV/
         Zfb5xqdWFtF3LCZKD0GPW2KGJrDYKq15zHRTzyeJQ4U0gy+5EgjeE1ELuwi8jzR5viW8
         o7s1a7/D0qySUv51yPc/xrtKAay064bkX+OQrEaJoW97+0Hgt9/ZVsPn4X1yqHl+66Wl
         BzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ch0sNEB33Nsu0fipx3+8/W+McXWjzcIJVV9du2gugT8=;
        b=BRYTk1KHG7rmVxKkQsnVx1KV7IdeItP0iW8uTPKMG7qe7oIUCEUaGHFRX/LZPTMivC
         AVoTsDSWJZm2pundEJGCeDaxqa9dmCLhOOBl+g0p//vdEUkc+rmJ1UBQ3fPAdlflkDmD
         bU3oKGBvg95w+6eRc5B/4F6/fGwa+x1i0OIeeYP8rldr2uDHlcvq/50q07X5v/o8WGTH
         qNx1PNQxDLE53RnPUbznrTWxITFISbRzXZdVGSkdoGnaun7LNy+/vJqRjQfH9Ux6Xrgl
         EG6qlVXy7Fmr3dBE8NNZc0LhaykFV5d5z0JeFgVGPw94DNZYvxZWXb4CwMz0M4kPu+rp
         5fNg==
X-Gm-Message-State: AOAM531igZLFTv204X88LovHV7N/N4OZ0w3pTpq/vNdxfsAscmXoIJ0i
        CwvycadwS/DKrZ4bLOtlcU3X07C6BtwJ+248+TSC8I6QNsVdkA==
X-Google-Smtp-Source: ABdhPJxpq2JjKmuyg6VsGTNH049OpyuuV+CA2s2fhJXsbhgX9bjpb+8TwZ0gindiksL8te6QhfQrGclDzpUEGlo231Q=
X-Received: by 2002:a05:6602:1689:: with SMTP id s9mr1616927iow.171.1615859206404;
 Mon, 15 Mar 2021 18:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210314145943.1933245-1-eantoranz@gmail.com> <YE4zVDlsYzB/CqkW@kroah.com>
In-Reply-To: <YE4zVDlsYzB/CqkW@kroah.com>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Mon, 15 Mar 2021 19:46:35 -0600
Message-ID: <CAOc6etYyX6kxKXAQBK4K7eXJdaB=Y1+RJAwPF8kC6VrhPwvppw@mail.gmail.com>
Subject: Re: [PATCH -next 1/3] staging: vt6655: remove unused variable
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Mar 14, 2021 at 10:01 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> > -                     byData = inb(0x61);                     \
> > +                     inb(0x61);                              \
>
> Are you sure that the compiler does not make the inb() now go away?

Hey, Greg!

Take what you are about to read with a BIG grain of salt because I'm
just learning about the details of what's going on and the tools at my
disposal.

On v5.11 with an allyesconfig, by changing the value of
CB_DELAY_LOOP_WAIT in mac.h to 100 to force the compiler to include
the `else` path that includes the for with the inb() call, comparing
the resulting srom.o files before/after the patch:

Compiling with only the value in mac.h changed:

$ size drivers/staging/vt6655/srom.o
  text    data     bss     dec     hex filename
   959       0       0     959     3bf drivers/staging/vt6655/srom.o

By removing the variable in the macro:

$ size drivers/staging/vt6655/srom.o
  text    data     bss     dec     hex filename
   959       0       0     959     3bf drivers/staging/vt6655/srom.o

By also removing the inb() call, in other words, keeping an empty for:

$ size drivers/staging/vt6655/srom.o
  text    data     bss     dec     hex filename
   865       0       0     865     361 drivers/staging/vt6655/srom.


That being the case, I think that inb is not fading away by removing
the variable... at least in my environment.

Just in case, it's not like I _want_ the patch to be accepted. I took
it as an exercise and if you think that you want to play safe and
reject it, it's fine. It was still valuable to me because of your
question about the function going away and me trying to find out.

Thanks!
