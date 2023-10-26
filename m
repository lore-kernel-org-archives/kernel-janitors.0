Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6CAC25B48
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Oct 2023 06:57:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjJZG5K convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Oct 2023 02:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjJZG5J (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Oct 2023 02:57:09 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B477D129
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 23:57:07 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a7ad24b3aaso4160437b3.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 23:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698303426; x=1698908226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yo7zQMiibvOrcCe18s7h6tSUNvqWnESk/8F8k/znQpo=;
        b=CRbZ+wLegQdwesyHhDzjClTTHVo+AZBJSflY6ZexgWEcVK9O28XiRgo5+JWlV2JVog
         RRrUt/xSguRJxmBYAt0zasH9OlnNehdZPf2Dt+RuV7rdNKp2/RHZDBDLEd8cqlspclOK
         DlVph33M374DGAcHL0t3jrm4vnw2Vob/SP0wNCAPqRv7xXvDKtj7d1K/qnPbzNy2FWil
         ajf6UuluRQq8c479gxclIH447rp2/1NuPVa1AFtXLYZaO1unpLLCZPWIo/gmqANIeuoQ
         mlfcqGvYrY+5ra4iQCxUIKSxW5pNudtPJA1MDbykHh8IV4OTMu3lPssNAbNLZPif92gh
         Lfhw==
X-Gm-Message-State: AOJu0YyCOXGjPtQfjK9yg+B2/cjAOdv59Xcc0tyNHLDsSfTqE8au2SbO
        WpL4sJJ1pcw3BzRsJl/EJ3bL8ZMN3e2Fzg==
X-Google-Smtp-Source: AGHT+IHf+ovKTwKW0KbqfKmAGm66C2q9mt9mQNmBhIO8YIrfgSgRMYK0ZaYIbMcPnnK3O4cTUs8Mlg==
X-Received: by 2002:a0d:e347:0:b0:5a8:1d75:65c3 with SMTP id m68-20020a0de347000000b005a81d7565c3mr19522437ywe.13.1698303426669;
        Wed, 25 Oct 2023 23:57:06 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id w125-20020a0ded83000000b005a7d50b7edfsm5722219ywe.142.2023.10.25.23.57.05
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 23:57:06 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d9ad90e1038so385413276.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 23:57:05 -0700 (PDT)
X-Received: by 2002:a25:9e0a:0:b0:da0:365c:ff67 with SMTP id
 m10-20020a259e0a000000b00da0365cff67mr7888761ybq.12.1698303425727; Wed, 25
 Oct 2023 23:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org> <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
 <169826846576.20306.981035382886610843@noble.neil.brown.name> <092891b2-b1cb-4b95-bb6b-65e538378d99@kadam.mountain>
In-Reply-To: <092891b2-b1cb-4b95-bb6b-65e538378d99@kadam.mountain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Oct 2023 08:56:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmcCTr4zmDD2ttbgkjui=hC_PuHpy_mjUhAafKwKq5PA@mail.gmail.com>
Message-ID: <CAMuHMdUmcCTr4zmDD2ttbgkjui=hC_PuHpy_mjUhAafKwKq5PA@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 26, 2023 at 6:29 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> For a new driver, what I sometimes to is put a summary at the top.
> "Thanks.  The only real bug is some missing error codes in probe.  I had
> some other style nits as well.  See below for all the details."  I
> normally write the email first and then chop out the "no comment"
> functions at the end.  (Sometimes I chop out the no comment functions
> at the begining and then I have to start over when I change my mind).

Sounds very familiar (also the (...) part ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
