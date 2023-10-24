Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D412C25B47
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 22:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344403AbjJXWFW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 18:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbjJXWFV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 18:05:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B55510A
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 15:05:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79CFC433C7;
        Tue, 24 Oct 2023 22:05:18 +0000 (UTC)
Date:   Tue, 24 Oct 2023 18:05:17 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "NeilBrown" <neilb@suse.de>
Cc:     "Krzysztof Kozlowski" <krzk@kernel.org>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Dan Carpenter" <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024180517.421618c0@gandalf.local.home>
In-Reply-To: <169818295461.20306.14022136719064683486@noble.neil.brown.name>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
        <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
        <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
        <169818295461.20306.14022136719064683486@noble.neil.brown.name>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 25 Oct 2023 08:29:14 +1100
"NeilBrown" <neilb@suse.de> wrote:

> Here we all are, brilliantly talented computer programmers who spend
> our days making amazing fast digital devices do amazingly clever and
> subtle things, inventing time-saving tools and processing vast amounts
> of data without blinking, but for some reason we think the task of
> skipping over a few thousand lines that all start with '> " is too hard
> for us and that we should, in stead, complain to some other human to
> convince them to make our life easier for us.
> 
> Does anyone else see the irony?

Did you also know that real-time developers are the most unpredictable?

-- Steve
