Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E09CCA482
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Jun 2022 00:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350957AbiFHAXx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Jun 2022 20:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387487AbiFGWu2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 18:50:28 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047092B07FC
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 12:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=w45kGLjbQOGG2zPrLEkD8qtGnwe17q7OpjpvDM2QpZ4=;
  b=o6WdTjmAqWLkUCCTZApMfvNdVGUKE1HC7kytDE3mM71T406dNXk2OxED
   uhUbWvhJbVZZaqh8/MvZLKrNZzR3tpSO4Wupm1Ly3G6l1E5S7Dbmlze5J
   kOhgp63Rqp/U59fc+Y0uTKT+e/pvTsJK5pBiEihgyAEzkfuke4/ijqgS9
   4=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,284,1647298800"; 
   d="scan'208";a="39898193"
Received: from 245.122.68.85.rev.sfr.net (HELO hadrien) ([85.68.122.245])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 21:39:46 +0200
Date:   Tue, 7 Jun 2022 21:39:46 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>,
        cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v2] coccinelle: ifaddr: Find address test in more complex
 conditions
In-Reply-To: <415ca02b-9618-b447-6471-6bcd0e2215e8@web.de>
Message-ID: <alpine.DEB.2.22.394.2206072138160.2960@hadrien>
References: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com> <415ca02b-9618-b447-6471-6bcd0e2215e8@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2051075284-1654630786=:2960"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2051075284-1654630786=:2960
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 7 Jun 2022, Markus Elfring wrote:

>
> > The test of an expression's address does not necessarily represent the
> > whole condition, it may only be a part of it.
> > This change aims at detecting an address test in more complex conditions.
> >
> > Signed-off-by: Jérémy Lefaure <jeremy.lefaure@netatmo.com>
> > ---
> > v1 -> v2: Moved disjunction on the condition itself instead of being on the if statements
> >
> >  scripts/coccinelle/misc/ifaddr.cocci | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/misc/ifaddr.cocci
> > index fc92e8fcbfcb..14dbf3131a3f 100644
> > --- a/scripts/coccinelle/misc/ifaddr.cocci
> > +++ b/scripts/coccinelle/misc/ifaddr.cocci
> > @@ -18,7 +18,7 @@ statement S1,S2;
> >  position p;
> >  @@
> >
> > -*if@p (&x)
> > +*if@p ( \(&x || ... \| &x && ... \) )
> >   S1 else S2
> >
> >  @script:python depends on org@
>
>
> Would you ever dare to adjust the specification another bit for such
> a source code search approach according to the difference in the selection
> of the operators “||” (disjunction) and “&&” (conjunction)?

I don't really understand the above, but it made me realize that actually
the following is sufficient:

@@
expression x;
@@

*&x || ...

This forces &x to appear as a test expression.  There can be 0 or more
occurrences of ||, so eg &x && y is also matched.

julia
--8323329-2051075284-1654630786=:2960--
