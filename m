Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A163CC48BCD
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 19:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76D18613D4
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 19:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhFIT7I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 15:59:08 -0400
Received: from mail-yb1-f178.google.com ([209.85.219.178]:42818 "EHLO
        mail-yb1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhFIT7H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 15:59:07 -0400
Received: by mail-yb1-f178.google.com with SMTP id g142so17870336ybf.9
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jun 2021 12:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KZqRAoGYo1BENB9HubvimN8Y/+cn3PuH69zPYdjQx3o=;
        b=hirZ/loS4K2vdyputFDRMEhTuR9bvXOISZO5bgbio6FAVoV3ba8p2sGFISfYa9bA35
         U66n8UD9fKar8yQKhbE+6y8KILTM1u5q1CdEsQJueqObRlPswFndBwx40Xrf+UgscWT5
         P/1kc/lXulx17fc3TgtHMpd0gY9AAQtBHIc30kecERdpcAtdVyIUxKs70KOezoER8qtz
         Ji0SLp8ekpxVOQ0cjxpZOnf5C6K9oQNhff6ZFGSbmVzdBzzdHIkAz2ZIBoakTf1FUgLc
         E+wj0XAn3AxMNXDXl389ltNlqIi7/pVQnNueS59eQQkMOw7DpjWLin/N1d664U5VnZV0
         wwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KZqRAoGYo1BENB9HubvimN8Y/+cn3PuH69zPYdjQx3o=;
        b=lW+m9f1jkQ3nI5FIZGG9m3QV9gKC6OVQwovxZqV4lo7SYYAcwisdgUi3z731kxlyzG
         hzb6NOqBvp2Aw/G0s+q3CY5rZKE9m3TH0Our4UCUQL2cFmL2551grV/yY2z/8kH6MWU2
         Wh4exTJHjz2yDBFhMIB8RQhA467dk6493yXXF+Ld0+qIsh6JlGGoLYBMP8t/LseTx+Tm
         t5DHjwTBQuR8vPapJi74R/eBSyRZaEiF3mTPOg5KmCmAiAvR1qzPSKcMniwOM7iCJQoH
         6GBf+BYWIY3BDIO3TGk5PQ6eammHynxGYNdT6lN/Tcn5bygW0mA+h/zh697JTatxG1+M
         LDgQ==
X-Gm-Message-State: AOAM530ojj87ws/5SXagT09IfP6Gqevj+HOvveHWz/GPTIGrD+EbkEU5
        IRuFh8dh+xKtL1uYqkw91XoyOEoqqYLf2iWVBnLUFQ==
X-Google-Smtp-Source: ABdhPJxZRb4gdCduBzzwvvchZcTffPUf81qT2AJUc7y3yhJAv6CtcBzATfEhvI7SkVQLV64xk093zYjUJecSJ9ICqAw=
X-Received: by 2002:a25:1005:: with SMTP id 5mr2100905ybq.294.1623268572464;
 Wed, 09 Jun 2021 12:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210609150437.3473855-1-weiyongjun1@huawei.com>
In-Reply-To: <20210609150437.3473855-1-weiyongjun1@huawei.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 9 Jun 2021 12:56:01 -0700
Message-ID: <CAJuCfpGTOthDz7a=n=zjaeuwoL7c6=b47TyuPMm7NKcPLAAgAA@mail.gmail.com>
Subject: Re: [PATCH -next] psi: Make symbol 'psi_cgroups_enabled' static
To:     Wei Yongjun <weiyongjun1@huawei.com>, Tejun Heo <tj@kernel.org>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 9, 2021 at 7:54 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> The sparse tool complains as follows:
>
> kernel/sched/psi.c:151:1: warning:
>  symbol 'psi_cgroups_enabled' was not declared. Should it be static?
>
> This symbol is not used outside of psi.c, so marks it static.
>
> Fixes: 3958e2d0c34e ("cgroup: make per-cgroup pressure stall tracking configurable")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

Thanks for reporting!

Tejun, how would to like this to be fixed? Will you take this patch as
is, roll it into my change which introduced this warning
(https://lore.kernel.org/patchwork/patch/1435705/) or would you prefer
me to resent the original patch with this fix?


> ---
>  kernel/sched/psi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> index b773cae4c24b..d6e32de2f6af 100644
> --- a/kernel/sched/psi.c
> +++ b/kernel/sched/psi.c
> @@ -148,7 +148,7 @@
>  static int psi_bug __read_mostly;
>
>  DEFINE_STATIC_KEY_FALSE(psi_disabled);
> -DEFINE_STATIC_KEY_TRUE(psi_cgroups_enabled);
> +static DEFINE_STATIC_KEY_TRUE(psi_cgroups_enabled);
>
>  #ifdef CONFIG_PSI_DEFAULT_DISABLED
>  static bool psi_enable;
>
