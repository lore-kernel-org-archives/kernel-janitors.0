Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B712C07545
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 04:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjJXE6n (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 00:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjJXE6m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 00:58:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5A8A1
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 21:58:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA02C433C9;
        Tue, 24 Oct 2023 04:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1698123520;
        bh=S0th/boKiLGnON1ey4xgB1axQfKN7ZcEoC6cvI93OcE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RnPDW1siSvlCPsUSHk597l638SSjLM2QWIipVZs1SgG57Rarx31q9qNDW1OMd6Q0l
         Mm5IflxyJqx2G7+/sElQ3byl4BYkuxrMhIMpqYpPCpzQhpXO4C3Q555zqxt1IwmbOL
         J23zsElqOKpozrj0K/TdG8UZIelcHpsFkQ47kGF0=
Date:   Mon, 23 Oct 2023 21:58:39 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Konstantin Ryabitsev <mricon@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-Id: <20231023215839.bb712e78fec6a6e0c3e6b62f@linux-foundation.org>
In-Reply-To: <20231023-righteous-peridot-parakeet-1bbda0@meerkat>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
        <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
        <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
        <20231023-righteous-peridot-parakeet-1bbda0@meerkat>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 23 Oct 2023 15:41:48 -0400 Konstantin Ryabitsev <mricon@kernel.org> wrote:

> On Mon, Oct 23, 2023 at 08:55:56AM -1000, Linus Torvalds wrote:
> > > Well here's a task: write a bot which follows the mailing lists and
> > > sends people nastygrams if one of their emails is more than 95%(?)
> > > quoted text.
> > 
> > I think that might be better off as a spam filter rule.
> > 
> > Don't make it some after-the-fact "trawl the lists". Just make it a
> > bounce with a "you quoted too much". Same as the html avoidance.
> 
> I know people aren't being very serious, but automating this away either
> aggressively (reject as spam) or passive-agressively (whine at poster) will
> run into rare but valid corner cases. For example, we have no way of
> distinguishing between "this person quoted too much from previous message" and
> "this person posted a large but relevant quote from docs or another
> conversation," and so we will likely punish/annoy the innocent.

Rejecting a legtimate email would be bad.

So we choose "whine at poster".  If it's a false positive then they'll
somehow survive the experience.   And, most importantly, the mail
will get through.

> It's better to treat this as a mentoring opportunity and send an off-list
> reply with "please trim your quotes" and maybe a link to
> https://people.kernel.org/tglx/notes-about-netiquette

I'm tiring of sending off-list emails.  This task could be automated. 
Which is what I'm suggesting!

> If it helps, I can add a mailing list etiquette page on subspace.kernel.org,
> so it's easier to find.

Great, link to that in the whiney emails.
