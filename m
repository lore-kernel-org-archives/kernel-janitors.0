Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028A4EB64DD
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Jun 2023 17:16:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbjF3RQm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Jun 2023 13:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbjF3RQg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Jun 2023 13:16:36 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DA73A9E
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 10:16:34 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-401f4408955so13791cf.1
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688145394; x=1690737394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHJRhOeYdjZGJtK0kiELfpJOpqjlUoQdA4uo5jTiZng=;
        b=tOTGvjcjXsPjf2kpF4cHDyeCHK9ePpk88UqY/w/MiSd9yS9PKXDjrtNmUABRNyN/v2
         BngxrK9UzFWDamrZwzqQOKChngOCgN5qGex4zu2IQOdBCker/AkoB/L1q/VAi6/dc4gW
         bkjxm7s8I1GTgbnkJwdmlOcPrYCz8hOVOLLT+MZLuRaHpsc5tp5jp85iIf7UeKRaitye
         5iYXhKgX23/Fa0dTZA8u6aTdN+Gdk7rbCp+ZOtEqpecBf83K5xuynaRU16nCNdx0+CbZ
         jszTQV/Q1KDVEsSxpHST0kVodPMAzCsNMpjwuQQHLrZAKkRPbIv/7gGuwgysElhjfkfS
         vRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688145394; x=1690737394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHJRhOeYdjZGJtK0kiELfpJOpqjlUoQdA4uo5jTiZng=;
        b=SDz4BlBSF0n7+t1flo/GPfNjd2a4Lzh5Z+tXh7JgEWLvEBlc22DMYpN8HCLQ9rqoaU
         PjTuRu9ukiOtR7Sh+1ylOnDR/IQANmHnTDS/fFOqtT8MKegbtV+ztQM87vosM637RglO
         nMx2YVIDH+Pmi/T1jsAEkPuft0H9yH2M7UiQk9xoQri+KXFihnVkgaZRqYy/e+l8TVdJ
         7tINdq1IauDjo1elY94EU/WQiMLeHJ24OAGFHC1rh1hE+f2oLt+a8Tlo27EwOpuf0p7F
         Mu4WL0XCkU4P6qEUgw5EsKjJEnKUoSQ3m4eAsRhaedBVYX+LTIzjIEYx99HsKlBcwmfa
         uPFQ==
X-Gm-Message-State: AC+VfDxCi+unX79WnPWOHTCW4hZ3O3KsEiis7QyyFW5ntvYbXh4sF6US
        6F/Gkl+az9z0gpVU+rOarL2AL/wHWsMkxr0jEAHfFQ==
X-Google-Smtp-Source: ACHHUZ5EIkHjSZ+sBqsk0o0f0HnhEV8nIj03CJE4DHEpGgn+INV+q28RDEvFbo7jIBrPpTNKPbpR3as1EqH0XNQ4gDI=
X-Received: by 2002:ac8:5bc5:0:b0:3f9:f877:1129 with SMTP id
 b5-20020ac85bc5000000b003f9f8771129mr806787qtb.29.1688145393558; Fri, 30 Jun
 2023 10:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230627181030.95608-2-irogers@google.com> <8dab7522-31de-2137-7474-991885932308@web.de>
 <CAP-5=fVxTYpiXgxDKX1q7ELoAPnAisajWcNOhAp19TZDwnA0oA@mail.gmail.com> <59e92b31-cd78-5c0c-ef87-f0d824cd20f7@web.de>
In-Reply-To: <59e92b31-cd78-5c0c-ef87-f0d824cd20f7@web.de>
From:   Ian Rogers <irogers@google.com>
Date:   Fri, 30 Jun 2023 10:16:22 -0700
Message-ID: <CAP-5=fX8-2USHn8M4KPfwLz3=AG9kc8=9KdjayMsRexZ87R_EA@mail.gmail.com>
Subject: Re: [v2 01/13] perf parse-events: Remove unused PE_PMU_EVENT_FAKE token
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-perf-users@vger.kernel.org, bpf@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>,
        Kan Liang <kan.liang@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 30, 2023 at 10:15=E2=80=AFAM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> >>> Removed by commit 70c90e4a6b2f ("perf parse-events: Avoid scanning
> >>> PMUs before parsing").
> >>
> >> Will the chances ever grow to add another imperative change suggestion=
?
> >>
> >> See also:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.4#n94
> >
> >
> > Sorry, I can't parse this.
>
> Can you take the requirement =E2=80=9CDescribe your changes in imperative=
 mood=E2=80=9D
> into account for any more descriptions?

Yep, still doesn't parse.

Thanks,
Ian

> Regards,
> Markus
