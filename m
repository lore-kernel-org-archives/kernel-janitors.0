Return-Path: <SRS0=t3v2=IG=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B6AC433E0
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 Mar 2021 08:58:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50A5F65132
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 Mar 2021 08:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCHI6T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 Mar 2021 03:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhCHI6T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Mar 2021 03:58:19 -0500
X-Greylist: delayed 2187 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 08 Mar 2021 00:58:19 PST
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167DCC06174A
        for <kernel-janitors@vger.kernel.org>; Mon,  8 Mar 2021 00:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=UO78PIatIBajDLiKM/msuaOjOmcLkUGPme8klm6Jl0w=; b=NhIvuWomnAiDlGuGSdSgWjk3Sf
        Rpq6q2xx2vDed84VT6bbQNgrPP70je9jmm26f+z0Vfxud+Bloy7+5eL6lDNAaN3MDOEWvQ/Y9pKCW
        sAGQjEQ8z/j554TR6y+aMJ1BZNsCxjmBLxkqy0tHZYjsACBEwgdx9uiR5lT+jMdqQQOG3ei9HFOyD
        oUxsn7++DfcCNMsNF65XreAW29i67Pca69qfFPGPL4QmB6o5C7yEj5xfmDdT0vhsB8JN0i54B2OF/
        IwGi/H6+o9c4GqRN0MRC0A4qhww6Y9Wo4uMq019FSj2kB0aGKrEwN8ulftY0aMet9dyNXjPgdSHRx
        7JhgQgbQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lJB9B-00Fuoy-Qe; Mon, 08 Mar 2021 08:21:50 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C2D2D300238;
        Mon,  8 Mar 2021 09:21:48 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id A34A42BB25DD7; Mon,  8 Mar 2021 09:21:48 +0100 (CET)
Date:   Mon, 8 Mar 2021 09:21:48 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kernel: sched: remove unnecessary variable from
 schedule_tail()
Message-ID: <YEXenIKhyY2GCqT7@hirez.programming.kicks-ass.net>
References: <20210306210739.1370486-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210306210739.1370486-1-eantoranz@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Mar 06, 2021 at 03:07:39PM -0600, Edmundo Carmona Antoranz wrote:
> Since 565790d28b1 (sched: Fix balance_callback(), 2020-05-11), there
> is no longer a need to reuse the result value of the call to finish_task_switch()
> inside schedule_tail(), therefore the variable used to hold that value
> (rq) is no longer needed.
> 
> Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>

Thanks!
