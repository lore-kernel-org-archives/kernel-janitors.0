Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2854DC433EF
	for <kernel-janitors@archiver.kernel.org>; Sat,  4 Jun 2022 14:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbiFDOvB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 4 Jun 2022 10:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbiFDOvA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 Jun 2022 10:51:00 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7220762FA
        for <kernel-janitors@vger.kernel.org>; Sat,  4 Jun 2022 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=paiQDWRNIqzdrqmQA5zex78gh2P49XTxepAnxyWSzRg=;
  b=ZQ9rPvjo9ceQNtqNea7lDclxiG5ubK9EjfCMW8JmGjIcbEzcdd95Kmk5
   bHgksAWyqXqG3aznvcVli3J5dToP5TGAbLYX5ERLPYuI3zeiCc+V1UIvq
   1U9Py9olDrydKiAZRrD6K+0f/YZPsfGQ8STwZZU/8HkClb4gtwdSgTn2r
   s=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,277,1647298800"; 
   d="scan'208";a="15925396"
Received: from 245.122.68.85.rev.sfr.net (HELO hadrien) ([85.68.122.245])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 16:50:57 +0200
Date:   Sat, 4 Jun 2022 16:50:56 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     Julia Lawall <julia.lawall@inria.fr>,
        =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>,
        cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [cocci] coccinelle: ifaddr: Find address test in more complex
 conditions
In-Reply-To: <edfe8a02-82b6-aa03-b6e8-25f71e116807@web.de>
Message-ID: <alpine.DEB.2.22.394.2206041650470.2858@hadrien>
References: <AS8PR03MB7603A9FB9FA6A62438B09A3793DD9@AS8PR03MB7603.eurprd03.prod.outlook.com> <2490b8cf-4d9e-1357-6563-097264bcb01a@web.de> <alpine.DEB.2.22.394.2206041609220.2858@hadrien> <edfe8a02-82b6-aa03-b6e8-25f71e116807@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1846226568-1654354257=:2858"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1846226568-1654354257=:2858
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 4 Jun 2022, Markus Elfring wrote:

> >> *if@p ( \(&x \| &x || ... \| &x && ... \) )
> >>  S1 else S2
> >>
> >>
> >> How do you think about to use such a SmPL code variant instead?
> >
> > I don't think that the &x case is needed.  There is an isomorphism for ||
> > ... that makes it cover the case where the || is not there as well.
>
>
> Do you refer to an isomorphism which is built into the Coccinelle software
> (instead of being explicitly specified in the file “standard.iso”)?

Yes, that is correct.

julia
--8323329-1846226568-1654354257=:2858--
