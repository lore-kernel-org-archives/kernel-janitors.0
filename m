Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F57C6FA82
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Sep 2022 20:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiITUNx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Sep 2022 16:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiITUNw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Sep 2022 16:13:52 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9385A7392C
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Sep 2022 13:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mcagBDy+jjNclke4sqUbVPsFI/F7edwOVzn01ZHhCpk=;
  b=cor8gbqtUkmPzOXPSrUEgeosSyyb2FmBwa0s6aPEx9FzAKHnCUjTfpMS
   OAQxglfzspQO4+oabyEAuSffFQsTBbtsho4F8iQuEaKUMJvZYGXG/5Ipa
   0g9GhtcxkAAvSdL1V5lL+SSUPr2rmk/Ni5+C5J89GNyFf5w+ADl2geN1z
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.93,331,1654552800"; 
   d="scan'208";a="24235806"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 22:13:48 +0200
Date:   Tue, 20 Sep 2022 22:13:48 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     Yuan Can <yuancan@huawei.com>, cocci@inria.fr,
        Nicolas Palix <nicolas.palix@imag.fr>,
        kernel-janitors@vger.kernel.org
Subject: Re: [cocci] [PATCH v2 1/2] coccinelle: locks: add missing_mutex_init.cocci
 script
In-Reply-To: <0896e030-5060-08e7-d0de-c63d77c9ef27@web.de>
Message-ID: <alpine.DEB.2.22.394.2209202211430.2740@hadrien>
References: <20220920025820.105924-1-yuancan@huawei.com> <0896e030-5060-08e7-d0de-c63d77c9ef27@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1710843513-1663704828=:2740"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1710843513-1663704828=:2740
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

> > +mutex_init(\(&mm->fld\|&(mm->fld)\))
>
>
> An extra SmPL disjunction is probably unnecessary because of an isomorphism.
> https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/3f7496ff9c2c5d4fadae1e585aa458e1a0037972/standard.iso#L382
> https://github.com/coccinelle/coccinelle/blob/19ee1697bf152d37a78a20cefe148775bf4b0e0d/standard.iso#L382

This is correct.  It would be better to only have the version with the
parentheses, because Coccinelle will consider the case without parentheses
anyway.

>
>
> +mutex_init(&(mm->fld))
>
>
>
> …
>
> > +@r3@
> > +identifier s, fld;
> > +position p != {r2.p};
>
>
> Why do you think that such a SmPL constraint would be required?
>
>
> > +@@
> > +
> > +struct s {
> > +  ...
> > +  struct mutex fld@p;
> > +  ...
> > +};
>
>
> Why would the source code search repetition matter here?

He is searching for a structure that is different from the ones matched
previously.

>
>
> …
>
> > +@r5 depends on r4@
> > +identifier r3.s;
> > +struct s *mm;
> > +position p;
> > +@@
> > +* mm@p = \(kmalloc\|kzalloc\|devm_kmalloc\|devm_kzalloc\)(...)
>
>
> I would expect that the usage of the asterisk in the first column should belong
> to the operation mode “context”.

This is correct.  Either the context mode should be fully supported or the
asterisk should be removed.

julia
--8323329-1710843513-1663704828=:2740--
