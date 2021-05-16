Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F79C433B4
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 15:37:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBC7661151
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 15:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbhEPPjI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 16 May 2021 11:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234525AbhEPPjI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 May 2021 11:39:08 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC94C061573;
        Sun, 16 May 2021 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=q5ECZIcoUPs3HAlpH6Ijrmp7zL3WNFZCaOs8cfYXoV0=; b=TL7U9Zfr3aJh/jnDQ12puoWSin
        93SCdki1O4DSRodqbUoAJlrqQ/IGfR4grcXoTnR8grJzuW7kXlxeRGD8QOwE4ua401EL5Zfvp/RAU
        +ceYei1wcwtMOnNW51bf5FuInVAr8Gba1kyr5+6uCDG1aZhbiSBVvu9IwS+ErPyXUjTn78ifSZFmv
        AyqqOpe63Md/FvNu62hP7Hd+/eiA5nAk+K6H7ZL4bONR0YIcSQWHKqFUhIlovFk6wt+OOgZ6KrmbZ
        ytNxXPU6zRUNXNfJys27QoiCTL5tYfYixvWxGLsAgwSK10jitDuno0kubQ9OQ7m6sI0t20tDj151H
        Fv0yHfqA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1liIpe-00C6mi-5d; Sun, 16 May 2021 15:37:33 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5F61630022B;
        Sun, 16 May 2021 17:37:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 24B782C8BD554; Sun, 16 May 2021 17:37:28 +0200 (CEST)
Date:   Sun, 16 May 2021 17:37:28 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Khaled Romdhani <khaledromdhani216@gmail.com>
Cc:     mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH-next] sched: Fix Null pointer derefrence
Message-ID: <YKE8OHsq4IHN9q8W@hirez.programming.kicks-ass.net>
References: <20210515164645.22849-1-khaledromdhani216@gmail.com>
 <20210515210238.GG5618@worktop.programming.kicks-ass.net>
 <20210516130129.GA32445@ard0534>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516130129.GA32445@ard0534>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, May 16, 2021 at 02:01:29PM +0100, Khaled Romdhani wrote:
> On Sat, May 15, 2021 at 11:02:38PM +0200, Peter Zijlstra wrote:
> > On Sat, May 15, 2021 at 05:46:45PM +0100, Khaled ROMDHANI wrote:
> > > The 'curr' variable could be NULL and derefrenced by
> > > pick_next_entity. Fix this by adding a check that prevent
> > > the invocation of pick_next_entity with a NULL passed argument.
> > 
> > And why exactly is that a problem?
> >
> Within pick_next_entity, we could have 'left = curr'. 
> Thus the function wakeup_preempt_entity which is invoked 
> from pick_next_entity, derefrence the the sched entity 'left' 
> that may be a NULL passed argument.

We call pick_next_entity() from pick_task_fair() (or
pick_next_task_fair(), same argument for both), we only call it when
cfs_rq->nr_running != 0. IOW we *know* there is at least one task.

Therefore, if curr == NULL, we *must* have left.

If you can't read code, stay away from Coverity, it's crap.
