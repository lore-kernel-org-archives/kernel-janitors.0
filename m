Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00626E92FCA
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Oct 2023 04:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjJFEHn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Oct 2023 00:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjJFEHl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 00:07:41 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA725E4
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 21:07:38 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40666aa674fso15485015e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 21:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696565257; x=1697170057; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfmJdBPydu0BZJi6LE/RTqA11QEqZm0bT62TNJwMfLU=;
        b=rr70CsHtSYjU0JhuGFjffW8UqdVt7tisVHvQjKqRBq0ngNi2560ND07JBb+qwjAHuZ
         FTyXL1EfPNruFYt1199hZkF3Pc42WhFfSp8pFKkrg5ZauTM2rfd/H++JJ3JQnXfwM+85
         qfwUlLdsK96KiJn86HWiKTihhbNswz6n9ecgKERdqi/5UyFq8+6VigFSl+ajV1Alm2Zb
         ndm76/3PMRJc9uosUdccTwV4XMJw4hEhnYr9TkNoR04ixKiektOVp30QIxprJN7/7ojQ
         gFyqEPNYJCe1DVexm+scSgh7JUQZaQM2FeX9IKBF12mkqO82yEX0RHTWhBJzmYWvHgzK
         nPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696565257; x=1697170057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfmJdBPydu0BZJi6LE/RTqA11QEqZm0bT62TNJwMfLU=;
        b=lZIxo0VE2Ru058vijLOlYcMpBGViIWhsYKcjOm+x53psOkNyIjfYtTp23KA5w+hbtE
         zsdl+DkGCmu5eZ8NxHeBTOhSnYlUYQZlvRm05dukR4JfHVwT/5KvdegOIyhqEpnR+TMS
         LqveoiFZQkzR1HsLKc0PdDZEbnQg+83ZENIb/CNaCn1b9FzfTHX831UiCAvdj6VCWQa0
         v8lJ++bCdXeMjhy9hsqGBikbitcGcXw6D5ajb8hTDoY8W0CV8NTdk5tSSj7p//o/OfpD
         qqKd32YSO3axzJHbXViUuIDLk+B4deq0C8mbbLO091wEjQYlIMSiRZTH56e1tXPR1bWJ
         B5uA==
X-Gm-Message-State: AOJu0YzHsMGSl6gazkJARv9wGXtLNBH92ltWKqN1ENCnp47SvozeFROE
        s75bAEy6kAbvQ23vBVyqFPQd3g==
X-Google-Smtp-Source: AGHT+IFjeXrQUs7p/saYuWWFYACMu2/fI8dWiPv6wIANSyumueY5p9GrWNrq8I5Iy/tR2cn2JV/ZzQ==
X-Received: by 2002:a05:600c:2117:b0:402:f55c:faee with SMTP id u23-20020a05600c211700b00402f55cfaeemr5918406wml.26.1696565257030;
        Thu, 05 Oct 2023 21:07:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s26-20020a7bc39a000000b004064cd71aa8sm2784785wmj.34.2023.10.05.21.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 21:07:36 -0700 (PDT)
Date:   Fri, 6 Oct 2023 07:07:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alexander Aring <aahringo@redhat.com>
Cc:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Angus Chen <angus.chen@jaguarmicro.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Joel Granados <joel.granados@gmail.com>,
        linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] 6lowpan: fix double free in lowpan_frag_rcv()
Message-ID: <e438fc67-665a-48b6-b414-0641821e0bf3@kadam.mountain>
References: <3c91e145-5cd5-4d9d-9590-3b74b811436a@moroto.mountain>
 <CAK-6q+iG=jX0qudCcszP64HxCwYSpmx7=Fh+Kf3qVft7Z8hBfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK-6q+iG=jX0qudCcszP64HxCwYSpmx7=Fh+Kf3qVft7Z8hBfg@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 05, 2023 at 06:10:13PM -0400, Alexander Aring wrote:
> Hi,
> 
> On Wed, Oct 4, 2023 at 5:22 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The skb() is freed by the caller in lowpan_invoke_rx_handlers() so this
> > free is a double free.
> >
> 
> lowpan_frag_rcv() does not call lowpan_invoke_rx_handlers(), it calls
> lowpan_invoke_frag_rx_handlers(), or is there something I overlooked
> here?

Actually now that I look at it more closely this isn't a bug.

The way I was looking at it was that it was the other way around.
lowpan_invoke_rx_handlers() is the caller.  But actually this returns
-1.  lowpan_invoke_rx_handlers() will pass the freed skb to
lowpan_rx_handlers_result() but the -1 gets translated to RX_DROP in
lowpan_rx_h_frag() then it just returns NET_RX_DROP.  It's a no-op and
not a double free.

Sorry!

regards,
dan carpenter

