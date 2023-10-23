Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74F8C25B45
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 19:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjJWT3Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 15:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjJWT3Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 15:29:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C953A9
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:29:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC3CC433C8;
        Mon, 23 Oct 2023 19:29:20 +0000 (UTC)
Date:   Mon, 23 Oct 2023 15:29:18 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231023152918.4eb91ee3@gandalf.local.home>
In-Reply-To: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
        <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
        <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 23 Oct 2023 08:55:56 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > Well here's a task: write a bot which follows the mailing lists and
> > sends people nastygrams if one of their emails is more than 95%(?)
> > quoted text.  
> 
> I think that might be better off as a spam filter rule.
> 
> Don't make it some after-the-fact "trawl the lists". Just make it a
> bounce with a "you quoted too much". Same as the html avoidance.
> 
> Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
> kind of reply, but if it's more than 50 lines of quoting, trigger a
> "at least equal parts new message".
> 
> I'm sure Konstantin has nothing better to do...
> 
>                 Linus

Paul,

Just in case you are wondering why one day one of your replies gets
rejected ;-)

-- Steve
