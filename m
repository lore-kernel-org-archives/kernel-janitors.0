Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96F2C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 05:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87CB961430
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 05:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhEJFHL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 01:07:11 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:7440 "EHLO
        mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229533AbhEJFHK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 01:07:10 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A5lCi/6ziDLYbua1/47A6KrPwK71zdoMgy1kn?=
 =?us-ascii?q?xilNoH1uA6ilfq+V98jzuSWftN9VYhAdcLO7Scy9qBHnlaKdiLN5VYtKHjOW21?=
 =?us-ascii?q?dAR7sN0WKN+VHd8mHFh4xg/JYlQuxFBNr8AUMSt6vHyQOzeuxO/OW6?=
X-IronPort-AV: E=Sophos;i="5.82,286,1613430000"; 
   d="scan'208";a="380964977"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 May 2021 07:06:05 +0200
Date:   Mon, 10 May 2021 07:06:05 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        christophe.jaillet@wanadoo.fr, kernel-janitors@vger.kernel.org
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
In-Reply-To: <20210510043044.GN1955@kadam>
Message-ID: <alpine.DEB.2.22.394.2105100704070.3126@hadrien>
References: <20210509004112.421100-1-eantoranz@gmail.com> <20210510043044.GN1955@kadam>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Mon, 10 May 2021, Dan Carpenter wrote:

> On Sat, May 08, 2021 at 06:41:11PM -0600, Edmundo Carmona Antoranz wrote:
> > Modify some error messages so that the symbolic error value be
> > printed instead of a numeric value.
> > ---
>
> No Signed-off-by.

It wasn't meant as a patch to be applied.  Just to show the opportunities.

> I feel like we should hold off on this for existing
> code until the %pe patches get backported to more -stable kernels.
> Otherwise if we backport a driver which uses %pe and the kernel doesn't
> support it then that's a headache.  I think it gets treated like vanilla
> %p.

OK, that seems like a reasonable strategy.

Any idea what %i is?  Does it actually exist?

julia
