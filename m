Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7955C433DB
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 13:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 767DB64DE5
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 13:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbhCNNwU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Mar 2021 09:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbhCNNwH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Mar 2021 09:52:07 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07F4C061574
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 06:52:06 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id r7so6997258ilb.0
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M43xvaG2cUQp7fZwylnlMi5nKMzLnlLfv1CX2IFl1j8=;
        b=nXgjy3u+wmxlzFkYripjWF4Jy+nqNa7ykGZPslM6667hfmLVtr6sbMxSE/dWJZP9Ut
         cIGUaVv74fvxUCpcjAPTVa+WrrlJ9Vq+1IYhHUTc+Rn1ptwbmohQMm6lDaAQQDelWYMU
         Wj6n/XBY5QlLTuqo1XoLyCgydZMsrl/LyAlBARVfydtdrUXGsBpkEancAE4gwbts5CFe
         mV+1itI6+3C/SI9HUS5oP0y49v6xdcB3wthUMO9KmUTdM913zbhaeNhAxlVQnL8DQ7DZ
         +nnxdodo0s+G2MSJYXjR2hn5Im10UlBEy190MKvn+ASDHSOYDYcrjiUYyk3dstgT0Ant
         KX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M43xvaG2cUQp7fZwylnlMi5nKMzLnlLfv1CX2IFl1j8=;
        b=s3DfQ+HZngLNkf/OyXoV7XiZx0Ny5+4O3UQxO0Uc9u0r+aVUnS71XCKG0Eh5Ks9W2d
         XdM/3eRsq2xW/Dei90ArM11F/OiutELPaZnTZfsMYRy9QlUknLR3ugLTJXyE2WFHjBYj
         eXM0lMpihymq6BqCTF1YgWAes+UOUEq1ld9uC86MmiqwM0WXX1J4yS7dbqf7tDB/QpP8
         cIS/KYuPsKXylMSG/zn5vOTYa64vGOzY4fI3MpfWeTVk2YhcSU0G6mFv3TBZhmomz73m
         jdKigUE8DSJVB+QrqRhjvIe1qe3QZREKSxFSZwEHsmFXBDFOIfqaEaifK1rEGTBL2L4j
         TXDg==
X-Gm-Message-State: AOAM53257E40mLY4ouq3hcrGo4yS/kcD2BQv+XGmdZJhjgDpyGo9da/U
        FaY9Z5IK9RD6kPnYsy/l1iNwxnWc7Od9gpK5b6D/dis099M=
X-Google-Smtp-Source: ABdhPJwlu2n/RX/DkBp9/wKO1IJTQfNUkGNaMzU4IMIb+KEnXb7WK7mS8agNVW3cjyzOfeXia18dHQ2prLPFl0KTOAo=
X-Received: by 2002:a05:6e02:156e:: with SMTP id k14mr8936360ilu.200.1615729926421;
 Sun, 14 Mar 2021 06:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAOc6etbXM7rCSovO0A0Ye+ZQ8=JUkNM_p=L_3HL2k9UASNfHkg@mail.gmail.com>
 <alpine.DEB.2.22.394.2103141018490.2986@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2103141018490.2986@hadrien>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sun, 14 Mar 2021 07:51:54 -0600
Message-ID: <CAOc6etYGTb0f1VoRrZ8r6q+3LYuAzm7S-85xRYnS0m-4SdqHPQ@mail.gmail.com>
Subject: Re: Is it ok to propose more complex code changes?
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Mar 14, 2021 at 3:21 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
> In principle, you can do whatever you like in staging.  If the maintainer
> doesn't like your suggestion, they can reject it.  This looks not entirely
> trivial, because the thing you want to abstract over is used once as a
> variable and once for its address.  I guess you can pass in the address
> and then dereference it, but you would have to check that that works ok
> with ARRAY_SIZE, which is also a macro.  You would also need to understand
> the code well enough to give this new function a resonable name.
>
> julia

Thanks! It's a great piece of advice.

Given that I am not much of a Pro C Developer, I took it up as a
challenge modifying the code in question to use a macro and then a
function. The macro attempt came up reasonably fast but when I tried
switching into a function the ARRAY_SIZE became much of a nightmare...
at least to me with my lacking c skills. But after a while of looking
at the code in question eye to eye, I noticed that the channels and
their size are already saved in the bands (lines 103-105, 110-112 in
drivers/staging/vt6655/channel.c) and that made my life much
simpler... and the resulting code is also simpler. I will give it a go
at sending over the patch and let's see how it goes.
