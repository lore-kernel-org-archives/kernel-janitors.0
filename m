Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C55DC433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 14:58:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3955265080
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 14:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhCPO6P (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 10:58:15 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:1650 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231225AbhCPO5z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 10:57:55 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A6EqzQKtt4k7HAmkY8o1H/EK27skDz9V00zAX?=
 =?us-ascii?q?/kB9WHVpW+afkN2jm+le6AT9jywfVGpltdeLPqSBRn20z/JIyKMWOqqvWxSjhX?=
 =?us-ascii?q?uwIOhZgrfK7h/BP2nF9uBb3bp9aKQWMrbNJHVzkMqS2meFOvk6xt3vysGVrMPT?=
 =?us-ascii?q?1W1kQw0vS4wI1XYdNi++Ekl7ADZLHoA4Ep303Kp6jgGtc3gWcci3b0NtN4Kvm/?=
 =?us-ascii?q?TxmIvicVoaAXccmWqzpAm14733GQXw5GZ7bxpzx94ZgAr4uj28yqK/s+yqjj/w?=
 =?us-ascii?q?vlWjlqh+qZ/a5J9uJOHksLlzFhzczjyHIKRNMofy2gwInA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.81,251,1610406000"; 
   d="scan'208";a="498251861"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 15:57:38 +0100
Date:   Tue, 16 Mar 2021 15:57:38 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
cc:     kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] staging: vt665x: fix alignment constraints
In-Reply-To: <CAOc6etaLJdGJHk7F6Vm3iCVW=OzKiWZ2vCFAc_sZn7VAGM4Dyg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2103161557150.2872@hadrien>
References: <20210312145941.1721627-1-eantoranz@gmail.com> <CAOc6etaLJdGJHk7F6Vm3iCVW=OzKiWZ2vCFAc_sZn7VAGM4Dyg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Tue, 16 Mar 2021, Edmundo Carmona Antoranz wrote:

> On Fri, Mar 12, 2021 at 9:00 AM Edmundo Carmona Antoranz
> <eantoranz@gmail.com> wrote:
> >
>
> I wonder if this patch will be picked up if I don't include Greg in
> the conversation. Should I send the patch again looping him in?

Whoever is the maintainer for the driver should be included.

julia
