Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C903C07E95
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Jul 2021 19:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFCE86128C
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Jul 2021 19:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhGJTwv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Jul 2021 15:52:51 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3772 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhGJTwv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Jul 2021 15:52:51 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AcsgFQanE6Aoxn2NF0+kPcN/ywVnpDfI13DAb?=
 =?us-ascii?q?v31ZSRFFG/Fw9vrAoB1173HJYVoqMk3I+urtBED/ewK+yXcd2+B4AV7IZmLbUQ?=
 =?us-ascii?q?WTQb2Kl7GD/9SaIUzDytI=3D?=
X-IronPort-AV: E=Sophos;i="5.84,229,1620684000"; 
   d="scan'208";a="519326321"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jul 2021 21:50:04 +0200
Date:   Sat, 10 Jul 2021 21:50:04 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Joe Perches <joe@perches.com>
cc:     cocci <cocci@systeme.lip6.fr>, LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: cocci script to convert linux-kernel allocs with BITS_TO_LONGS
 to bitmap_alloc
In-Reply-To: <08b89608cfb1280624d1a89ead6547069f9a4c31.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2107102149140.46528@hadrien>
References: <08b89608cfb1280624d1a89ead6547069f9a4c31.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Fri, 9 Jul 2021, Joe Perches wrote:

> Here is a cocci script to convert various types of bitmap allocations
> that use BITS_TO_LONGS to the more typical bitmap_alloc functions.
>
> Perhaps something like it could be added to scripts/coccinelle.
> The diff produced by the script is also below.
>
> $ cat bitmap_allocs.cocci
> // typical uses of bitmap allocations
>
> @@
> expression val;
> expression e1;
> expression e2;
> @@
>
> -	val = kcalloc(BITS_TO_LONGS(e1), sizeof(\(long\|unsigned long\)), e2)
> +	val = bitmap_zalloc(e1, e2)
>
> @@
> expression val;
> expression e1;
> expression e2;
> @@
>
> -	val = kcalloc(BITS_TO_LONGS(e1), sizeof(*val), e2)
> +	val = bitmap_zalloc(e1, e2)

Is there something that guarantees that val has a type that has a size that
is the same as a long?

julia
