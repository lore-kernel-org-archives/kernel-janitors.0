Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DF0C38A02
	for <kernel-janitors@archiver.kernel.org>; Fri, 28 Oct 2022 18:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiJ1SN2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 28 Oct 2022 14:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiJ1SN1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Oct 2022 14:13:27 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0167222ECBC
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Oct 2022 11:13:27 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id j7so6996422ybb.8
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Oct 2022 11:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GRcV5xqQsaOgKI1wjHQNKQ2baGNXvTvrAr7N640Ai0s=;
        b=CrDfDlrAw515cZ1vZiX6k8IppBaUIH3QpEY2RuR7OMNwrJT1CcS5s7Vi1s0Ov3WRMM
         xzYYTOYM5R6085EGA9/TzECH5ybIyzWrwQRXmh07SgIdKYmMpXNrL+HIOy5HXN60xN5d
         lMbjx0IqbKUfBZKQjTaHEzixLfTbcYB0ooq+GmnoQRawc2YlaU6QXlxSTqiGy0qI6Kl+
         AzqjkFWZMA7x2Vm8xl5WhtA7a7R0YtTJpIta4G3oURv81vVjvwHcXoFWKJhBOSwj6yqi
         PVtKxuyTTxY+MAg6yDrjqaVosI3+dveSe/KUt4P2ig70IG7FVm8fwMS2bVjv8upQl2LB
         fcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRcV5xqQsaOgKI1wjHQNKQ2baGNXvTvrAr7N640Ai0s=;
        b=fE1ePDrc3pxcYT2fXZbzrXIRk1JuoVzLN59aUxWSTAGXZS1iULt6Ghn38R1M2aU2n2
         uRNN0IxjUif0O+X5NMyU71UM77WMaXFi4wdtgZUtzHje9i6vQDOCaITTBXETk07cicor
         f8+t5hGUAd/ExN91tRnDbVDRq/To3yeypwS9jqWiwt83PMc1/ZPZZLSC9oOAb/WDr7+j
         UJZaO/SDNqNGxxFxCSByuX7ACGwXvH4DcthGq8xb1+zQHLGw8oVIxK9kpJ4CIUJbq1P5
         MltGKNXgi4wnpB7WFoVAUj15qO7iKFWcz9UwvY9qWAbs0vDSesc0E4OSJyInf9R2fXM1
         Z8iw==
X-Gm-Message-State: ACrzQf3C0nf8qyNw+kHNkgVqZT0QwFnjUvSdknt85B0Xr9PQ7EQNIOr9
        YrL78LOr62FzJk1aHwZGyH+QPjbJV3I5A4NwtX4Y9g==
X-Google-Smtp-Source: AMsMyM5XvKCGwZtr2CLA9TM3XnI20xhaT2HqoTdj6+7h2t7UKjO5oo6Nk5V388Kg5i/+TnIodr5V0b7Y71x6e9YggCw=
X-Received: by 2002:a25:aa2c:0:b0:6cc:16c2:5385 with SMTP id
 s41-20020a25aa2c000000b006cc16c25385mr498211ybi.55.1666980805906; Fri, 28 Oct
 2022 11:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <Y1vvnBnSVl976Pt3@kili>
In-Reply-To: <Y1vvnBnSVl976Pt3@kili>
From:   Eric Dumazet <edumazet@google.com>
Date:   Fri, 28 Oct 2022 11:13:14 -0700
Message-ID: <CANn89iLaHEh6fGCFChFCDSVT=hrm0v7wXd4-FR6Gw25Ertgnpw@mail.gmail.com>
Subject: Re: [PATCH net] net: sched: Fix use after free in red_enqueue()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
        Jiri Pirko <jiri@resnulli.us>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 28, 2022 at 8:05 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We can't use "skb" again after passing it to qdisc_enqueue().  This is
> basically identical to commit 2f09707d0c97 ("sch_sfb: Also store skb
> len before calling child enqueue").
>
> Fixes: d7f4f332f082 ("sch_red: update backlog as well")

Reviewed-by: Eric Dumazet <edumazet@google.com>
