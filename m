Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48769C43334
	for <kernel-janitors@archiver.kernel.org>; Sat,  4 Jun 2022 14:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbiFDOLg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 4 Jun 2022 10:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiFDOLe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 Jun 2022 10:11:34 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614C642EFE
        for <kernel-janitors@vger.kernel.org>; Sat,  4 Jun 2022 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KxQu+v1iQDqhiYZ0s0RwHvKaTsFsle+qwmakBuqjhTQ=;
  b=PGAwuutQhrfpm3pWXTe6nia/1l3ofdU6OH+WmWJMVkATIednGCS6VI3r
   vPgjNB3Pf1nzSx2yPX+3MMr/Ffnwfd0UE6un4qNYr3+f1VHV/xNdVo8yN
   NIVWb622IGDqrOkSFZ2fNGhH/IW+DNg6bIILj35UVkBzrvg2j/hPmZLRO
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,277,1647298800"; 
   d="scan'208";a="39504863"
Received: from 245.122.68.85.rev.sfr.net (HELO hadrien) ([85.68.122.245])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 16:11:31 +0200
Date:   Sat, 4 Jun 2022 16:11:30 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>,
        cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [cocci] [PATCH] coccinelle: ifaddr: Find address test in more
 complex conditions
In-Reply-To: <2490b8cf-4d9e-1357-6563-097264bcb01a@web.de>
Message-ID: <alpine.DEB.2.22.394.2206041609220.2858@hadrien>
References: <AS8PR03MB7603A9FB9FA6A62438B09A3793DD9@AS8PR03MB7603.eurprd03.prod.outlook.com> <2490b8cf-4d9e-1357-6563-097264bcb01a@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1004717295-1654351891=:2858"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1004717295-1654351891=:2858
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 4 Jun 2022, Markus Elfring wrote:

>
> > The test of an expression's address does not necessarily represent the
> > whole condition, it may only be a part of it.
> > This change aims at detecting an address test in more complex conditions.
> >
> > Signed-off-by: Jérémy Lefaure <jeremy.lefaure@netatmo.com>
> > ---
> >  scripts/coccinelle/misc/ifaddr.cocci | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/misc/ifaddr.cocci
> > index fc92e8fcbfcb..387af44a1256 100644
> > --- a/scripts/coccinelle/misc/ifaddr.cocci
> > +++ b/scripts/coccinelle/misc/ifaddr.cocci
> > @@ -18,8 +18,16 @@ statement S1,S2;
> >  position p;
> >  @@
> >
> > +(
> >  *if@p (&x)
> >   S1 else S2
> > +|
> > +*if@p (&x || ...)
> > + S1 else S2
> > +|
> > +*if@p (&x && ...)
> > + S1 else S2
> > +)
> >
> >  @script:python depends on org@
> >  p << r.p;
>
>
> You would like to extend a check for an if statement.
> I suggest to specify the corresponding SmPL disjunction like the following.
>
> @r@
> expression x;
> statement S1,S2;
> position p;
> @@
>
> *if@p ( \(&x \| &x || ... \| &x && ... \) )
>  S1 else S2
>
>
> How do you think about to use such a SmPL code variant instead?


I don't think that the &x case is needed.  There is an isomorphism for ||
... that makes it cover the case where the || is not there as well.

julia
--8323329-1004717295-1654351891=:2858--
