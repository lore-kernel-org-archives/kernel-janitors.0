Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF38C00A8F
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 13:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbjJXNMD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 09:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbjJXNMD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 09:12:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD11BC1
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 06:11:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E16EDAE;
        Tue, 24 Oct 2023 15:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698153105;
        bh=8XyOFCztz3BA0tflzlF6Q1UAvMVce2aIyWV56YVWzF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UN20CfxT1OMHDCs+Kf4DkDt/EngueWoRukBX4R1olCxRVHv7/sfVPTAQJNsnvT6uc
         Nu8tqF1IIHipev6wwWGufhsGqzR6taLPRBvRVzhoknvyeuVFpjBb2eOAUxsaK/+CWb
         0kS1av+cf5hMM0v4FxqzH9ru+DPnCvgWp4SR3dwU=
Date:   Tue, 24 Oct 2023 16:12:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        NeilBrown <neilb@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024131203.GA29036@pendragon.ideasonboard.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <169809755184.20306.3698252725424588550@noble.neil.brown.name>
 <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
 <20231024072506.GC31956@pendragon.ideasonboard.com>
 <20231024083647.6ca474aa@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231024083647.6ca474aa@gandalf.local.home>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2023 at 08:36:47AM -0400, Steven Rostedt wrote:
> On Tue, 24 Oct 2023 10:25:06 +0300 Laurent Pinchart wrote:
> 
> > I've refrained from replying to this thread so far, as it seemed to be a
> > caricature of a bikeshedding discussion, but for what it's worth, I
> > often find myself in the opposite situation when I'm annoyed that
> > someone trimmed too much of the discussion in their replies.
> 
> After hitting "page down" 3 or 4 times and seeing only quoted text, I then
> stop and just ignore the email. Yes, there's been emails I purposely
> ignored because of this that had asked me to respond near the end. Oh well.
> Then they ask, "why didn't you respond?" pointing out the email I was to
> respond to. And I would reply, "I never saw the request because of too much
> quoted text".
> 
> > Yes, replying to a 3000-lines patches with a full quote ana d a
> > Reviewed-by tag at the very bottom, without any other comment, is
> > annoying. On the other hand, trimming everything but the few lines to
> > which you reply means that it gets much more annoying to jump in the
> > discussion in the middle of a mail thread. There's a difference between
> > trimming unrelated parts, and removing related content that happens not
> > to be the direct subject of a particular reply.
> 
> I just replied to an email yesterday that cut too much off, and I had to
> make a note about that, and put things back in.
> 
> What's worse, is if you are having a technical debate with someone, and
> they trim out everything that might go against their argument, but leave
> anything that supports their argument. I've seen that happen quite a bit.
> 
> I should write a book called "The art of trimming". ;-)

Maybe a good path forward would be to start by flagging extreme cases
only, without being too pedantic ? That assumes we can agree what an
extreme case is.

One thing I found helpful in replies is to add tags just after the
commit message (where the tag will appear when it gets applied), or
after the last comment if I need to comment on something specific. The
recipient will know that they don't need to scroll down after the tag.

-- 
Regards,

Laurent Pinchart
