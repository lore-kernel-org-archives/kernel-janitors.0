Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1EFC433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Apr 2021 11:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9448560FF1
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Apr 2021 11:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbhDVLfb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Apr 2021 07:35:31 -0400
Received: from foss.arm.com ([217.140.110.172]:50284 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230510AbhDVLfa (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Apr 2021 07:35:30 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B25D113A1;
        Thu, 22 Apr 2021 04:34:55 -0700 (PDT)
Received: from e120937-lin (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B75AC3F774;
        Thu, 22 Apr 2021 04:34:54 -0700 (PDT)
Date:   Thu, 22 Apr 2021 12:34:52 +0100
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Jon Medhurst (Tixy)" <tixy@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scpi: prevent ternary sign expansion bug
Message-ID: <20210422113451.GG43717@e120937-lin>
References: <YIE7pdqV/h10tEAK@mwanda>
 <20210422101709.GF43717@e120937-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422101709.GF43717@e120937-lin>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 22, 2021 at 11:17:09AM +0100, Cristian Marussi wrote:
> Hi,
> 
> On Thu, Apr 22, 2021 at 12:02:29PM +0300, Dan Carpenter wrote:
> > How type promotion works in ternary expressions is a bit tricky.
> > The problem is that scpi_clk_get_val() returns longs, "ret" is a int
> > which holds a negative error code, and le32_to_cpu() is an unsigned int.
> > We want the negative error code to be cast to a negative long.  But
> > because le32_to_cpu() is an u32 then "ret" is type promoted to u32 and
> > becomes a high positive and then it is promoted to long and it is still
> > a high positive value.
> > 
> > Fix this by getting rid of the ternary.
> 
> I wonder how/if the callers up in the stack check/expect ever effectively for a
> 2-complement negative value inside the returned unsigned long...given that this
> plugs finally into CLK framework struct clk_ops.recalc_rate via clk-scpi.c which
> also expects unsigned long....but that's another story.
> 
> FWIW regarding this patch:
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks
> 
> Cristian

@Sudeep, as a second though, looking at .recalc_rate() definition inside

include/linux/clk-provider.h:struct clk_ops 

which is the direct caller of this SCPI clk function, I wonder if, instead,
on error we should not return here just ZERO as the returned clock rate value
as in:

	if (ret)
		return 0;

given that the error code returned inside the unsigned long won't be ever
considerd as such apparently, so not sure if it'd be worst to return a
very big fake value or zero...

Thanks
Cristian


> > 
> > Fixes: 8cb7cf56c9fe ("firmware: add support for ARM System Control and Power Interface(SCPI) protocol")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/firmware/arm_scpi.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
> > index d0dee37ad522..3bf61854121d 100644
> > --- a/drivers/firmware/arm_scpi.c
> > +++ b/drivers/firmware/arm_scpi.c
> > @@ -552,8 +552,10 @@ static unsigned long scpi_clk_get_val(u16 clk_id)
> >  
> >  	ret = scpi_send_message(CMD_GET_CLOCK_VALUE, &le_clk_id,
> >  				sizeof(le_clk_id), &rate, sizeof(rate));
> > +	if (ret)
> > +		return ret;
> >  
> > -	return ret ? ret : le32_to_cpu(rate);
> > +	return le32_to_cpu(rate);
> >  }
> >  
> >  static int scpi_clk_set_val(u16 clk_id, unsigned long rate)
> > -- 
> > 2.30.2
> > 
