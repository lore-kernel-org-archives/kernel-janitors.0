Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42425C07E9A
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jul 2021 06:23:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 288AF613A9
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jul 2021 06:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238078AbhGNG0j (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Jul 2021 02:26:39 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:19171 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237948AbhGNG0j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jul 2021 02:26:39 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A/Ez+NaNMwdRF/cBcTsajsMiBIKoaSvp037BL?=
 =?us-ascii?q?7TEUdfU7SKelfqyV9sjzkCWUtN9zYgBEpTnjAsm9qBrnnPZICMsqTNSftWLd1l?=
 =?us-ascii?q?dAQrsP0WKv+UyDJwTOst8Y76tmfqRkYeecMXFxh6/BjzWFLw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,238,1620684000"; 
   d="scan'208";a="519877855"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 08:22:43 +0200
Date:   Wed, 14 Jul 2021 08:22:42 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Joe Perches <joe@perches.com>
cc:     Julia Lawall <julia.lawall@inria.fr>,
        cocci <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: cocci script to convert linux-kernel allocs with BITS_TO_LONGS
 to bitmap_alloc
In-Reply-To: <42a843710a652e110b71ab6beafc3a3e6e11dfd3.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2107140821140.2917@hadrien>
References: <08b89608cfb1280624d1a89ead6547069f9a4c31.camel@perches.com>  <alpine.DEB.2.22.394.2107102149140.46528@hadrien>  <afd3a282ca57a4a400c8bae9879a7c57bc507c59.camel@perches.com>  <alpine.DEB.2.22.394.2107132332030.3024@hadrien>
 <42a843710a652e110b71ab6beafc3a3e6e11dfd3.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Tue, 13 Jul 2021, Joe Perches wrote:

> On Tue, 2021-07-13 at 23:33 +0200, Julia Lawall wrote:
> > > > On Fri, 9 Jul 2021, Joe Perches wrote:
> > > > > Here is a cocci script to convert various types of bitmap allocations
> > > > > that use BITS_TO_LONGS to the more typical bitmap_alloc functions.
> >
> > I see that there is also a bitmap_free.  Maybe the rule should be
> > introducing that as well?
>
> Yes, but as far as I know, it's difficult for coccinelle to convert
> the kfree() calls of any previous bitmap_alloc to bitmap_free as
> most frequently the kfree() call is in a separate function.

Often the code says a->b = foo(); and then the a->b in another function is
the same one that was the result of foo().  One could check that this is
the only assignment to a->b in the file for more confidence.

I'll add it to the rule and see how it goes.

julia

>
> Please do it if you know how, you're probably the best in the world
> at coccinelle.  I don't know how...
>
> cheers, Joe
>
>
