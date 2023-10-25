Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF95C0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 06:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbjJYG4J convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 02:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJYG4H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 02:56:07 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD88133
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 23:56:03 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d9ac9573274so4795746276.0
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 23:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698216962; x=1698821762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksSM5UcSNSuje/8EMlCLMe9/k822Jb/DJeRzPPZzmIE=;
        b=jKORln8jUjLg2KgesX/0ae4na6XEi+bOLBATKr7x7eVt54Lv29MEBA2064Dcg9B/Ew
         0flWEZh9g7wqW0jqinPntJk+lLByBHbc4ZnB444vIVNY9D7C8KFp2Y/E8xFkizx2XDWf
         BO4JlNfuR4NxtNX1ECVDvIvgBU3GOL38R/O+QJERG0GsyXtToGXVM6ua2ViGqg5O0F0w
         zuIfXFggVxgaSkXuTgfi+Cx+auFE8kWID4t774HKBzORU5pqWkqt1fbhxj2UMuf3UiOk
         xHXCWJoJCyZfz6NG4cQyLpeLp2Tojpnac+5Rq5bHUKWtUbprdKoz2J6sb/ONAiPuW8zi
         2oZQ==
X-Gm-Message-State: AOJu0Yyr8abYbIUHfGcfM/9DzSW7eeGj6kkpAm++jybgWQdb2NbL3gfa
        iSoIaM9RF3lDBRvc2nP1eqG0wJQowHZvBg==
X-Google-Smtp-Source: AGHT+IFQGIvvuTc927PPG9zhScilxJWZyTY+CcQw6l5wKwdMiPsr6ggtA0OleZwisVihUmTU+YxEnA==
X-Received: by 2002:a25:4257:0:b0:d9b:d0b7:d2a0 with SMTP id p84-20020a254257000000b00d9bd0b7d2a0mr14605746yba.5.1698216961836;
        Tue, 24 Oct 2023 23:56:01 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 9-20020a250d09000000b00d9c7bf8f32fsm4237263ybn.42.2023.10.24.23.56.01
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 23:56:01 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59b5484fbe6so54163227b3.1
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 23:56:01 -0700 (PDT)
X-Received: by 2002:a0d:e291:0:b0:5a7:fbd5:8c1 with SMTP id
 l139-20020a0de291000000b005a7fbd508c1mr14810093ywe.17.1698216961347; Tue, 24
 Oct 2023 23:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org> <169818295461.20306.14022136719064683486@noble.neil.brown.name>
In-Reply-To: <169818295461.20306.14022136719064683486@noble.neil.brown.name>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Oct 2023 08:55:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
Message-ID: <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     NeilBrown <neilb@suse.de>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Neil,

On Tue, Oct 24, 2023 at 11:29 PM NeilBrown <neilb@suse.de> wrote:
> On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
> > On 23/10/2023 20:49, Andrew Morton wrote:
> > > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >> Yesterday someone on my lists just sent an email looking for kernel
> > >> tasks.
> > >
> > > Well here's a task: write a bot which follows the mailing lists and
> > > sends people nastygrams if one of their emails is more than 95%(?)
> > > quoted text.
> > >
> > > It's happening significantly more lately.  Possibly because the gmail
> > > client helpfully hides quoted text.
> >
> > I would also point to reviewers and maintainers who give a Rb/Ack tag:
> > 1. somewhere at the top, without any footer like Best regards, and then
> > quote entire patch, so I don't know shall I look for more comments after
> > Rb/Ack?
> >
> > 2. quote entire email and then add Rb/Ack, so I need to figure out
> > whether there was something between the hundreds of lines of text or not.
>
> Here we all are, brilliantly talented computer programmers who spend
> our days making amazing fast digital devices do amazingly clever and
> subtle things, inventing time-saving tools and processing vast amounts
> of data without blinking, but for some reason we think the task of
> skipping over a few thousand lines that all start with '> " is too hard
> for us and that we should, in stead, complain to some other human to
> convince them to make our life easier for us.
>
> Does anyone else see the irony?

Please compare the numbers:
  1. 1 sender removes irrelevant parts,
  2. N receivers skip irrelevant parts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
