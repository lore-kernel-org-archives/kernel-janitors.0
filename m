Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21A2C0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 18:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbjJYSKg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 14:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233980AbjJYSKf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 14:10:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704F693
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 11:10:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADAFC433C9;
        Wed, 25 Oct 2023 18:10:31 +0000 (UTC)
Date:   Wed, 25 Oct 2023 14:10:30 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Jani Nikula <jani.nikula@intel.com>, NeilBrown <neilb@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231025141030.63acb006@gandalf.local.home>
In-Reply-To: <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
        <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
        <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
        <169818295461.20306.14022136719064683486@noble.neil.brown.name>
        <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
        <87fs1y8xkl.fsf@intel.com>
        <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 25 Oct 2023 14:07:02 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> Because some MUAs don't have it.  Others are a bit aggressive, meaning
> you have to turn it off anyway if you want to see what's in more than a
> couple of lines of a quote (it only takes me a couple of emails to get
> incredibly annoyed with the way gmail does it, for instance, since it
> never seems to leave enough useful context).

I think this is the key issue. We only want the context of an email that is
being responded to present, and the rest trimmed. Automated trimming or
collapsing doesn't do this well.

Maybe we can make AI do this for us.. hmm

-- Steve
