Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5E5C43334
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Jun 2022 19:43:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354091AbiFUTnF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Jun 2022 15:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353438AbiFUTnF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Jun 2022 15:43:05 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAE921E38
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Jun 2022 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QebF9d7DxCMQwGIsaTCONnqAShxo/8N8hIDpNDCKAa0=;
  b=LMSQ4ISqaQbdcbHGIeeGWEC0FFjyYLPI9Oh+Xsmc23nKkyrcNqrP5/LT
   i60G6pikY+EqiB7aLPULYaqQxM6DbZeXjWJjpCLIGyncasCEiSxjCsAh9
   7uuoxCPIkBIoaCDj863oeciAi328pTRX35n5zQPkouZygUsxqGJh7oFEx
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,210,1650924000"; 
   d="scan'208";a="17426576"
Received: from 71-219-62-252.chvl.qwest.net (HELO hadrien.PK5001Z) ([71.219.62.252])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 21:42:59 +0200
Date:   Tue, 21 Jun 2022 15:42:56 -0400 (EDT)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     =?ISO-8859-15?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
cc:     Markus Elfring <Markus.Elfring@web.de>,
        "cocci@inria.fr" <cocci@inria.fr>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [cocci] [PATCH v3] coccinelle: Extend address test from ifaddr
 to every test expression
In-Reply-To: <AS8PR03MB7603675681B64E5F14C1995593B39@AS8PR03MB7603.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2206211542410.2194@hadrien>
References: <AS8PR03MB76033CF2848D03651D6E189093A69@AS8PR03MB7603.eurprd03.prod.outlook.com> <6aef3ee4-d934-daff-7145-73ac563d2fb4@web.de> <AS8PR03MB7603675681B64E5F14C1995593B39@AS8PR03MB7603.eurprd03.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-169498865-1655840580=:2194"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-169498865-1655840580=:2194
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: 8BIT



On Tue, 21 Jun 2022, Jérémy LEFAURE wrote:

> > It can be determined that the proposed approach for the detection of
> > questionable source code places is incomplete (also because of the current
> > development status for the Coccinelle software).
> > Thus I suggest to reconsider the usage of the word “every” for the patch message
> > once more.
>
> I'm not against changing the patch's subject. Would you find it better
> if it was "coccinelle: Extend address test from ifaddr to test
> expressions"?
>
> And what about you Julia?

The subject you propose is fine.

julia

>
> > Will further adjustments become helpful for desired source code analyses
> > and corresponding transformations?
>
> Do you mean adjustments in this semantic patch or in the coccinelle software?
>
>
> Thanks,
> Jérémy
--8323329-169498865-1655840580=:2194--
