Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65480EB64DC
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jun 2023 20:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjFYU5M (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjFYU5K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Jun 2023 16:57:10 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6633126;
        Sun, 25 Jun 2023 13:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PcY9A9k+lzgcjaXAaUSzbrsIGgZvXGyJoIo17mx849A=;
  b=jE9z5MBV4RruP5dTjzHAhdBF5Mf/Wg7a5tyjr4DzuMOn9+6+VMrVd+YQ
   IDcaY+NHhlCOc2Zn6jW7+Z6fV2Z3/DfLjcR1qD8EPGfo9WEpZ184cdGSB
   B4vFj4o5XhFa0JFXZA8a1IYlk7IJ0GX6Y7Q+sqPZK4fUnImnftWcz8r1z
   0=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,158,1684792800"; 
   d="scan'208";a="114549485"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 22:57:06 +0200
Date:   Sun, 25 Jun 2023 22:57:06 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     Jakub Kicinski <kuba@kernel.org>,
        Veerasenareddy Burru <vburru@marvell.com>,
        keescook@chromium.org, kernel-janitors@vger.kernel.org,
        Abhijit Ayarekar <aayarekar@marvell.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH 02/26] octeon_ep: use array_size
In-Reply-To: <36d9998f-e8b1-58cb-9b0a-97273b5eb91b@wanadoo.fr>
Message-ID: <alpine.DEB.2.22.394.2306252256520.3022@hadrien>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr> <20230623211457.102544-3-Julia.Lawall@inria.fr> <20230624152826.10e3789b@kernel.org> <beb409e3-0c13-b817-dfa3-15792a341130@wanadoo.fr> <alpine.DEB.2.22.394.2306252221310.3022@hadrien>
 <36d9998f-e8b1-58cb-9b0a-97273b5eb91b@wanadoo.fr>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1352714705-1687726626=:3022"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1352714705-1687726626=:3022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 25 Jun 2023, Christophe JAILLET wrote:

> Le 25/06/2023 à 22:25, Julia Lawall a écrit :
> >
> >
> > On Sun, 25 Jun 2023, Christophe JAILLET wrote:
> >
> > > Le 25/06/2023 à 00:28, Jakub Kicinski a écrit :
> > > > On Fri, 23 Jun 2023 23:14:33 +0200 Julia Lawall wrote:
> > > > > -	oq->buff_info = vzalloc(oq->max_count *
> > > > > OCTEP_OQ_RECVBUF_SIZE);
> > > > > +	oq->buff_info = vzalloc(array_size(oq->max_count,
> > > > > OCTEP_OQ_RECVBUF_SIZE));
> > > >
> > > > vcalloc seems to exist, is there a reason array_size() is preferred?
> > >
> > > Hi,
> > >
> > > just for your information, I've just sent [1].
> > >
> > > CJ
> > >
> > > [1]:
> > > https://lore.kernel.org/all/3484e46180dd2cf05d993ff1a78b481bc2ad1f71.1687723931.git.christophe.jaillet@wanadoo.fr/
> >
> > For some reason, I have only received Christophe's mail, not Jakub's...
> >
> > In any case, thanks for pointing out the existence of these functions.  I
> > just redid what Kees did in 2018, when I guess these functions didn't
> > exist.  I will look more carefully to see what functions are now available
> > and resend the whole thing.
>
> Hi,
>
> should you want to go 1 step further and simplify some code:
>
> git grep v[mz]alloc.*array_size\( | wc -l
> 174

Yes, thanks for the suggestion.

julia

>
> CJ
>
> >
> > Thanks!
> >
> > julia
>
>
--8323329-1352714705-1687726626=:3022--
