Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9F6C4338F
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Aug 2021 18:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AB716115B
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Aug 2021 18:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhHTSGL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Aug 2021 14:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhHTSGK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Aug 2021 14:06:10 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2099C061575
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Aug 2021 11:05:32 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y190so9292585pfg.7
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Aug 2021 11:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ExXC5mDEawQ3pcUC2Zg52qtmML7jPSdsQ3dGxklenzk=;
        b=aQFchI0Ff9kpjFuCisV3GK+MLta+D17nyGxkxC+wMIscBxptlhgpWiVqFlQJ1xbHmT
         LYqdEH9RWdzN2tBR18FqljBmy936ijzrTh3yExBqCvYMsCNAkLRr3ooHQ9StYrWL8mV6
         YoyHdEcdlQdDSmonzwl3CSIzx9RuIBYFhDp1iZ+qdhssD/vO4FYmuR9zKqZN67dgjqa9
         DnixLiL9bgsrEqtPCJWOf2VsLEcnFG8WymT34oUiJDeM5WH9tKsl/sYWSiZoFQ7e0Kch
         5gFyIXJSsi88bIU6w71DcA1J6puENTY3sbvPFK4U7yY5rJSRCV3raZt2AMyojAxSpB01
         /SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ExXC5mDEawQ3pcUC2Zg52qtmML7jPSdsQ3dGxklenzk=;
        b=WtxAKsQ58x/S/s+YKHKQE2pLHtykpTvZfLY9wZLj7YXud/ieGKfIdXP+jKPqaZvvDz
         n5Txy4n0sOw5PrTlvDdz9Efur6/gNK6KxnWB5xsk6ZM7LHqqt5IbKzap33u6cxzg/x4q
         BRY4FAn48zC1aeZwZcrFH9urWpuczBzAh8cEAnZyKcWCC0Gl2RfsDGNikL3Bs8AwU635
         v06ityRCmYJNj67n0gQm4ZcK/ep+1jkAME7QdkJFnejc5JSplDeLeAvF/x7N7sX4yJTd
         QkC0/0dfUOtsH9gmGkT9yXH4L2StgRxObHYf28O+3zsgBX9Yzm2QMy7cCPyMDUokzxh2
         /xew==
X-Gm-Message-State: AOAM533WHVH+269iO/D2zM3Rbm6Yg3nNoSOxiqVUTQoWj5oI4SDaehm0
        /7RXPu6dNuS38rd8NrVnakgSfDQz2Tvli7iQivEMCkhhIPwxiQ==
X-Google-Smtp-Source: ABdhPJxfuUNpylH4sQPLzuSTRGMVX0HWBj3IxtWKgkpSAqM9UHPf0esocbwh94cn/RzfnLut+T4Jv0cHasHPlQTFQlM=
X-Received: by 2002:aa7:8b0a:0:b0:3e1:2df9:d827 with SMTP id
 f10-20020aa78b0a000000b003e12df9d827mr20491683pfd.67.1629482732043; Fri, 20
 Aug 2021 11:05:32 -0700 (PDT)
MIME-Version: 1.0
From:   Tech Zhou <zhouinamerica@gmail.com>
Date:   Fri, 20 Aug 2021 14:05:21 -0400
Message-ID: <CAJwUSPsWQNMpQr0sS4=rwWD=6ZjbD+AbLWgcjd3+WGz-gngp+g@mail.gmail.com>
Subject: [PATCH] Fix spelling error in arch/powerpc/kernel/traps.c
To:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I found a spelling error in arch/powerpc/kernel/traps.c. Please let me
know if you have any concerns / questions. This is my first patch!

Signed-off-by: Changjun Zhou <zhouinamerica@gmail.com>
---
 arch/powerpc/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d56254f05e17..7355db219269 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1522,7 +1522,7 @@ static void do_program_check(struct pt_regs *regs)
         * SIGILL. The subsequent cases all relate to emulating instructions
         * which we should only do for userspace. We also do not want to enable
         * interrupts for kernel faults because that might lead to further
-        * faults, and loose the context of the original exception.
+        * faults, and lose the context of the original exception.
         */
        if (!user_mode(regs))
                goto sigill;
-- 
2.25.1
