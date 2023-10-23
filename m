Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F402AC25B46
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 19:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjJWTlx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 15:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjJWTlw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 15:41:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EA8BE
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:41:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4579AC433C8;
        Mon, 23 Oct 2023 19:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698090109;
        bh=OlH4XjprJoV3SDdpbTy99xlKsXNxkPszOjj1otladfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PW2DULXfgacuAqKWGrEKpODTf8CprrVatOu13kJyFkzMUoARbu9A+y6CWacngLpvc
         wfi2GT/VnVtRyQQ0U93UmFJNa5jZ/RYd6cbrZCHpZ9IA3vs4tS20U7/K+zyGhwSxAz
         4KMP3EbRT++3But83IqEq4f1wsIeh5BjJUCEZd8FlPhXcc9OtDkKze41Zl9j/2RFK+
         W5MRRq4L3+1GF+GnOBk5thIyOM0hIWTZeMqKcsf+la92A1+cvMberTtMk1CDy21rRx
         8lAvd/qZ0LVmKHgYYl3Nz/mRU/+cgQvsIYQOXhiT+K6v3wM24eDhpZBJ4F453cutW0
         FWWf8hL1Dalfg==
Date:   Mon, 23 Oct 2023 15:41:48 -0400
From:   Konstantin Ryabitsev <mricon@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231023-righteous-peridot-parakeet-1bbda0@meerkat>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2023 at 08:55:56AM -1000, Linus Torvalds wrote:
> > Well here's a task: write a bot which follows the mailing lists and
> > sends people nastygrams if one of their emails is more than 95%(?)
> > quoted text.
> 
> I think that might be better off as a spam filter rule.
> 
> Don't make it some after-the-fact "trawl the lists". Just make it a
> bounce with a "you quoted too much". Same as the html avoidance.

I know people aren't being very serious, but automating this away either
aggressively (reject as spam) or passive-agressively (whine at poster) will
run into rare but valid corner cases. For example, we have no way of
distinguishing between "this person quoted too much from previous message" and
"this person posted a large but relevant quote from docs or another
conversation," and so we will likely punish/annoy the innocent.

It's better to treat this as a mentoring opportunity and send an off-list
reply with "please trim your quotes" and maybe a link to
https://people.kernel.org/tglx/notes-about-netiquette

If it helps, I can add a mailing list etiquette page on subspace.kernel.org,
so it's easier to find.

-K
