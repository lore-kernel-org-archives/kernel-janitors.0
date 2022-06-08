Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DB2C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Jun 2022 14:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240999AbiFHOHu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Jun 2022 10:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240953AbiFHOHs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jun 2022 10:07:48 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F183BFAC
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Jun 2022 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CEsbngddMkp90Voqca9T04crgDEcf1kKJsrgiFQMfxo=;
  b=tMzbNZhavcK+WEwEOrjPqsy2GS5b+owwF4jd7u9yM55qbJRlctgERYMt
   llWvE4qQPB8QH6wRUYqN08t7X8cYwdnWfGdCEUfv5isPRw22/b0J7tbUl
   3mFNsDTa5vQHR5udDWPmUJhwQqNG2rsRlDEK7sXcH24IeCwBM78AaejM/
   4=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,286,1647298800"; 
   d="scan'208";a="40056841"
Received: from 245.122.68.85.rev.sfr.net (HELO hadrien) ([85.68.122.245])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 16:07:43 +0200
Date:   Wed, 8 Jun 2022 16:07:42 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     =?ISO-8859-15?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
cc:     Markus Elfring <Markus.Elfring@web.de>,
        "cocci@inria.fr" <cocci@inria.fr>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v2] coccinelle: ifaddr: Find address test in more complex
 conditions
In-Reply-To: <AS8PR03MB76038B2D2E451F0A07AEE4D093A49@AS8PR03MB7603.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2206081605380.2960@hadrien>
References: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com> <415ca02b-9618-b447-6471-6bcd0e2215e8@web.de> <alpine.DEB.2.22.394.2206072138160.2960@hadrien>
 <AS8PR03MB76038B2D2E451F0A07AEE4D093A49@AS8PR03MB7603.eurprd03.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-678616926-1654697262=:2960"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-678616926-1654697262=:2960
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: 8BIT



On Wed, 8 Jun 2022, Jérémy LEFAURE wrote:

> > I don't really understand the above, but it made me realize that actually
> > the following is sufficient:
> >
> > @@
> > expression x;
> > @@
> >
> > *&x || ...
> >
> > This forces &x to appear as a test expression. There can be 0 or more
> > occurrences of ||, so eg &x && y is also matched.
>
> That's indeed better because it allows to catch issues in tests that
> are not in if statements (such as loops). Is it ok to rename this file
> to test_addr.cocci in the next version of the patch to give it a more
> appropriated name?

That seems like a good idea, thanks.

>
> It also gives a better line indication for conditions split on several
> lines.
>
> I also noticed that with this change the semantic patch catches tests of
> addresses in if statements when likely/unlikely is used, for example
> if (likely(&a)). This was not the case with my previous patch nor with
> the current semantic patch version on master even though the isomorphism
> unlikely(E) <=> likely(E) => E is in the standard.iso file. I don't get
> this behavior change, do you have any idea why it didn't work?

Isomorphisms apply to the semantic patch, not to the code.  You see the
arrow only going to the right that reaches E.  If it were going to the
left, then Coccinellewould take every expression and try to wrap likely
and unlikely around it, which would obviously be undesirable.

julia
--8323329-678616926-1654697262=:2960--
