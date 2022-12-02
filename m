Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D735C47088
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Dec 2022 17:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbiLBRge (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233920AbiLBRgc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Dec 2022 12:36:32 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF13E8E07
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Dec 2022 09:36:28 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id bs21so8871265wrb.4
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Dec 2022 09:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tMmIbi4e/X1/uiuwY8BvO8Ud6JyyRMbx0iz80rslda4=;
        b=LcrCJ2TMz3+4QidtoXI756Tji9ADtZqJ62iUoXhSHHFiW0rmbyQRLemmBLmyKNAsa7
         iftotDTyUGc/SP2LfHQknWNFZjbVRgzUmyLRihHVtU/RwIgZP6B5e57L1Yhm/OFRzyvp
         CNoNSuNyKsFwifjqqi5uLPa5lvo4JwNcJrIoTVBCsOTjrR9BkkXnmnY1i7cp0PW7gJBV
         ZKxsTg2TBOMI+rrFVte47+8f/BLpVW/fKUMPu8FhkS1PotgqaGbhs3e0ICFoPctNz/Ql
         RvhL7THGsVk44W73zzV8Xu/Jb+2ADrbZXxD4BHpOLpGqvMsQhM11XaSTa45a8ZAqzhAq
         kXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMmIbi4e/X1/uiuwY8BvO8Ud6JyyRMbx0iz80rslda4=;
        b=1r26kDO96ikJykug9W9RtbhPbO0kHGe75J4R9l7HbgbdhwsFrsTLud6KDGwrvYhEyo
         Ifjva4+IejwOFvbsv9BYb7L99kkR/Ytb1tLQSZmhcqkDRaqarRQroIG5Kzui7r01pqr3
         wpkj7MkklLmUOiGTbuGjKyb0g1HDUvArAqJDI8O1ieO8du2UHVqV6AGSFG0Tw2PBnJ+h
         wdYrm1TyqIswRwkNAZZ/JNu13kzVYDNEwU9WZnh/ugaDmzpoNjLZFMij3UTQsmgzFzft
         sC7l6aZ2JmFA8fUCspzoTw26NVhKR6NC9caId80ILC68l6abWQbpF6WHkS/rKgMkblPR
         /1rw==
X-Gm-Message-State: ANoB5pmOCcQOcHX8FGDkyvT7ZviTHT6aztQzkpE8JHmF7snpOnf/sCBe
        CfsxOgzgAw8RPBZXGmsh1BBkdtataEOO8F4mRieZ9Q==
X-Google-Smtp-Source: AA0mqf429zt33NbLfsZBqEmtjy/QQWT2sYU+veHHys1lkbA96+XFEq+2NvVor/amc0cuAQW+zzn3msPfSy+bKCD4Pcc=
X-Received: by 2002:adf:e64f:0:b0:241:e2f1:8b44 with SMTP id
 b15-20020adfe64f000000b00241e2f18b44mr31351795wrn.300.1670002586412; Fri, 02
 Dec 2022 09:36:26 -0800 (PST)
MIME-Version: 1.0
References: <20221202135149.1797974-1-colin.i.king@gmail.com>
In-Reply-To: <20221202135149.1797974-1-colin.i.king@gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Fri, 2 Dec 2022 09:36:14 -0800
Message-ID: <CAP-5=fWKbC_wOLiAnEnPV42mM9fpobJD++wKohFYVU66LdaJ-g@mail.gmail.com>
Subject: Re: [PATCH][next] perf/x86/amd: fix potential integer overflow on
 shift of a int
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Kim Phillips <kim.phillips@amd.com>,
        linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Dec 2, 2022 at 5:52 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
> arithmetic and then passed as a 64 bit function argument. In the case where
> i is 32 or more this can lead to an overflow.  Avoid this by shifting
> using the BIT_ULL macro instead.
>
> Fixes: 471af006a747 ("perf/x86/amd: Constrain Large Increment per Cycle events")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  arch/x86/events/amd/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
> index d6f3703e4119..4386b10682ce 100644
> --- a/arch/x86/events/amd/core.c
> +++ b/arch/x86/events/amd/core.c
> @@ -1387,7 +1387,7 @@ static int __init amd_core_pmu_init(void)
>                  * numbered counter following it.
>                  */
>                 for (i = 0; i < x86_pmu.num_counters - 1; i += 2)
> -                       even_ctr_mask |= 1 << i;
> +                       even_ctr_mask |= BIT_ULL(i);
>
>                 pair_constraint = (struct event_constraint)
>                                     __EVENT_CONSTRAINT(0, even_ctr_mask, 0,
> --
> 2.38.1
>
