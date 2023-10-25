Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F42C25B6B
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 21:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjJYViq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 17:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjJYVip (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 17:38:45 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7166A132
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 14:38:43 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id BA861219BD;
        Wed, 25 Oct 2023 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698269921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VGyFxFel+gqzSE5l+ZOVvzu3LDR9TOju1S3dGmL+0l4=;
        b=oZZBP9+KNe+AioQLYdgXSRErqGWIK0lEzZL0VdHqjgVSDzT81F5mI58fiUQZyNPJm8DhmB
        dx7QwObbeXThRQeMpEnMKkcBqwUME++fQ5bWW2XmIweIsJhdiY6F8V72AbwFGu5FouK4Ah
        fRL63DXB/LskyGsu1mYuwGd9Cdxe2YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698269921;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VGyFxFel+gqzSE5l+ZOVvzu3LDR9TOju1S3dGmL+0l4=;
        b=jk4O7qAB1c0sYb6xEYyw+lVwI30xPfKyu1z5OPYG1CkCrg7DwWSewI1293zKRG+Mciu2DV
        vnC5UbyZmhGZl4Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64C3E138E9;
        Wed, 25 Oct 2023 21:38:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Aq1lB9+KOWVDNwAAMHmgww
        (envelope-from <neilb@suse.de>); Wed, 25 Oct 2023 21:38:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "James Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     "Krzysztof Kozlowski" <krzk@kernel.org>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Dan Carpenter" <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-reply-to: <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>,
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>,
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>,
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>,
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
Date:   Thu, 26 Oct 2023 08:38:36 +1100
Message-id: <169826991635.20306.16184430997322997935@noble.neil.brown.name>
Authentication-Results: smtp-out1.suse.de;
        none
X-Spamd-Result: default: False [-11.10 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         MIME_GOOD(-0.10)[text/plain];
         REPLY(-4.00)[];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         RCPT_COUNT_SEVEN(0.00)[7];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[];
         BAYES_HAM(-3.00)[100.00%]
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 25 Oct 2023, James Bottomley wrote:
> On Wed, 2023-10-25 at 08:29 +1100, NeilBrown wrote:
> > On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
> > > On 23/10/2023 20:49, Andrew Morton wrote:
> > > > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter
> > > > <dan.carpenter@linaro.org> wrote:
> > > > 
> > > > > Yesterday someone on my lists just sent an email looking for
> > > > > kernel
> > > > > tasks. 
> > > > 
> > > > Well here's a task: write a bot which follows the mailing lists
> > > > and
> > > > sends people nastygrams if one of their emails is more than
> > > > 95%(?)
> > > > quoted text.
> > > > 
> > > > It's happening significantly more lately.  Possibly because the
> > > > gmail
> > > > client helpfully hides quoted text.
> > > 
> > > I would also point to reviewers and maintainers who give a Rb/Ack
> > > tag:
> > > 1. somewhere at the top, without any footer like Best regards, and
> > > then
> > > quote entire patch, so I don't know shall I look for more comments
> > > after
> > > Rb/Ack?
> > > 
> > > 2. quote entire email and then add Rb/Ack, so I need to figure out
> > > whether there was something between the hundreds of lines of text
> > > or not.
> > 
> > Here we all are, brilliantly talented computer programmers who spend
> > our days making amazing fast digital devices do amazingly clever and
> > subtle things, inventing time-saving tools and processing vast
> > amounts of data without blinking, but for some reason we think the
> > task of skipping over a few thousand lines that all start with '> "
> > is too hard for us and that we should, in stead, complain to some
> > other human to convince them to make our life easier for us.
> > 
> > Does anyone else see the irony?
> 
> So if I'm a brilliantly talented driver, it's OK for other people to
> drive on the wrong side of the road because I should be able to avoid
> them?

No, we are programmers, not MUAs or drivers.  We program the car to
predict and avoid all other road users, no matter where they are.
That project might take a bit longer than fixing MUAs though.

> 
> The point being there are some situations where observing global
> etiquette is way more helpful than an individual solution, however
> talented the individual.

True, and we all use (some version of) English for exactly that reason.
But imagine how it would be if we could all have high quality
translation code built into our MUAs so that anyone in the world could
email us in their own language, and we could each read in our own
language.  That would be awesome.
It would be only slightly less awesome if we could all post with
whichever quoting style works for us, and we could all read emails
seeing whichever quoting style works for us.
Unfortunately we cannot yet translate top-posting to post-posting, but
we *can* translate verbose quoting to terse quoting.

NeilBrown
