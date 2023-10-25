Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F00C0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 19:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjJYT2E (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 15:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJYT2D (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 15:28:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E70B137
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 12:27:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE14DC433C8;
        Wed, 25 Oct 2023 19:27:52 +0000 (UTC)
Date:   Wed, 25 Oct 2023 15:27:51 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231025152751.22639f2e@gandalf.local.home>
In-Reply-To: <e4aa47e3-4858-41ba-813f-c17aa5f5ba7d@p183>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
        <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
        <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
        <169818295461.20306.14022136719064683486@noble.neil.brown.name>
        <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
        <e4aa47e3-4858-41ba-813f-c17aa5f5ba7d@p183>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 25 Oct 2023 21:55:16 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> It's MUAs failure. Microsoft "solved" this problem by forcing top
> posting onto everyone, but there is no reason Outlook couldn't scroll
> to the first reply in the middle of email. I use mutt, it doesn't
> scroll to the first reply either.

Outlook is the worse. There may be no reason it can't scroll to the first
reply, but in many cases it just hides it! When I worked at VMware, I would
always inline my replies (and I was forced to use outlook). If I didn't
remove the:

  On Wed, 25 Oct 2023 21:55:16 +0300
  Jane Doe <jane.doe@vmware.com> wrote:

Line at the top, it would show a blank message. I had to manually start
removing that when I received several responses telling me "You sent me a
blank email"!

-- Steve
