Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A881C4320A
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 10:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8219B60F38
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 10:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244998AbhHFKKb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Aug 2021 06:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244972AbhHFKK0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Aug 2021 06:10:26 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91586C06179A
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Aug 2021 03:10:10 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a7so11138139ljq.11
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Aug 2021 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LYXVX/5RNLYmRt08PxMo/iqbC3LoTyV7kw364QsJWm8=;
        b=dt7l6IRvlF+TC4ZV/TMqDZBYDH8mq8sb9dogWJ2BVV3C3q+td6iGGV0W67Dal7WpaD
         r9WAdvf/VuvR50Ku1DwqTrUa1hl+vn9mn3oAAZRlt4xzCDUOmBwSQDVgdvFNSGw5mFJc
         sfiAPK4NOxjBo9v5NSApncO00h1qtn2dIp47y+l6IHnh6RmA9vSDNQJqxTqlBYcZ4/Ce
         fOjU3c0yNEOPCl/xesgddge+ssersVyGq4IwhS1SIPAaJHP0LYD3Q5vrFy5ZNCVeeW+t
         n4zSBuWvaNqW/XgZNXzzSR8QoInZDAmzIKLmrVR+ZuR1SOEu2OyRDROd6TjopsA5U0ks
         4tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LYXVX/5RNLYmRt08PxMo/iqbC3LoTyV7kw364QsJWm8=;
        b=C5x2LMusK42xUi4ub3GLP/RZBY16f3ur9C1bT+Yq6d05BvJVJVH1Cb+cMISM01Sr8y
         v+5FIVyFrPCVk2sKazCny7mTRE56W9QqFK0HB/HrSA5ecUSvmzXsgf/snqHoR+Kr7yAx
         e1A6LbCeTGJS8V00jmhWXFodfQVhfKCMNQXYPEIG4Zr/cUmF3vUIy8hZ6ME9ZhvtoQ7Z
         r5S+fTZl4GX5JDf1/6MdtH3aTd8TY4d4jaazaCdKj04XDPwSIgtA6cQ7EBHO/6rTVxNN
         iPeeRSCItp7/IGUlJ+1082h6KVV1h85vIX0zjfp8WivisPNgADP8Roissd1bpmKqnmaT
         Qc7A==
X-Gm-Message-State: AOAM533IAD6oLChRll4uijTQ/ti4Zc/tKvF5u21TVdXJs2joCrKE6NgD
        LqkZ61Sr82Swr6akp29ELQAlOrvq3Pju0ijVc1Xcpg==
X-Google-Smtp-Source: ABdhPJxZly12gB+BCFacTNDn4MWwdJoWcTKyZ2XUyIcEEn10XmyeFaAwh8Hb5uo7yR+p9lSOen0WLrtK2q5IcPs+0B0=
X-Received: by 2002:a05:651c:93:: with SMTP id 19mr6019407ljq.421.1628244608814;
 Fri, 06 Aug 2021 03:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <9a57c9f837fa2c6f0070578a1bc4840688f62962.1628185335.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <9a57c9f837fa2c6f0070578a1bc4840688f62962.1628185335.git.christophe.jaillet@wanadoo.fr>
From:   Haris Iqbal <haris.iqbal@ionos.com>
Date:   Fri, 6 Aug 2021 12:09:57 +0200
Message-ID: <CAJpMwyhd_=4vwKT6TXnyQ6sHyXSHUm44Z=OWK36smonZC=ucGg@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs: Remove a useless kfree
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jinpu Wang <jinpu.wang@ionos.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        RDMA mailing list <linux-rdma@vger.kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 5, 2021 at 7:43 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'sess->rbufs' is known to be NULL here, so there is no point in kfree'ing
> it. It is just a no-op.
>
> Remove the useless kfree.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks
Acked-by: Md Haris Iqbal <haris.iqbal@ionos.com>

> ---
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> index ece3205531b8..fc440a08e112 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> @@ -1844,7 +1844,6 @@ static int rtrs_rdma_conn_established(struct rtrs_clt_con *con,
>                 }
>
>                 if (!sess->rbufs) {
> -                       kfree(sess->rbufs);
>                         sess->rbufs = kcalloc(queue_depth, sizeof(*sess->rbufs),
>                                               GFP_KERNEL);
>                         if (!sess->rbufs)
> --
> 2.30.2
>
