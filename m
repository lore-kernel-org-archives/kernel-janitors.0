Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E669FC07545
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 12:36:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbjJXMgx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 08:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbjJXMgw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 08:36:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456F2DC
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 05:36:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E58EC433C8;
        Tue, 24 Oct 2023 12:36:48 +0000 (UTC)
Date:   Tue, 24 Oct 2023 08:36:47 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        NeilBrown <neilb@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024083647.6ca474aa@gandalf.local.home>
In-Reply-To: <20231024072506.GC31956@pendragon.ideasonboard.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
        <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
        <169809755184.20306.3698252725424588550@noble.neil.brown.name>
        <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
        <20231024072506.GC31956@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 24 Oct 2023 10:25:06 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> I've refrained from replying to this thread so far, as it seemed to be a
> caricature of a bikeshedding discussion, but for what it's worth, I
> often find myself in the opposite situation when I'm annoyed that
> someone trimmed too much of the discussion in their replies.

After hitting "page down" 3 or 4 times and seeing only quoted text, I then
stop and just ignore the email. Yes, there's been emails I purposely
ignored because of this that had asked me to respond near the end. Oh well.
Then they ask, "why didn't you respond?" pointing out the email I was to
respond to. And I would reply, "I never saw the request because of too much
quoted text".

> 
> Yes, replying to a 3000-lines patches with a full quote ana d a
> Reviewed-by tag at the very bottom, without any other comment, is
> annoying. On the other hand, trimming everything but the few lines to
> which you reply means that it gets much more annoying to jump in the
> discussion in the middle of a mail thread. There's a difference between
> trimming unrelated parts, and removing related content that happens not
> to be the direct subject of a particular reply.

I just replied to an email yesterday that cut too much off, and I had to
make a note about that, and put things back in.

What's worse, is if you are having a technical debate with someone, and
they trim out everything that might go against their argument, but leave
anything that supports their argument. I've seen that happen quite a bit.

I should write a book called "The art of trimming". ;-)

-- Steve
