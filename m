Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A9EC433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 06:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06DF8610CD
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 06:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhEJGGB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 02:06:01 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:47117
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230009AbhEJGGA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 02:06:00 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AT2n7/a1sTx9FRhAJRnOmeAqjBLUkLtp133Aq?=
 =?us-ascii?q?2lEZdPU1SL39qynApp8mPHPP4gr5HUtApTniAtjkfZq/z/5ICOAqVN+ftUvdyQ?=
 =?us-ascii?q?iVxepZg7cKrQeNJ8SzzJ8+6Y5QN5k7MtH2AFRg5PyW3CCzGb8br+W6zA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,286,1613430000"; 
   d="scan'208";a="380970012"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 May 2021 08:04:46 +0200
Date:   Mon, 10 May 2021 08:04:46 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        christophe.jaillet@wanadoo.fr, kernel-janitors@vger.kernel.org
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
In-Reply-To: <20210510060340.GP1955@kadam>
Message-ID: <alpine.DEB.2.22.394.2105100804320.3126@hadrien>
References: <20210509004112.421100-1-eantoranz@gmail.com> <alpine.DEB.2.22.394.2105092315330.24280@hadrien> <20210510043508.GO1922@kadam> <alpine.DEB.2.22.394.2105100703230.3126@hadrien> <20210510060340.GP1955@kadam>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Mon, 10 May 2021, Dan Carpenter wrote:

> On Mon, May 10, 2021 at 07:03:59AM +0200, Julia Lawall wrote:
> >
> >
> > On Mon, 10 May 2021, Dan Carpenter wrote:
> >
> > > On Sun, May 09, 2021 at 11:17:42PM +0200, Julia Lawall wrote:
> > > > ---------------------------
> > > >
> > > > Patch of a recent linux next:
> > > >
> > > > diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
> > > > index 2e35354b61f5..ff75e928772a 100644
> > > > --- a/arch/arm/mach-pxa/cm-x300.c
> > > > +++ b/arch/arm/mach-pxa/cm-x300.c
> > > > @@ -531,7 +531,7 @@ static int cm_x300_u2d_init(struct device *dev)
> > > >  		pout_clk = clk_get(NULL, "CLK_POUT");
> > > >  		if (IS_ERR(pout_clk)) {
> > > >  			err = PTR_ERR(pout_clk);
> > > > -			pr_err("failed to get CLK_POUT: %d\n", err);
> > > > +			pr_err("failed to get CLK_POUT: %pe\n", err);
> > >
> > > It has to print the pointer and not the err.   So it should be:
> > >
> > > 			pr_err("failed to get CLK_POUT: %pe\n", pout_clk);
> >
> > Oops!  Thanks.  That is easy to fix.
>
> Yeah, but I would prefer to wait until %e exists and use that instead.

OK.

thanks,
julia
