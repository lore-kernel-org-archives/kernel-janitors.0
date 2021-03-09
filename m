Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DF2C433E0
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 08:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B2CA652AB
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 08:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhCIIG0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 Mar 2021 03:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhCIIGF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Mar 2021 03:06:05 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5191C06174A
        for <kernel-janitors@vger.kernel.org>; Tue,  9 Mar 2021 00:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=tXpi0NRLZeg1R8l9AxenkCU2b1Q8oXCDiadae4FElB8=; b=mpL4i2M6asT8b06BbY7HjgmfX4
        Vb/1KeWznP04Mn33RmadmjdtbeUoJuiGSIakfr3ZbJ5k98Y5VY49fYfVLXU7d0MlYC9FA2EPmkev8
        slZiP+zwbWzBpqXGKcafoFRayaycjdZoo9gIuoCmmIRH248uLepF3TS/G66GaI4X3Sw4XeQA6MHYb
        S8SS/UA5Sgs2eycIGldLP3FnlWSUCgrQe6R69Y4lNZEm6WUGDFVY0dR2n06FgDX12ePqJTc4DuGTB
        r+OFvD3h+3QX+VDUq2luwDtrCzXPzn8PTJrB7SqLYOy0vD/zkyxZpeXpKjtfC/1F4Mp5kgprwVmdI
        66JUu7Ew==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lJXNS-0040N0-Pt; Tue, 09 Mar 2021 08:06:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 36356304BAE;
        Tue,  9 Mar 2021 09:06:02 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 1A48620541634; Tue,  9 Mar 2021 09:06:02 +0100 (CET)
Date:   Tue, 9 Mar 2021 09:06:02 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kernel: sched: remove unnecessary variable from
 schedule_tail()
Message-ID: <YEcsav6fvYzdRfDL@hirez.programming.kicks-ass.net>
References: <20210306210739.1370486-1-eantoranz@gmail.com>
 <YEXenIKhyY2GCqT7@hirez.programming.kicks-ass.net>
 <CAOc6etbrW15DWRdJ=wP-R_TXzKDqAKAjzB5oVLwWfT7sOAbY_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etbrW15DWRdJ=wP-R_TXzKDqAKAjzB5oVLwWfT7sOAbY_A@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 08, 2021 at 07:52:11PM -0600, Edmundo Carmona Antoranz wrote:
> On Mon, Mar 8, 2021 at 2:21 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Thanks!
> 
> You're welcome... but I still have no idea if this baby will make it to
> orbit or if it will have to be included in a revision of the theory of
> tectonic plates. I guess I will be learning the flows of how patches move
> around as time goes by. I will be posting a couple of questions (not
> related to this patch) today or tomorrow, probably.

It found its way here:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/core

And soon, today or tomorrow (provided the robots don't hate on anything
I stick in that branch), I'll push it into tip at which point you'll get
an email.
