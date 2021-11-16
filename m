Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB24C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 21:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2669C61B08
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 21:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhKPVyi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Nov 2021 16:54:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:35492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229733AbhKPVyh (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Nov 2021 16:54:37 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 479EE6140A;
        Tue, 16 Nov 2021 21:51:39 +0000 (UTC)
Date:   Tue, 16 Nov 2021 16:51:37 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] sched/rt: Slightly optimize 'init_rt_rq()'
Message-ID: <20211116165137.35d06251@gandalf.local.home>
In-Reply-To: <c9b56712763de62c90b71907323a6b0e5b61b249.1636906450.git.christophe.jaillet@wanadoo.fr>
References: <c9b56712763de62c90b71907323a6b0e5b61b249.1636906450.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 14 Nov 2021 17:16:05 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'MAX_RT_PRIO' is 100. Instead of clearing bits in 'array->bitmap' one at a
> time, use 'bitmap_clear()' which will do the same but much faster

I don't see this being an improvement as long as we need to keep the loop to
do the initialization of the list head.

> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure that this patch is really of any use, but it is the occasion for
> me to spot that there seems to be an off by one in the rt scheduler.
> 
> 'array->bitmap' is MAX_RT_PRIO+1 long. (see [1])
> The last bit seems to be reserved as a sentinel.
> 
> Shouldn't this sentinel, in the code above, be set as:
>   __set_bit(MAX_RT_PRIO + 1, array->bitmap);

No.

The first bit is zero. The last bit in the bitmask is MAX_RT_PRIO. The
bitmask has MAX_RT_PRIO + 1 bits. Your __set_bit() above would be an off by
one error in overwriting the size of the bitmask.

-- Steve
