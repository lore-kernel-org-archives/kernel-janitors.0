Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68755EB64DA
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Jun 2023 17:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbjF3RGy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Jun 2023 13:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjF3RGp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Jun 2023 13:06:45 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2918E3A87
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 10:06:33 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-40345bf4875so14621cf.0
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 10:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688144792; x=1690736792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVASgTbCR4LtAtuJDvbzQqcVGfEYiy6r88JHy3o1xnM=;
        b=sRPUrGc9oB3Ibx7b/YzR9zN1h4GcsCtdB2wPN9i2xCzo+C72hWz7E+S79AFvhELUXK
         WT5lbrV1eH7BnRBwtfu4x4nJqK8FXOGykFCm62qvLNqfcM0IX3tT0ottt4U9mJS0ujXG
         ok3WBjbbowT3gqGBb5uyVDA7jzQEOezX8AQ5feg+/c6kOz1ZcFJS4wT7zPYaPogOWRS4
         wkgW6D7yqK7Dcztm/cEkDOHB5nzTQnQOFZdAE4DxBGn8KpY+g32ARYs+IabA4YVIPMUb
         xksSUOtEBJY38SV1cV938+lQnctdlcTd3W4pvDateJ6xEwnTv9exq5ebBdWU1QdP8wNy
         hs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144792; x=1690736792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVASgTbCR4LtAtuJDvbzQqcVGfEYiy6r88JHy3o1xnM=;
        b=DDgnxTtOAa2FCTxiLcirX4Ff1omOFHWxGTO64a9G+D7wns3XjstJ4p9ohPqycj9bJi
         oA0ja8L/VGLT+GriYlEeJVYTVVzl3vLXFaOYi/2lhfNsk+ZkaVT3g1oZWL7qm6GQyJGM
         vuvGvp/eWVD+rsN+evFlrwTsFl8DGbacQsvhgzaD8QS5uCAETXVdnAjJf6rKBFDh5C0a
         9eOoYurOHqhlNlT65+hbVbxjl3mKwOWQRPzt+qRva5P1oEKyhZkoC/2V8OibPqkm73YO
         8uY7z4C+y306gxKx7FvW8WQ1fN931QUHjIKJpE+c3U4srNCjv56SjTzjnOIgieiwTbVk
         j5Zw==
X-Gm-Message-State: AC+VfDyyT/bd+CEgYsBnyNoqLi3eB4elChqDRGkBMz4ETPTklaxH6uKl
        uhSPQqrr8FFRPidGoGfhKWjlFOTOgkmb/E6Vi6y83A==
X-Google-Smtp-Source: ACHHUZ5cxfnrUBwwr53QuYLI3sStCvIc1DXzuyCXs6zKME22fD1QxLFlksDAe2Lqzr/0juxAp5RWE8ZplNuk+Qp80UI=
X-Received: by 2002:ac8:5b46:0:b0:3f7:ffc8:2f6f with SMTP id
 n6-20020ac85b46000000b003f7ffc82f6fmr1044117qtw.28.1688144792039; Fri, 30 Jun
 2023 10:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230627181030.95608-14-irogers@google.com> <ea39aaf0-0314-1780-c1cd-7c3661fa3e7c@web.de>
In-Reply-To: <ea39aaf0-0314-1780-c1cd-7c3661fa3e7c@web.de>
From:   Ian Rogers <irogers@google.com>
Date:   Fri, 30 Jun 2023 10:06:20 -0700
Message-ID: <CAP-5=fX+kdRujgNAq8SVkkNwgnB383r38+AEmvon1k01R4X=kg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] perf parse-events: Remove ABORT_ON
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

On Fri, Jun 30, 2023 at 9:56=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > Prefer informative messages rather than none with ABORT_ON. Document
> > one failure mode and add an error message for another.
>
> Does such a wording really fit to the known requirement =E2=80=9CSolve on=
ly one problem per patch.=E2=80=9D?
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.4#n81

Sorry your explanation isn't clear. Please can you elaborate.

Thanks,
Ian

>
> Regards,
> Markus
