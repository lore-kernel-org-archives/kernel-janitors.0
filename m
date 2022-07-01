Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55E4C43334
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Jul 2022 20:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbiGAUtp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 1 Jul 2022 16:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbiGAUtk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 Jul 2022 16:49:40 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6D75C9F8
        for <kernel-janitors@vger.kernel.org>; Fri,  1 Jul 2022 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9qe0nxZOvaLCIaz/3pAduL5jl2eURbi0JuFP6K7ELe0=;
  b=dO7uEw7XEMMBA5FaGbr8jQyjYIcnPhrfMfcICRD7rCD4uovaghWfuX11
   Cn+shkSCiWUWj7o//Rw2PsqrKwF5r0TKWIU1U40qtQuYHp7RJaRITVTDn
   L2p4zYrW9eE8H7iVuqY0oxFWjF5kIrmf9q5+bmdZXqVIH9KzqBo+mdj75
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,238,1650924000"; 
   d="scan'208";a="18339685"
Received: from unknown (HELO hadrien) ([206.121.37.170])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 22:49:33 +0200
Date:   Fri, 1 Jul 2022 16:49:26 -0400 (EDT)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>,
        cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v5] coccinelle: Extend address test from ifaddr semantic
 patch to test expressions
In-Reply-To: <632c81ca-3d53-4ff5-505e-f8da998e47db@web.de>
Message-ID: <alpine.DEB.2.22.394.2207011647580.4779@hadrien>
References: <AS8PR03MB7603EE9F885BA2573CD56CF993BD9@AS8PR03MB7603.eurprd03.prod.outlook.com> <632c81ca-3d53-4ff5-505e-f8da998e47db@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1538089997-1656708574=:4779"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1538089997-1656708574=:4779
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 1 Jul 2022, Markus Elfring wrote:

> > This change aims at detecting an address test in more complex conditions
> > and not only in if statements.
> …
> > v4 -> v5: Change semantic patch to match explicit tests to NULL +
> > improve commit message
> …
> >  scripts/coccinelle/misc/{ifaddr.cocci => test_addr.cocci} | 4 +---
> …
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
> > +*\(&x@p == NULL \| &x@p != NULL\)
>
> …
>
>
> Can another SmPL code example help with the clarification of proposed
> implementation details?
>
> @display@
> expression x;
> binary operator bo = { ==, != };
> @@
> * &x bo NULL

Markus, did you actually try this?  Please try things before suggesting
them.  The whole point of the proposed change is to trigger some
isomorphisms.  I really doubt that any isomorphisms will be triggered with
this suggestion.

julia
--8323329-1538089997-1656708574=:4779--
