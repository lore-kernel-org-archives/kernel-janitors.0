Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8121C25B45
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 19:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjJWTSQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 15:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjJWTSP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 15:18:15 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC80A9
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:18:13 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso561286966b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698088691; x=1698693491; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dz5jjur3qivUWZ6NESJNIBFVtESDaXyAPO0M+awTZ3M=;
        b=Uc/S9XcwMKkYIxIrkTwuf65FN7orl5HP2OFkJXv+aV7r6Q1pSUQ5vwEXWBc4kJ2MLk
         sJHQRv2fLPO1ta0k6DRAXfXn30TiI2C4VaezO/NGUy9gdTlHf1usEumqt00RRpH+9Sl7
         luZyO0iT3oHQVKyU6HrctVWHp5DQ2a/uoqI2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698088691; x=1698693491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz5jjur3qivUWZ6NESJNIBFVtESDaXyAPO0M+awTZ3M=;
        b=oZwhN7DZY82Fplf/P7Zn1/FMoihrJOv66+BL7rjL+7bmRmzYCyj0V+Z349DZseQZmK
         oidlC39CgOqKlnQ5G0U5aBbqcOnh+HQpPbu1q0K9Re2jIODzvDs4Uv3Ts31CTwEYS7S4
         lML6h8UglVox+RSUCbEDzBq8Gfn7yuKsDoFIxjNLoo67Q9y60OSlwin/BsqNns7ZuCG8
         8XEEF6gNAhMtNjt4xriKrOdp516GoZpIn91M4sn9WWtyOWgNVLzMMHpq5zegorpVzJ5Z
         Bq2tUhcTtbc+OTS64LR6sVHSp6Lv/7NkiTqZQDV9zIYw7lOtjs5NEJmZFe1PUJVzkaR/
         h4Mw==
X-Gm-Message-State: AOJu0YyWaa8QMBfiP2nGKWxhPIiGDAjdQaQmfGOgeP22J9NXuYlIhowl
        r57yHPyiIgATva19BRSZXefNLXBp0u2NyuhxL3xyO040
X-Google-Smtp-Source: AGHT+IHvkmWLO9wrRgUzX2w0KkgQQT9wx+kqoWAguDN288/MqFcLjThumfDtWjTS3cHMpVhJB9bKyw==
X-Received: by 2002:a17:906:c115:b0:9bd:c336:21e5 with SMTP id do21-20020a170906c11500b009bdc33621e5mr7864205ejc.56.1698088691570;
        Mon, 23 Oct 2023 12:18:11 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id n13-20020a17090673cd00b00991faf3810esm7235542ejl.146.2023.10.23.12.18.10
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 12:18:11 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53e3e7e478bso5525704a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:18:10 -0700 (PDT)
X-Received: by 2002:a05:6402:5243:b0:53e:7fe:b856 with SMTP id
 t3-20020a056402524300b0053e07feb856mr8559456edd.15.1698088690404; Mon, 23 Oct
 2023 12:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com> <CAMuHMdXgZjN7Z484NAO51DV0tSLbbiUJr2hhiUB80FBeyh2KKw@mail.gmail.com>
In-Reply-To: <CAMuHMdXgZjN7Z484NAO51DV0tSLbbiUJr2hhiUB80FBeyh2KKw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 23 Oct 2023 09:17:53 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgqTuj-mFKc+MQhumLajb+JrVxBiKjC9xaC+QRsBa-GuQ@mail.gmail.com>
Message-ID: <CAHk-=wgqTuj-mFKc+MQhumLajb+JrVxBiKjC9xaC+QRsBa-GuQ@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 23 Oct 2023 at 09:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> How to handle the (unfortunately fairly common) case of
> reply-with-CC-of-forgotten-relevant-person_added?

One option might be to just do a proper non-quoting reply and have a
link to lore for context for the originally-forgotten person.

I've done that anyway several times, where I reply to something, and
bring in new people, and add a lore link for context.

I wouldn't have recommended that a few years ago, but lore has been so
reliable (and reliably fast - not usually the case for most email
archives) that I think it's a great way to fill people in.

But yes, it does end up being a "outside email" thing. I suspect we're
all good with that these days - the days of people working in text
terminals purely out of email are long gone anyway, methinks.

Anyway, I'm in no way trying to say this is the way forward, but I do
agree with Andrew that we've seen quite a bit of "long messages that
are mostly quoting", and it's not great.

              Linus
