Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EC3C43334
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Jun 2022 16:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239449AbiFIQZR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 9 Jun 2022 12:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234159AbiFIQZP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Jun 2022 12:25:15 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DF51A390
        for <kernel-janitors@vger.kernel.org>; Thu,  9 Jun 2022 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mtDNTfXynxhBn5BTT4RJf990CKJKzkOQBOlwzwRnowo=;
  b=MdzDJtTnfbskJeIsfZXf251yerojdhB8IaICOOqFRsHehW8RJPxBzaCo
   O5F18Tg/4G5E86PODQyl3UXJ20LdMoEVUJO5tKi/uyyP1rgMd7XpbW6Ld
   CBMlAU4ih2Vyn/tpv/yBGZzJSEwqiNr984tKhpTDx6QYEakt97ureQuig
   c=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,287,1647298800"; 
   d="scan'208";a="16352371"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 18:25:13 +0200
Date:   Thu, 9 Jun 2022 18:25:12 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>,
        =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>
Subject: Re: coccinelle: ifaddr: Find address test in more complex
 conditions
In-Reply-To: <da86bc36-36af-7bd7-6bee-861e160ba6a4@web.de>
Message-ID: <alpine.DEB.2.22.394.2206091824560.2380@hadrien>
References: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com> <415ca02b-9618-b447-6471-6bcd0e2215e8@web.de> <alpine.DEB.2.22.394.2206072138160.2960@hadrien> <15a253a6-469b-9632-8c7d-983554604451@web.de>
 <alpine.DEB.2.22.394.2206091740520.2380@hadrien> <da86bc36-36af-7bd7-6bee-861e160ba6a4@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1579567670-1654791912=:2380"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1579567670-1654791912=:2380
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 9 Jun 2022, Markus Elfring wrote:

> >> Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Coccinelle/Probe> spatch --parse-cocci show_address_determination_in_checks-20220609.cocci
> >> …
> >> @display@
> >> expression x;
> >> @@
> >>
> >>
> >> (
> >> *&*x *|| *...
> >> |
> >> *&*x *!= *NULL *|| *...
> >> |
> >> *&*x *|| *...
> >> |
> >> *NULL *!= *&*x *|| *...
> >> )
> …
> >> Would another transformation be needed for the omission of trailing binary operators
> >> (according to the shown combinations with SmPL ellipses)?
> > I don't know what you mean.
>
>
> The results from the application of some isomorphism are shown by the mentioned command.
>
>
>
> > How about trying an example?
>
>
> You might interpret the following test result as an expected one according to
> your understanding of implementation details.
>
> Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Coccinelle/Probe> spatch show_address_determination_in_checks-20220609.cocci initialisation_test2-20220609.c
> …
> @@ -1,8 +1,6 @@
>  void check(void)
>  {
>  int s = 1;
> -bool t = &s ? 0 : 1;
>  bool u;
> -u = &t ? 1 : 0;
>  }
>
>
>
> I observed that no questionable places were marked in the following source code.
>
>
> void check(void)
> {
> int s = 1;
> bool t = (&s);
> }
>
>
> Will this test case trigger further development considerations?

It seems to be doing what it should.

julia
--8323329-1579567670-1654791912=:2380--
