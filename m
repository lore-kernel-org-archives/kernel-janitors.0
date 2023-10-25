Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EBAC25B6B
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 21:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjJYVOj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 17:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJYVOi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 17:14:38 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD52512A
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 14:14:35 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D75B42011E;
        Wed, 25 Oct 2023 21:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698268471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DvLSIEyFugabfeMNCq5Clh9avW5u2HN5Oqybq4n6v9c=;
        b=mji2T3q72mWB9YI7CeeOyzHGmXXFifklx2QFDx/ZS3F0wW0trvKKjtfuKNMOPvcsJ9zDjD
        P3rzBUppNOovwU/1Tt6xmqwsX64jXVW9XcKAHaRDJVnJfZNQchLPtbmqaeWxyligqSRqHF
        5IO6duguD3p5oZV/UZcU4mj+eZehXM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698268471;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DvLSIEyFugabfeMNCq5Clh9avW5u2HN5Oqybq4n6v9c=;
        b=a6CuNMuelj9qz4JEecvrt2nR3TITI/FjdCWlSdnNbioFUotsjHq7pidv9j+T0bStJVUQz0
        E/Gavu8DBaSp9iBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 82090138E9;
        Wed, 25 Oct 2023 21:14:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EmSIDjWFOWWRLwAAMHmgww
        (envelope-from <neilb@suse.de>); Wed, 25 Oct 2023 21:14:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc:     "Krzysztof Kozlowski" <krzk@kernel.org>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Dan Carpenter" <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-reply-to: <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>,
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>,
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>,
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>,
 <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
Date:   Thu, 26 Oct 2023 08:14:25 +1100
Message-id: <169826846576.20306.981035382886610843@noble.neil.brown.name>
Authentication-Results: smtp-out2.suse.de;
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

On Wed, 25 Oct 2023, Geert Uytterhoeven wrote:
> Hi Neil,
>=20
> On Tue, Oct 24, 2023 at 11:29=E2=80=AFPM NeilBrown <neilb@suse.de> wrote:
> > On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
> > > On 23/10/2023 20:49, Andrew Morton wrote:
> > > > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> > > >> Yesterday someone on my lists just sent an email looking for kernel
> > > >> tasks.
> > > >
> > > > Well here's a task: write a bot which follows the mailing lists and
> > > > sends people nastygrams if one of their emails is more than 95%(?)
> > > > quoted text.
> > > >
> > > > It's happening significantly more lately.  Possibly because the gmail
> > > > client helpfully hides quoted text.
> > >
> > > I would also point to reviewers and maintainers who give a Rb/Ack tag:
> > > 1. somewhere at the top, without any footer like Best regards, and then
> > > quote entire patch, so I don't know shall I look for more comments after
> > > Rb/Ack?
> > >
> > > 2. quote entire email and then add Rb/Ack, so I need to figure out
> > > whether there was something between the hundreds of lines of text or no=
t.
> >
> > Here we all are, brilliantly talented computer programmers who spend
> > our days making amazing fast digital devices do amazingly clever and
> > subtle things, inventing time-saving tools and processing vast amounts
> > of data without blinking, but for some reason we think the task of
> > skipping over a few thousand lines that all start with '> " is too hard
> > for us and that we should, in stead, complain to some other human to
> > convince them to make our life easier for us.
> >
> > Does anyone else see the irony?
>=20
> Please compare the numbers:
>   1. 1 sender removes irrelevant parts,
>   2. N receivers skip irrelevant parts.

That is one way to look at the numbers.
Another is:

  12 - fix about a dozen MUAs to summaries quotes properly
  12000 - fix an unknownable number of people to quote just exactly the
          amount that their particular audience is going to want

and when it comes to fixing-code versus fixing-people, I know which this
community is better at.

I guess there is also the option

   1 - fix vger.kernel.org to reject postings from people who don't
        think and quote like "us", because we already have too many
        contributor and want to block the heretics

This is really just a form of the "platform problem" which lwn.net has
occasionally written about.  The "problem" is that we treat the platform
(library code or other infrastructure) as fixed and develop ugly hacks
in our own code to work around some shortcoming, rather the going into
the platform and fixing it once for everyone there.

NeilBrown
