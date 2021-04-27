Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B8CC433ED
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Apr 2021 13:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41D3A613DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Apr 2021 13:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236524AbhD0NpL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Apr 2021 09:45:11 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:59280
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236228AbhD0NpL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Apr 2021 09:45:11 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AC6bClq7Om2nDflsMnwPXwA7XdLJzesId70hD?=
 =?us-ascii?q?6mlaQ3VuGPCwvcaogfgdyFvQgDEeRHkvlbm7Scu9aFnb8oN45pRUAKe6UGDdyQ?=
 =?us-ascii?q?iVBaxr8IeK+VPdMgLk8Oo178pdWoxfLPG1MlRgl8b952CDc+oI5NWc6qiniaP/?=
 =?us-ascii?q?4h5WIj1CUK1r4wdnBgvzKCQfeCB9GZE7GJCAj/AqmxOcfx0sBfiTOmMIRKzqqd?=
 =?us-ascii?q?HNifvdACI7Ow=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,254,1613430000"; 
   d="scan'208";a="379815543"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 15:44:25 +0200
Date:   Tue, 27 Apr 2021 15:44:25 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Johan Hovold <johan@kernel.org>
cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        kernel-janitors@vger.kernel.org,
        Gilles Muller <Gilles.Muller@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>, cocci@systeme.lip6.fr,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coccinelle: api: semantic patch to use
 pm_runtime_resume_and_get
In-Reply-To: <YIgPNRiaz2Jup+PT@hovoldconsulting.com>
Message-ID: <alpine.DEB.2.22.394.2104271542170.5173@hadrien>
References: <20210426185404.2466195-1-Julia.Lawall@inria.fr> <YIgPNRiaz2Jup+PT@hovoldconsulting.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Tue, 27 Apr 2021, Johan Hovold wrote:

> On Mon, Apr 26, 2021 at 08:54:04PM +0200, Julia Lawall wrote:
> > pm_runtime_get_sync keeps a reference count on failure, which can lead
> > to leaks.  pm_runtime_resume_and_get drops the reference count in the
> > failure case.  This rule very conservatively follows the definition of
> > pm_runtime_resume_and_get to address the cases where the reference
> > count is unlikely to be needed in the failure case.
> >
> > pm_runtime_resume_and_get was introduced in
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to
> > deal with usage counter")
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> As I've said elsewhere, not sure trying to do a mass conversion of this
> is a good idea. People may not be used to the interface, but it is
> consistent and has its use. The recent flurry of conversions show that
> those also risk introducing new bugs in code that is currently tested
> and correct.

I looked some of the patches you commented on, and this rule would not
have transformed those cases.  This rule is very restricted to ensure that
the transformed code follows the behavior of the new function.

>
> By giving the script kiddies another toy like this, the influx of broken
> patches is just bound to increase.
>
> Would also be good to CC the PM maintainer on this issue.

Sure, I can resend with Rafael in CC.

julia
