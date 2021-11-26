Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83340C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Nov 2021 09:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359827AbhKZJEH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Nov 2021 04:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344852AbhKZJCE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Nov 2021 04:02:04 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D535C061758
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Nov 2021 00:58:10 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id f9so18339511ybq.10
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Nov 2021 00:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=huEf5sIiaaLscYYkAZY0WDzbxVnMYvMHJ0EGSQecX60=;
        b=kHOA2uus9T8XqKH+3IVJyKPQb6VSGbElEkUXn/O4XUXd+onL7OYfTxnBroLdWa3bxl
         Ex7JJI5BvP6SZ4HYHDYHbdZRkj1KnG94fc3kTNSQvYoU7cI3e34hkZy4uxwTvPEQs4iJ
         qNcEXWKOLzM3x29pVlckJRm9dTg58N8N4jIqbg9CfnZ1I5Dm5+81nIoqf0S/zxipTlkF
         teO8i+RA5ZFC7yA9YuRz7eXbxubivVrFDUKPZJpVSivElNaqtbhVbl/TdhVoRqzx1dwg
         SKX/KhzwR5q6LtQZrx+mpScVQr/54jYAuqWd/VC+3X3/CMIzxOWjIouLTV4WdbPmACUE
         w2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=huEf5sIiaaLscYYkAZY0WDzbxVnMYvMHJ0EGSQecX60=;
        b=J98YTK1AhmoR5eJ7zVZuB9WbeYvcxzKmX9SEkUdoRsG1OBaiICAmZIHazbdU1xTXce
         sqTGvna15u6j3JFxlpE05qNC98h+woL70NGih4w3M7Vcou2OC8aw8TvXUMWRctyhGrfK
         ucvTCCS1iCusJWdPbYKlnTZ+DPrVWZ+pjfPYVsajvBWAe0Ax0g8dN/oCZL3N1r8Cw30L
         HdR9E5f2+LERpwhtSOZir9rqYNM3dV0x74QQXhIKyNPZGGQXrguqeOdBU3Inz7kblYyt
         HgX54UpO0kkeMPEl0/dXKtlACts6hGZllj3eFHFCSsbsSEXZDZmlaohUaD3FbLXRFF/o
         HtpQ==
X-Gm-Message-State: AOAM532eTjSKxzG4PPoMXBqhTAQdptX/GpSLP6nkEwVpWc3zIyS+UuHx
        5dYwOEyPResFAt+i1u0SzM9eFr5qYEVQLnqNVqQ5HWiIPYweyw==
X-Google-Smtp-Source: ABdhPJxchGeSakpJLdij/o4GKRb3zqOZ1d4CR1ucs6BwmQ35UiNCbs/nFetd6WUo44spzGVwUD09r6pD6ArLVvAfwpM=
X-Received: by 2002:a25:bc07:: with SMTP id i7mr12560099ybh.340.1637917089608;
 Fri, 26 Nov 2021 00:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20211125090635.23508-1-colin.i.king@gmail.com>
 <aa7ad39528c768dfd3a33890cf7d14b59ba3a5fc.camel@perches.com> <dcd6ed6a-a915-49b5-a428-f21f2e3e3e00@gmail.com>
In-Reply-To: <dcd6ed6a-a915-49b5-a428-f21f2e3e3e00@gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 26 Nov 2021 16:57:29 +0800
Message-ID: <CAMZfGtXJkEtH+nVMLtGhfVqySZ+iGc-1yd9OJ3jxK65puFgf_Q@mail.gmail.com>
Subject: Re: [PATCH][next] hugetlb: Fix spelling mistake "hierarichal" -> "hierarchical"
To:     "Colin King (gmail)" <colin.i.king@googlemail.com>
Cc:     Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 26, 2021 at 4:38 PM Colin King (gmail)
<colin.i.king@googlemail.com> wrote:
>
> On 26/11/2021 08:15, Joe Perches wrote:
> > On Thu, 2021-11-25 at 09:06 +0000, Colin Ian King wrote:
> >> There is a spelling mistake in a literal string and a comment. Fix them.
> > []
> >> diff --git a/mm/hugetlb_cgroup.c b/mm/hugetlb_cgroup.c
> > []
> >> @@ -495,11 +495,11 @@ static int hugetlb_cgroup_read_numa_stat(struct seq_file *seq, void *dummy)
> >>       * The hierarchical total is pretty much the value recorded by the
> >>       * counter, so use that.
> >>       */
> >> -    seq_printf(seq, "%stotal=%lu", legacy ? "hierarichal_" : "",
> >> +    seq_printf(seq, "%stotal=%lu", legacy ? "hierarchical_" : "",
> >>                 page_counter_read(&h_cg->hugepage[idx]) * PAGE_SIZE);
> >
> > Not sure this should be changed as seq output is nominally ABI.
>
> This just landed in linux-next, so I doubt many folk are using it. Let's
> fix it before it lands mainline.

Totally agree.

>
> >
> >>
> >>      /*
> >> -     * For each node, transverse the css tree to obtain the hierarichal
> >> +     * For each node, transverse the css tree to obtain the hierarchical
> >
> > Fixing the comment typo is good.  Thanks.
> >
> >
>
