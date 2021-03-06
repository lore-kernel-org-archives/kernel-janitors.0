Return-Path: <SRS0=552U=IE=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5880C433E9
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 21:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2DC6650D9
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 21:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhCFVWZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 6 Mar 2021 16:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhCFVVx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Mar 2021 16:21:53 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3332AC06174A
        for <kernel-janitors@vger.kernel.org>; Sat,  6 Mar 2021 13:21:53 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id i18so5338730ilq.13
        for <kernel-janitors@vger.kernel.org>; Sat, 06 Mar 2021 13:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=irFCCXr9vbcMpfZNTy2nGHZZqdybqM/iI9Xea2ZfYDE=;
        b=G6aQgkvwPQxz7QWs0eU7GrAZP24gOloY1tS8TLJ1nrgxP6Poz2BXAuTWD+g3e/3l+N
         enfAaxPThkvIfle6pXViUViS0sJY61+HLb0AE0kDZEMeerNCpmMRzVwdPOzp6fZJI9Xb
         0AgA0ekpEsr0zdxYc6rFMtqovVVIlgvscU+DOOMS9Emjhgy9MaMUdnf3B/i8QFufXlME
         kHr4Oh/CFEqAPOBiGCtKJFzFYJE8Iz5DTkRrpo975C73oUcDh4FEWpNWaWBIaPPSPCjL
         G3Uemc7hhSOlgnFa4EzONx7tP5OLYswmSRHcXeLLQAmWRtwf1uSElai+goBFr3kT7tlc
         sp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=irFCCXr9vbcMpfZNTy2nGHZZqdybqM/iI9Xea2ZfYDE=;
        b=LsdgzqzaU4GTzN9yuOZKy/oRIBE4VoOEJoK2AaEtQ4wxxkXkrFDmYcfQiIV8dgdOi/
         bpeQsAF3L80D0iYGk3QKdP3y/DDfJTg7r4OOHpERfQZ9nDTCRFVGxvIWQm2VdaiBpjJC
         M3LKRKHXuZwy2VcHGCHB9Ad2xepa6KQjG9qd08+UxtxwnIOSYHHwfYp4USH6b6KER/ql
         J8oaqPr0iXEjkddGfEfrSOW8hEURzNFhJbVmnMSGNwKL6+iOlvSSUEXF2lWKJE6jCQHT
         ch4igjh9RNCA7ouKtSomWjNAgTww7ZcxBRhiXVt0cecC/oWVKNauIAc/bKu+IMvuTVjy
         ewhw==
X-Gm-Message-State: AOAM532GYkFpq4fwp9cgNuFV0uTXwwUfhD56ybdB2Tf4y6tTz/Oqi4C2
        i11LAay3hh4+0PW6G1MBZBsAuFOgMBLIpwt5/AXnfa9/MTs=
X-Google-Smtp-Source: ABdhPJxtLJGwimksOGD83MnGDn6pTWrxWtycXN5NpMbNZ6taK/fki1r09QeixtAb9NDW9svQT97FH20NPrYEV/s6tpU=
X-Received: by 2002:a05:6e02:1b0c:: with SMTP id i12mr14244765ilv.200.1615065712320;
 Sat, 06 Mar 2021 13:21:52 -0800 (PST)
MIME-Version: 1.0
References: <20210306210739.1370486-1-eantoranz@gmail.com>
In-Reply-To: <20210306210739.1370486-1-eantoranz@gmail.com>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sat, 6 Mar 2021 15:21:41 -0600
Message-ID: <CAOc6etawvzRa2KuEqb8GN+QAJ74KfzDOWT+bdLOiRsD2fkzG2Q@mail.gmail.com>
Subject: Re: [PATCH] kernel: sched: remove unnecessary variable from schedule_tail()
To:     kernel-janitors@vger.kernel.org
Cc:     peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Mar 6, 2021 at 3:08 PM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:

While looking for ways to find compilation messages (still learning,
if you have any good resources for a kernel newbie to look at / learn
from, please, let me know) I found this piece of low hanging fruit
that was begging for a kind soul to pick it up. Given that this is my
first baby intended for linux, let's see how far it is able to fly (I
wouldn't be surprised if it falls directly to the ground). I hope I
didn't mess up too badly in terms of formatting and that I am
_hopefully_ following "the procedure".. and if that's not the case,
please let me know where I can read about it.

Thanks!
