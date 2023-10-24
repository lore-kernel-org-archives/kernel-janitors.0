Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7990C00A8F
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 07:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbjJXHTp convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 03:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbjJXHTp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 03:19:45 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6E398
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 00:19:43 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7d9d357faso42011617b3.0
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 00:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698131981; x=1698736781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoyfqL9xvTo4TOT00Ugl9s8iTQc8bsijATmwRynbRy4=;
        b=joSw/CMM9H10aXl4zaFJwVgIcgtKNBnXw+8jnmjdvoZJWb4o+Y1WY9KY87rM8M+N0h
         pl1cXAHl3d2on0tFmpw9q+g2UhV8eALXZeAmD9G7/y7YqVeSXAhDkYax8hBfCMqk9Dxu
         aaJXPXjE4H9aFm//VgmFqvSs4vMnbiugnImwseWTTfedC9nrmeR0FHtAwt8l0VxBlkv+
         g1DK+ECaWSd7CYBk8rbGFRvzzBF27d04+C8AYAse0z69HiiMNERqNnf2cWJST3nRJSD9
         MLSyIHZDt0KMwKLivWH9rXe7rt6NpVQ3LPYnfS4yHWJ9+Pv62Y0948NLr9wfiiu5WXTP
         BO3A==
X-Gm-Message-State: AOJu0YwJlbM4+S5nCAtULLEJ7cCCLnSBaUOUvKNfymhyfyJ92jG6f1R7
        t49xTEgvyH9faK3mA+RvzeSWOqeBjxZw+w==
X-Google-Smtp-Source: AGHT+IG84SGW0qeJgl0iyXA0Rvf6B29GhH8f0jbnZhCBs9KwdCoaJ3RsNSuHQr1ema5fF9wNMpSzbQ==
X-Received: by 2002:a0d:ea8d:0:b0:5a7:a989:b85c with SMTP id t135-20020a0dea8d000000b005a7a989b85cmr11932657ywe.16.1698131981313;
        Tue, 24 Oct 2023 00:19:41 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id o207-20020a0dccd8000000b00589c103d00asm3854932ywd.79.2023.10.24.00.19.40
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 00:19:41 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d852b28ec3bso3949402276.2
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 00:19:40 -0700 (PDT)
X-Received: by 2002:a25:f812:0:b0:d9c:b566:242c with SMTP id
 u18-20020a25f812000000b00d9cb566242cmr11089305ybd.55.1698131980606; Tue, 24
 Oct 2023 00:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org> <169809755184.20306.3698252725424588550@noble.neil.brown.name>
In-Reply-To: <169809755184.20306.3698252725424588550@noble.neil.brown.name>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Oct 2023 09:19:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
Message-ID: <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     NeilBrown <neilb@suse.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Neil,

On Mon, Oct 23, 2023 at 11:46 PM NeilBrown <neilb@suse.de> wrote:
> On Tue, 24 Oct 2023, Andrew Morton wrote:
> > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > Yesterday someone on my lists just sent an email looking for kernel
> > > tasks.
> >
> > Well here's a task: write a bot which follows the mailing lists and
> > sends people nastygrams if one of their emails is more than 95%(?)
> > quoted text.
>
> Doesn't your email reader automatically hide most of a large quote?
> Mine does :-)

That's part of the problem: many people don't see anymore if the
previous email author removed irrelevant parts or not.  Until they
want to reply...

> > It's happening significantly more lately.  Possibly because the gmail
> > client helpfully hides quoted text.

When replying, the Gmail web interface (or Chrome?) is also very
slow when selecting very long irrelevant parts for deletion.  And it's
hard to predict when "Show original" and "b4 mbox && alpine -f"
would be faster...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
