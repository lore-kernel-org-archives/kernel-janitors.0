Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BB7C05027
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Feb 2023 04:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjBHEQM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Feb 2023 23:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjBHEQK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Feb 2023 23:16:10 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91266144B2;
        Tue,  7 Feb 2023 20:16:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DC9EFCE1DDE;
        Wed,  8 Feb 2023 04:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D25C433EF;
        Wed,  8 Feb 2023 04:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675829764;
        bh=eoX3GYcWX4C9VvJLTLvu/Qpmo53f+9h9EcRRL+NZcYQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d/J2UDdiq+p9ychHxJ281GgsVq1aFeCyevnZyWqUkuCfDSS4z2vfM+9Rfzp1krATx
         HTk3e6TIUm75jtcOae+GL9VQ20tjbWG4/4K9mLxdh0tWrtIaJ+jWF+HYy2btlqEfIu
         tRGDV9o7kBh6iOHmIDehpvzJhLmueEufGU89s4ytpq+kXwrVBMNWvgOkK+cNPNZ9tr
         rgjxrYK1G6Xud8WhRmRFSEhwcWuchgUKwqXPnaXqeeKAH7sChuPF1NUJCM5ucf1RAQ
         3C5kPkmN4sKU22iFWnE36stkRiaVNrQnMoBtyFgNwZxnBvYRbeEsu2UJt+XCKxglYV
         16/g6HtzBQVNQ==
Date:   Tue, 7 Feb 2023 20:16:03 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Jamal Hadi Salim <jhs@mojatatu.com>,
        Kees Cook <keescook@chromium.org>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <simon.horman@corigine.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: sched: sch: Fix off by one in
 htb_activate_prios()
Message-ID: <20230207201603.41f295ff@kernel.org>
In-Reply-To: <Y+D+KN18FQI2DKLq@kili>
References: <Y+D+KN18FQI2DKLq@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 6 Feb 2023 16:18:32 +0300 Dan Carpenter wrote:
> Subject: [PATCH net-next] net: sched: sch: Fix off by one in  htb_activate_prios()

Thanks for tagging but just to be sure - this is for net, right?
(no need to repost)

> The > needs be >= to prevent an out of bounds access.
> 
> Fixes: de5ca4c3852f ("net: sched: sch: Bounds check priority")
