Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDBFC43334
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Jun 2022 19:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344902AbiFITkK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 9 Jun 2022 15:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344884AbiFITkF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Jun 2022 15:40:05 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3FEE094
        for <kernel-janitors@vger.kernel.org>; Thu,  9 Jun 2022 12:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DUnaXOAraryNHyglUUQl6z9+vSHzSGkUCYfcPazH23o=;
  b=iJ0+fqOUGBZj/bMoRIOB0E74T0qn0vF4m3V/imYCXKH+SlzodeYkAUnF
   cJtgy9KPzG54uFx4z6LsAcLIAw48HWW/TLjLu2B24FQ2+xoCEH2tcEMgj
   p5boyL5X9pNkyR101THM6g73q2aaloXEa0s5SgrF//JG9thy5yGBe97uk
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,287,1647298800"; 
   d="scan'208";a="40295098"
Received: from 245.122.68.85.rev.sfr.net (HELO hadrien) ([85.68.122.245])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 21:39:56 +0200
Date:   Thu, 9 Jun 2022 21:39:56 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>,
        =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>
Subject: Re: coccinelle: ifaddr: Find address test in more complex
 conditions
In-Reply-To: <8f9bbad3-1812-6448-52e6-2570e6368f0d@web.de>
Message-ID: <alpine.DEB.2.22.394.2206092139370.2949@hadrien>
References: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com> <415ca02b-9618-b447-6471-6bcd0e2215e8@web.de> <alpine.DEB.2.22.394.2206072138160.2960@hadrien> <15a253a6-469b-9632-8c7d-983554604451@web.de>
 <alpine.DEB.2.22.394.2206091740520.2380@hadrien> <da86bc36-36af-7bd7-6bee-861e160ba6a4@web.de> <alpine.DEB.2.22.394.2206091824560.2380@hadrien> <8f9bbad3-1812-6448-52e6-2570e6368f0d@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1717427422-1654803596=:2949"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1717427422-1654803596=:2949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 9 Jun 2022, Markus Elfring wrote:

> >>> How about trying an example?
> >> You might interpret the following test result as an expected one according to
> >> your understanding of implementation details.
> >>
> >> Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Coccinelle/Probe> spatch show_address_determination_in_checks-20220609.cocci initialisation_test2-20220609.c
> >> …
> >> @@ -1,8 +1,6 @@
> >>  void check(void)
> >>  {
> >>  int s = 1;
> >> -bool t = &s ? 0 : 1;
> >>  bool u;
> >> -u = &t ? 1 : 0;
> >>  }
>
>
> Can it be that special transformations (which are not represented as a parsing result
> from the application of named isomorphisms) were applied here?
>
>
>
> >> I observed that no questionable places were marked in the following source code.
> >>
> >>
> >> void check(void)
> >> {
> >> int s = 1;
> >> bool t = (&s);
> >> }
> >>
> >>
> >> Will this test case trigger further development considerations?
> > It seems to be doing what it should.
>
> I would expect that the usage of the address-of operator within extra parentheses
> should also be marked for reconsideration of such source code.

It's not a test expression.  The bool type is not relevant.

julia
--8323329-1717427422-1654803596=:2949--
