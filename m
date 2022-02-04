Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A87C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Feb 2022 21:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242053AbiBDVq4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Feb 2022 16:46:56 -0500
Received: from mga11.intel.com ([192.55.52.93]:6508 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233413AbiBDVq4 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Feb 2022 16:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644011216; x=1675547216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=57A47Aev2Cnb0+FPcy9I+a1W2Fzo6X/Ahx7AvLaIjRo=;
  b=DFrWEUWUAu/VpPQF62rULzg+EzYRF+5aOnio9qZ1p2y2LdcPE2ASCjCZ
   Y2ltUT1snxqBFBgwSKqGW7Mgje84zIu7J2jLpqgn77LkNg4YpQGmUOepc
   8FApg+c8Iq2vfCbcK+jq8cAACqKBxWXmijTUWNxolMmcOtbwrkiA9m19B
   wo2MJ5sthff2fzClymq73TO5BbdUr5JkLppDbCV4uBlwQE6aOa6dOG0tb
   scQZJAStlZ3Pei696XDloAAytLZVgbYTB/amWUTeVlztQ3zqUkQtx1Op4
   bFpLV184UwyqxdesLNVdo4artWvT2BkftKipmisei4yZj3TWX3UxYw2mV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="246037470"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="246037470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:46:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="539320697"
Received: from ivangele-mobl2.amr.corp.intel.com (HELO intel.com) ([10.255.37.87])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:46:53 -0800
Date:   Fri, 4 Feb 2022 16:46:51 -0500
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Andi Shyti <andi.shyti@linux.intel.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org,
        Micha?? Winiarski <michal.winiarski@intel.com>,
        Thomas Hellstr?m <thomas.hellstrom@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        intel-gfx@lists.freedesktop.org,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: fix some error codes in
 __cancel_reset()
Message-ID: <Yf2ey71PCUN1n0oK@intel.com>
References: <20220127084915.GC25644@kili>
 <Yf1mT6cFanBUgEXa@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yf1mT6cFanBUgEXa@intel.intel>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Feb 04, 2022 at 06:45:51PM +0100, Andi Shyti wrote:
> Hi Dan,
> 
> > There were two error paths in __cancel_reset() which return success
> > instead of a negative error code as expected.
> > 
> > Fixes: 4e6835466771 ("drm/i915/selftests: Add a cancel request selftest that triggers a reset")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > >From static analysis.  I am not 100% sure this.  Please review extra
> > carefully!
> > 
> >  drivers/gpu/drm/i915/selftests/i915_request.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> > index 2a99dd7c2fe8..05e9f977757b 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > @@ -809,7 +809,8 @@ static int __cancel_reset(struct drm_i915_private *i915,
> >  	preempt_timeout_ms = engine->props.preempt_timeout_ms;
> >  	engine->props.preempt_timeout_ms = 100;
> >  
> > -	if (igt_spinner_init(&spin, engine->gt))
> > +	err = igt_spinner_init(&spin, engine->gt);
> > +	if (err)
> >  		goto out_restore;
> >  
> >  	ce = intel_context_create(engine);
> > @@ -838,8 +839,10 @@ static int __cancel_reset(struct drm_i915_private *i915,
> >  	}
> >  
> >  	nop = intel_context_create_request(ce);
> > -	if (IS_ERR(nop))
> > +	if (IS_ERR(nop)) {
> > +		err = PTR_ERR(nop);
> >  		goto out_rq;
> > +	}
> 
> Looks correct to me:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

We need a rebased version to be sent...
Sorry for the delay here...

> 
> Thank you,
> Andi
