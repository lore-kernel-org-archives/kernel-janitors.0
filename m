Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C4DCCA47B
	for <kernel-janitors@archiver.kernel.org>; Fri, 10 Jun 2022 17:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347115AbiFJRnD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 10 Jun 2022 13:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345719AbiFJRnC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 10 Jun 2022 13:43:02 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C842C5521E
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jun 2022 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sx99y017Mbr/u4MrxYOwu0nBx0MKx0T3gawN+zYL69g=;
  b=aBjcDI9Aepxx6mWx3qGWjO8fmTUEa9WyhCtukZ03MYzcuSPyEYT089uU
   tNdLrE1IQUr8nsp0gA7ECKQD5HlAXF1oHd5MnC8aCeoqztRoTEwBm1ZpI
   oKLSF5MOduOuSZAmvlJU0WKiFncCquCfuKtbc0BAb0KAj+knXx9mJnTXx
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,291,1647298800"; 
   d="scan'208";a="16454914"
Received: from 245.122.68.85.rev.sfr.net (HELO hadrien) ([85.68.122.245])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 19:42:59 +0200
Date:   Fri, 10 Jun 2022 19:42:58 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>,
        cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v3] coccinelle: Extend address test from ifaddr to every
 test expression
In-Reply-To: <a8c3479c-c8f1-da57-23fe-657c2f13872b@web.de>
Message-ID: <alpine.DEB.2.22.394.2206101941520.2946@hadrien>
References: <AS8PR03MB76033CF2848D03651D6E189093A69@AS8PR03MB7603.eurprd03.prod.outlook.com> <a8c3479c-c8f1-da57-23fe-657c2f13872b@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1673147012-1654882979=:2946"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1673147012-1654882979=:2946
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 10 Jun 2022, Markus Elfring wrote:

>
> > The test of an expression's address does not necessarily represent the
> > whole condition, it may only be a part of it. Also, an expression's
> > address is likely to be non-zero in every test expression, not only in
> > if statements.
> >
> > This change aims at detecting an address test in more complex conditions
> > for every test expression.
> >
> > Signed-off-by: Jérémy Lefaure <jeremy.lefaure@netatmo.com>
> > ---
> > v2 -> v3: Apply Julia's suggestion to have a more generic solution + adapt commit message and file
> >           name to this new solution.
> > v1 -> v2: Moved disjunction on the condition itself instead of being on the
> >           if statements.
> >
> >  scripts/coccinelle/misc/{ifaddr.cocci => test_addr.cocci} | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >  rename scripts/coccinelle/misc/{ifaddr.cocci => test_addr.cocci} (94%)
> >
> > diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/misc/test_addr.cocci
> > similarity index 94%
> > rename from scripts/coccinelle/misc/ifaddr.cocci
> > rename to scripts/coccinelle/misc/test_addr.cocci
> > index fc92e8fcbfcb..2d0ec86d1701 100644
> > --- a/scripts/coccinelle/misc/ifaddr.cocci
> > +++ b/scripts/coccinelle/misc/test_addr.cocci
> > @@ -14,12 +14,10 @@ virtual context
> >
> >  @r@
> >  expression x;
> > -statement S1,S2;
> >  position p;
> >  @@
> >
> > -*if@p (&x)
> > - S1 else S2
> > +*&x@p || ...
> >
> >  @script:python depends on org@
> >  p << r.p;
>
> A)
> I would like to point out once more that no questionable places were marked
> by the software “Coccinelle 1.1.1” (OCaml 4.14.0) in the following source code.
> https://lore.kernel.org/cocci/da86bc36-36af-7bd7-6bee-861e160ba6a4@web.de/
> https://sympa.inria.fr/sympa/arc/cocci/2022-06/msg00017.html
>
>
> void check(void)
> {
> int s = 1;
> bool t = (&s);
> }
>
>
> Thus I propose to add another case distinction by the means of
> a SmPL disjunction.
>
>
> *\( &x || ... \| &x \)
>
>
> Will any more adjustments become helpful for the handling of optional code
> according to SmPL ellipses?

Did you actually try this?  Because it will match every occurrence of &x.

I don't think that your example represents a real problem.

julia

>
>
>
> B)
> I imagine that generated diff output should be wrapped by a source block
> for the operation mode “org”.
> https://orgmode.org/quickstart.html#blocks
>
>
> Regards,
> Markus
>
--8323329-1673147012-1654882979=:2946--
