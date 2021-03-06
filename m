Return-Path: <SRS0=552U=IE=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142B5C433DB
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 21:32:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF1B2650BC
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 21:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCFVbn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 6 Mar 2021 16:31:43 -0500
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:12386
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229642AbhCFVb1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Mar 2021 16:31:27 -0500
X-IronPort-AV: E=Sophos;i="5.81,229,1610406000"; 
   d="scan'208";a="374982814"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2021 22:31:25 +0100
Date:   Sat, 6 Mar 2021 22:31:24 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
cc:     kernel-janitors@vger.kernel.org, peterz@infradead.org
Subject: Re: [PATCH] kernel: sched: remove unnecessary variable from
 schedule_tail()
In-Reply-To: <CAOc6etawvzRa2KuEqb8GN+QAJ74KfzDOWT+bdLOiRsD2fkzG2Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2103062231000.2976@hadrien>
References: <20210306210739.1370486-1-eantoranz@gmail.com> <CAOc6etawvzRa2KuEqb8GN+QAJ74KfzDOWT+bdLOiRsD2fkzG2Q@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Sat, 6 Mar 2021, Edmundo Carmona Antoranz wrote:

> On Sat, Mar 6, 2021 at 3:08 PM Edmundo Carmona Antoranz
> <eantoranz@gmail.com> wrote:
>
> While looking for ways to find compilation messages (still learning,
> if you have any good resources for a kernel newbie to look at / learn
> from, please, let me know) I found this piece of low hanging fruit
> that was begging for a kind soul to pick it up. Given that this is my
> first baby intended for linux, let's see how far it is able to fly (I
> wouldn't be surprised if it falls directly to the ground). I hope I
> didn't mess up too badly in terms of formatting and that I am
> _hopefully_ following "the procedure".. and if that's not the case,
> please let me know where I can read about it.

I would be better to start with drivers staging than with the scheduler.

julia
