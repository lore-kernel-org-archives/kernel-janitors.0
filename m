Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8979C25B6B
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 18:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbjJYSI1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 14:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbjJYSIM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 14:08:12 -0400
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6672530DE
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 11:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1698257225;
        bh=htJUqS8npibsh8tYnChA9JGl/FAKweYbHWEHf7fhlNA=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=BAs0buXD6niGIUBTcvnjviKHNg+lhYsCtEuQwQ7agchXOTPCbgUHoKTU7bTwpXQ93
         AbqXC2L1r7K/I8BNzoPjAT7H8ij3A283DygswnF1XeRqdYpYu1QY5waKlUCiHiwDTl
         d2+zICaW1KqRvlU9jAVOe2MjXsdlfLp2ulfX8cYk=
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5417A1281C07;
        Wed, 25 Oct 2023 14:07:05 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id lzz80QL84BLY; Wed, 25 Oct 2023 14:07:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1698257225;
        bh=htJUqS8npibsh8tYnChA9JGl/FAKweYbHWEHf7fhlNA=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=BAs0buXD6niGIUBTcvnjviKHNg+lhYsCtEuQwQ7agchXOTPCbgUHoKTU7bTwpXQ93
         AbqXC2L1r7K/I8BNzoPjAT7H8ij3A283DygswnF1XeRqdYpYu1QY5waKlUCiHiwDTl
         d2+zICaW1KqRvlU9jAVOe2MjXsdlfLp2ulfX8cYk=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 61A5B128105C;
        Wed, 25 Oct 2023 14:07:04 -0400 (EDT)
Message-ID: <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>
Subject: Re: KTODO automated TODO lists
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Jani Nikula <jani.nikula@intel.com>, NeilBrown <neilb@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Date:   Wed, 25 Oct 2023 14:07:02 -0400
In-Reply-To: <87fs1y8xkl.fsf@intel.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
         <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
         <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
         <169818295461.20306.14022136719064683486@noble.neil.brown.name>
         <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
         <87fs1y8xkl.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 2023-10-25 at 19:40 +0300, Jani Nikula wrote:
> On Wed, 25 Oct 2023, James Bottomley
> <James.Bottomley@HansenPartnership.com> wrote:
> > On Wed, 2023-10-25 at 08:29 +1100, NeilBrown wrote:
> > > Here we all are, brilliantly talented computer programmers who
> > > spend our days making amazing fast digital devices do amazingly
> > > clever and subtle things, inventing time-saving tools and
> > > processing vast amounts of data without blinking, but for some
> > > reason we think the task of skipping over a few thousand lines
> > > that all start with '>"s too hard for us and that we should, in
> > > stead, complain to some other human to convince them to make our
> > > life easier for us.
> > > 
> > > Does anyone else see the irony?
> > 
> > So if I'm a brilliantly talented driver, it's OK for other people
> > to drive on the wrong side of the road because I should be able to
> > avoid them?
> 
> Nah, we're all brilliant car manufacturers that could have our cars
> deal with the situation. ;)
> 
> The notmuch emacs interface has collapsed citations since at least
> 2010. I think Neil's point is, if we're all using open source MUAs,
> why don't we scratch that particular itch and move on, instead of
> getting frustrated by it year after year?

Because some MUAs don't have it.  Others are a bit aggressive, meaning
you have to turn it off anyway if you want to see what's in more than a
couple of lines of a quote (it only takes me a couple of emails to get
incredibly annoyed with the way gmail does it, for instance, since it
never seems to leave enough useful context).

James

