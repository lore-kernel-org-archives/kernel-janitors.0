Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EAFC433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 21:10:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72D2064EFD
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 21:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhCRVKK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Mar 2021 17:10:10 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:57308 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231388AbhCRVJn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Mar 2021 17:09:43 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AZYtLPans4SFmozqtd/7nbaSCqqTpDfNyimdD?=
 =?us-ascii?q?5ilNYBxZY6Wkvuqpm+kW0gKxtSYJVBgb6Km9EYSjYVeZz5565oENIayvNTONhE?=
 =?us-ascii?q?KEJJxvhLGSpgHINDb58odmpMVdWoh4TOb9FF1ryfv9iTPIcOoI5Pmi3OSWifzF?=
 =?us-ascii?q?z3FrJDsKV4hF4x1iAgiWVm1aLTM2YaYRL5aX6spZqzfIQx1+BfiTPXULU/POoN?=
 =?us-ascii?q?fGjvvdASIuPQIt6wWFkFqTmdnHOiWfty1uNQ9n8PMN9Szgnxbi7quu98unwgLR?=
 =?us-ascii?q?vlW+071m3PXmzNVHCIigqOgwbg/thAGheZh7V9S50QwdkaWA7lAlldWJmRM8Jo?=
 =?us-ascii?q?BI7W/LdG3dm3TQ8jil6zol53/8xVLwuxXenfA=3D?=
X-IronPort-AV: E=Sophos;i="5.81,259,1610406000"; 
   d="scan'208";a="498763775"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 22:09:42 +0100
Date:   Thu, 18 Mar 2021 22:09:41 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next] loop: Fix missing max_active argument in
 alloc_workqueue call
In-Reply-To: <CAOc6eta9oSxwPKma9ERP+BoXpW=PGaS8pxWiKQ3nj6BoYAu_Aw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2103182208470.2984@hadrien>
References: <20210318151626.17442-1-colin.king@canonical.com> <13a1d187-4d6d-9e06-b94a-553d872de756@kernel.dk> <62cd71bc-86e1-412d-b2b9-716c0f8021be@canonical.com> <d32641ca-e34a-2bfd-9b86-28c95546f434@kernel.dk>
 <CAOc6eta9oSxwPKma9ERP+BoXpW=PGaS8pxWiKQ3nj6BoYAu_Aw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Thu, 18 Mar 2021, Edmundo Carmona Antoranz wrote:

> On Thu, Mar 18, 2021 at 2:43 PM Jens Axboe <axboe@kernel.dk> wrote:
> >
>
> > If it's being redone, would be silly to have that error in there. Do
> > we have a tag that's appropriate for this? I often wonder when I'm
> > folding in a fix. Ala Fixes-by: or something like that.
> >
>
> Don't want to disturb the conversation that is going on there so I am
> only sending this question to janitors. What is the meaning of
> "folding" in this context?

I think it means that someone other than the main author of the patch
provided an improvement.

julia
