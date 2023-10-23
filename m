Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CD9C25B46
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 19:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbjJWTBY convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 15:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbjJWTBE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 15:01:04 -0400
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D732419AC
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:00:49 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-58441865ffaso1350482eaf.1
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698087648; x=1698692448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geG59CJUnKNbArhBFfxHpBXxgZZOqM365JF9tbFB7q4=;
        b=ZGGkNuvixcWb5LpQJN5A1T0AFkLRaS4o+7gcSelTJ6pfGAAhN93NB/JY4enCuG0kJj
         vbDtdkuiPO09saVrBpdlqchypxjKaan3ILm7DwGXisHq/MBCdl6f+0PHtxOiiePIMrTz
         8eI1r6uVLO3TXo9IE/cVrgZqztRUEF+pwb5Ab6G7I8h/cyV9n5SdSobDPpkDF74H/8s+
         UA1xoMfQg4Y/0PEczLkgXHlmAy4UjkUuVjDPzTCIPEqEGsl5Hel9gTtNh5vKET34x+N3
         9rNI4AmCWibzLtioXZfmPlASRgOvfN8i5Stj5wk5xLa4aSgFPTWD8WKT0tMi/EzxzclH
         Fn1Q==
X-Gm-Message-State: AOJu0Yz7LSHiMrG6ajHayZxVOIP0owdOusXAa14YggABkh/CHBuWlGO5
        BEkjxNLA8+lNHhPv/ApzeUEDJK+pj4kPEQ==
X-Google-Smtp-Source: AGHT+IExjZAYOR1Y/KC1E4tJunoa/5WLOZ5OrZEL7A2p0Qrq9WjChDpo8Ujm69upzR160wRD7R7M4g==
X-Received: by 2002:a05:6808:8ce:b0:3a7:2456:6af6 with SMTP id k14-20020a05680808ce00b003a724566af6mr10746378oij.31.1698087648550;
        Mon, 23 Oct 2023 12:00:48 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id j19-20020aca1713000000b003b274008e46sm1616696oii.0.2023.10.23.12.00.48
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 12:00:48 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ce31c4a653so2332354a34.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:00:48 -0700 (PDT)
X-Received: by 2002:a9d:6b1a:0:b0:6bc:8cd2:dd97 with SMTP id
 g26-20020a9d6b1a000000b006bc8cd2dd97mr10105569otp.29.1698087647687; Mon, 23
 Oct 2023 12:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org> <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Oct 2023 21:00:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgZjN7Z484NAO51DV0tSLbbiUJr2hhiUB80FBeyh2KKw@mail.gmail.com>
Message-ID: <CAMuHMdXgZjN7Z484NAO51DV0tSLbbiUJr2hhiUB80FBeyh2KKw@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Linus,

On Mon, Oct 23, 2023 at 8:56 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
> > Well here's a task: write a bot which follows the mailing lists and
> > sends people nastygrams if one of their emails is more than 95%(?)
> > quoted text.
>
> I think that might be better off as a spam filter rule.
>
> Don't make it some after-the-fact "trawl the lists". Just make it a
> bounce with a "you quoted too much". Same as the html avoidance.
>
> Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
> kind of reply, but if it's more than 50 lines of quoting, trigger a
> "at least equal parts new message".

How to handle the (unfortunately fairly common) case of
reply-with-CC-of-forgotten-relevant-person_added?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
