Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005E0C25B45
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 21:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbjJWVbP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 17:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjJWVbO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 17:31:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C1ABD
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 14:31:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21135C433C7;
        Mon, 23 Oct 2023 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698096672;
        bh=8n1+OIDJkfWAS4MDWXQZ/s8K/YnfY7XY7omeucEdgDI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YwLGSIYniMJYemvp+NSS99han6bczuMUUd29EFYc3wwkYI4jaHiUdgkcrVAB4ZVdU
         3TSrgnXhbLGq5Sbn2OlYYhpNoJcAkiiH7I+6c0rG116FaiUNQffnFxoeR8f4PetstZ
         53ceLZe92zO6nGJb1BCaVxRgIaLaMePOY3DuDPiA/po7oI1BeRz9pnAtKn57JiH+mP
         hy3ZE+5dshNpCnnHMo7/qLiKrg7N8k5SF1SFkw/06hGYMw5mBCwIdt4x0msbT/KRqL
         962cZuFwJmwF+7u9kKDeWcSrwu/5rO07LMn4B41v5+T7uQJ9ZAelzvWPs8czAQfR2a
         jPrB8Nfc6EfyQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 9D764CE059F; Mon, 23 Oct 2023 14:31:11 -0700 (PDT)
Date:   Mon, 23 Oct 2023 14:31:11 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <2ab947dd-7281-432e-9292-54182a31a81c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
 <20231023152918.4eb91ee3@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023152918.4eb91ee3@gandalf.local.home>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2023 at 03:29:18PM -0400, Steven Rostedt wrote:
> On Mon, 23 Oct 2023 08:55:56 -1000
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > Well here's a task: write a bot which follows the mailing lists and
> > > sends people nastygrams if one of their emails is more than 95%(?)
> > > quoted text.  
> > 
> > I think that might be better off as a spam filter rule.
> > 
> > Don't make it some after-the-fact "trawl the lists". Just make it a
> > bounce with a "you quoted too much". Same as the html avoidance.
> > 
> > Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
> > kind of reply, but if it's more than 50 lines of quoting, trigger a
> > "at least equal parts new message".
> > 
> > I'm sure Konstantin has nothing better to do...
> > 
> >                 Linus
> 
> Paul,
> 
> Just in case you are wondering why one day one of your replies gets
> rejected ;-)

You never know.  Those who would have otherwise received my replies
might be very happy with this outcome.  ;-)

							Thanx, Paul
