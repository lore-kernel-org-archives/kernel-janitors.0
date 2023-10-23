Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB2CC25B45
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 21:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjJWVoV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 17:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjJWVoV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 17:44:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978C8A1
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 14:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698097459; x=1729633459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IpsZUMND3aVGdnhdwRzDu2CiHjWEmDqX879e2K1Z/Hk=;
  b=Gkxx37qXzFpv94h4azxBesonJF9urPHwZ7UMZMzyiTUPFWbB8kTMNgSe
   SCWI6WvdlfuPxFALSOFiWQlqzn79E/qYNnYMK4DmSgfW76Aek2nT9yjyW
   SU76SjrfZdO+xs49xwLiOFIosQGSxCViFnuXVAxIxqdYTmZNE4R1Ii5bl
   K5eKHgVBtXYV7JerDx4lqqVqV6h3ZfQJuPgvtWGaABNtSfpnMG+GgaatD
   WEhYeYaJ9qovoqfhCOM6pyNdrS0FlomDS6w3UxKdPMx908Sa/2mh9bEWY
   xC4LG1Wm95uCrgvAC7RYb6F+5VYDCiJ6NoMloL+FhhkVOYNFr9nUAB+Us
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="418060498"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="418060498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="5948523"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:43:03 -0700
Date:   Mon, 23 Oct 2023 14:44:15 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <ZTbpLw4isOaPmiMC@agluck-desk3>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
 <20231023152918.4eb91ee3@gandalf.local.home>
 <2ab947dd-7281-432e-9292-54182a31a81c@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ab947dd-7281-432e-9292-54182a31a81c@paulmck-laptop>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2023 at 02:31:11PM -0700, Paul E. McKenney wrote:
> On Mon, Oct 23, 2023 at 03:29:18PM -0400, Steven Rostedt wrote:
> > On Mon, 23 Oct 2023 08:55:56 -1000
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > 
> > > On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
> > > >
> > > > Well here's a task: write a bot which follows the mailing lists and
> > > > sends people nastygrams if one of their emails is more than 95%(?)
> > > > quoted text.  
> > > 
> > > I think that might be better off as a spam filter rule.
> > > 
> > > Don't make it some after-the-fact "trawl the lists". Just make it a
> > > bounce with a "you quoted too much". Same as the html avoidance.
> > > 
> > > Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
> > > kind of reply, but if it's more than 50 lines of quoting, trigger a
> > > "at least equal parts new message".
> > > 
> > > I'm sure Konstantin has nothing better to do...
> > > 
> > >                 Linus
> > 
> > Paul,
> > 
> > Just in case you are wondering why one day one of your replies gets
> > rejected ;-)
> 
> You never know.  Those who would have otherwise received my replies
> might be very happy with this outcome.  ;-)
> 
> 							Thanx, Paul

Hmm.

Thirty-two lines of quoted message.

Only two lines of response.

[Not including signature]

You are skating close to the edge of a 95% quote rule filter unless
it counted the signature.

But
this
might
also
cause
people
to
go
to
silly
lengths
to
avoid
having
their
message
cancelled!

-Tony
