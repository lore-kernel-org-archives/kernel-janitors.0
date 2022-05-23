Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505EBC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 May 2022 16:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238889AbiEWQrh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 May 2022 12:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238868AbiEWQrf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 May 2022 12:47:35 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0974726CB
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 09:47:35 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id a127so15670666vsa.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=80S8PctliGOeW9sdmtk62ftvrGXBeuID8tBu3II0AtQ=;
        b=QLFTfJxJAcj0vuVPdjG7/2oNQcI4B55nhUKl0e57e/VCkr+UGv1PcDJK5EmLaFCVQ2
         R/BP4hb32JPOLe9GjyQVCjiL/pLDR8CNlot+jh65KF5Lt9nvtSeVMPYiWBwOM1bWgW/+
         2Mzr9axl2uS32Wzsct8LDbwBYaAW/2lVuxxEtl79X2SzvUqvVQaoOUvm0L0ag/ts9ry5
         H8PD7/qLEKJG2AnO+TDllQDpKYFQ8zXextCOLXEounaAiAfBIsU+mro63woWX7n8nEK1
         X2sC+wlF+X5Nh4Mn3AsPfhzvDA7ob+g0UC/TINJRwedLhMMXfI6nlLDFnJmENXhyaa9J
         SPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=80S8PctliGOeW9sdmtk62ftvrGXBeuID8tBu3II0AtQ=;
        b=qatk9mnymZD9H6djVI9pvJwHx3eTQn6qrPCMu1j+XRW8z3WgWDbn4pumedTaGhHGlx
         /p4TtwvDnqipptkGr0L8eNHC5UCp6acID1n1gwpiSoPMcuL2cMCUTSIBTbKoxHnmkTFv
         kmFXNvyGh25zXPA93wvnxrufAHbgwiofbTnqFmxt9TAdSbdbSI5s5SlRr4dpwS4UGDLM
         SP3ydzf+DQshh5r1PKt5fmVtLn6U2E6OzkBGwmPuwfjM24ncRR0mhTEz3CHwoMDI9ej4
         flreZRk6uXnz7F850/E7H/XlOG3MARkHjUUHqiJ3nFq09CdcZVMvK5qTw41giXogJ+va
         Cu7A==
X-Gm-Message-State: AOAM531fa5ykpXJuxPIWM7WHDO1O/EdLux5xP2geHaTst7JEfof2mDTY
        2lVuNW4etAcZCZV09twUJqN9c/zCXPDY2SKRgdki
X-Google-Smtp-Source: ABdhPJwqtmK7aM4Q4deJfPW2cZGIcvXkBikK5NrznWed0II6tLlTEkYtSSzfjEZ8CHLO5dUR1QKGOpmqDeagd5cSjCY=
X-Received: by 2002:a05:6102:32c6:b0:333:bdd3:14f6 with SMTP id
 o6-20020a05610232c600b00333bdd314f6mr9042054vss.19.1653324453954; Mon, 23 May
 2022 09:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <d7fc85736adee02ce52ee88a54fa7477fbd18ed2.1653236802.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d7fc85736adee02ce52ee88a54fa7477fbd18ed2.1653236802.git.christophe.jaillet@wanadoo.fr>
From:   John Stultz <jstultz@google.com>
Date:   Mon, 23 May 2022 09:47:23 -0700
Message-ID: <CANDhNCqPH5SQR6YhZjqHF0BvC-Wo+epCkxmFKqzFSj7+POMWZA@mail.gmail.com>
Subject: Re: [RFC PATCH] timers: Optimize usleep_range()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dan.carpenter@oracle.com, Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, May 22, 2022 at 9:38 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> diff --git a/include/linux/delay.h b/include/linux/delay.h
> index 039e7e0c7378..e84e7f9c1a47 100644
> --- a/include/linux/delay.h
> +++ b/include/linux/delay.h
> @@ -61,10 +61,23 @@ void msleep(unsigned int msecs);
>  unsigned long msleep_interruptible(unsigned int msecs);
>  void usleep_range_state(unsigned long min, unsigned long max,
>                         unsigned int state);
> +void __nsleep_range_delta_state(u64 min, u64 delta, unsigned int state);
>
>  static inline void usleep_range(unsigned long min, unsigned long max)
>  {
> -       usleep_range_state(min, max, TASK_UNINTERRUPTIBLE);
> +       /*
> +        * Most of the time min and max are constant, so the time delta and the
> +        * convertion to ns can be computed at compile time.
> +        */
> +       if (__builtin_constant_p(min) &&
> +           __builtin_constant_p(max)) {
> +               u64 delta = (u64)(max - min) * NSEC_PER_USEC;
> +
> +               __nsleep_range_delta_state(min * NSEC_PER_USEC, delta,
> +                                          TASK_UNINTERRUPTIBLE);
> +       } else {
> +               usleep_range_state(min, max, TASK_UNINTERRUPTIBLE);
> +       }
>  }

It seems the key optimization is just moving the multiplication to the
inlined header function, so rather than duplicating most of
usleep_range_state() in __nsleep_range_delta_state(), could you not
switch all uses of usleep_range_state() to use the
__nsleep_range_delta_state()?  Then you don't need the
__buildint_constant_p() checks since the compiler can decide on its
own, no?


> +/**
> + * __nsleep_range_delta_state - Sleep for an approximate time in a given state
> + * @min:       Minimum time in nsecs to sleep
> + * @delta:     Maximum time in nsecs to sleep

I don't think that's the right value description here. Maybe this
should be the slack value?


thanks
-john
