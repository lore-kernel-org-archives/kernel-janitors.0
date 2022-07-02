Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8499C43334
	for <kernel-janitors@archiver.kernel.org>; Sat,  2 Jul 2022 10:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbiGBKVs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 2 Jul 2022 06:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiGBKVr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 2 Jul 2022 06:21:47 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02A419020
        for <kernel-janitors@vger.kernel.org>; Sat,  2 Jul 2022 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UsZKiKV/tLyXxBQrmVe1mHzEtBIEY9Vg2bmiTIyH8FY=;
  b=geIwh3hSE/rVQTdKY2/vFCnS+KiOamBoaWJz5yFi8eN0fm1Tq+dPCHRm
   /fHNc4pCkar3ewsHprnFIOr8WxzToJ9ZO/E+gfGOpw4PccQOCk98QpZbk
   jad9DeqhjLCqoBKvrsQIrMYullEtqq78nViachCCLnwkcBF9+d/7s9TGo
   c=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,239,1650924000"; 
   d="scan'208";a="18363920"
Received: from 252.75.68.85.rev.sfr.net (HELO hadrien) ([85.68.75.252])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 12:21:41 +0200
Date:   Sat, 2 Jul 2022 12:21:39 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>,
        cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v5] coccinelle: Extend address test from ifaddr semantic
 patch to test expressions
In-Reply-To: <51130aa6-1a1b-51fb-c4b7-c0dcda1d78d1@web.de>
Message-ID: <alpine.DEB.2.22.394.2207021218550.2882@hadrien>
References: <AS8PR03MB7603EE9F885BA2573CD56CF993BD9@AS8PR03MB7603.eurprd03.prod.outlook.com> <632c81ca-3d53-4ff5-505e-f8da998e47db@web.de> <alpine.DEB.2.22.394.2207011647580.4779@hadrien> <51130aa6-1a1b-51fb-c4b7-c0dcda1d78d1@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-40877702-1656757300=:2882"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-40877702-1656757300=:2882
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

It seems that your resoning is "I wish Coccinelle would work this way, so
I will suggest an "improvement" to a proposed semantic patch that actually
currently has inferior behavior as compared to the original one (but not
mention that at all in the message), and hope that the Coccinelle
developers will think that adding the functionality that you hope for is a
very important priority".  If you want a feature to be added, ask for the
feature.  But please stop confusing the discussion about semantic patches
that are proposed by other people.

julia

On Sat, 2 Jul 2022, Markus Elfring wrote:

>
> > The whole point of the proposed change is to trigger some isomorphisms.
> > I really doubt that any isomorphisms will be triggered with this suggestion.
>
>
> Such expectations are interesting for further clarification, aren't they?
>
> Will any extensions become relevant also for the handling of isomorphisms
> by the Coccinelle software?
>
> Would you like to extend the following SmPL code variant anyhow
> so that more case distinctions will be taken better into account?
>
> @display@
> statement is, es;
> expression x;
> binary operator bo;
> @@
> (
> *if (&x)
>     is
>  else
>     es
> |
> * &x bo NULL
> |
> * NULL bo &x
> |
> * !(&x)
> )
>
>
> Regards,
> Markus
>
--8323329-40877702-1656757300=:2882--
