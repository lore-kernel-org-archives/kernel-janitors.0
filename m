Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A506DC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Feb 2022 17:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377145AbiBDRqP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Feb 2022 12:46:15 -0500
Received: from mga07.intel.com ([134.134.136.100]:48289 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377099AbiBDRp7 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Feb 2022 12:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643996760; x=1675532760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M598TJz4HB/brJRr5oQuxpFZLQvb22wr/+AMZC6Wrfw=;
  b=mOejxCMZjznNvw7G/d9G/D7lOcbKW+lhikhWaW4+l4MN+atgmmWS6Fyu
   4plVbs+QJs9+KGtG5U68qK0fWv4DlAhEOSi8605NOApY/eZC6axuvQzHW
   KAVnvhEiO++oe1dPq0CjXd/Xw1pNjMsUTcJmog2K1zP82G/HpzpXkbLJl
   P3YQ/pw5nvTJDTiBrCilnDZOpL9FB1o9RmcjPgPKbGGh9xkI8mX2JeS8h
   grcUAxznz7HXy2Dy1XbAxCXtlVs0EjkwVEEDRrU4UmB1xmJByU3iJJHJD
   VEHxFrglAevU8+MDprLapjHuTY4+rsSRmTyD+mrJ+CKZiWlsWaZ57PHmp
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="311712132"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="311712132"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 09:45:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="539241163"
Received: from gpanagop-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.35.155])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 09:45:54 -0800
Date:   Fri, 4 Feb 2022 18:45:51 +0100
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        John Harrison <John.C.Harrison@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Thomas Hellstr?m <thomas.hellstrom@linux.intel.com>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Micha?? Winiarski <michal.winiarski@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftests: fix some error codes in
 __cancel_reset()
Message-ID: <Yf1mT6cFanBUgEXa@intel.intel>
References: <20220127084915.GC25644@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127084915.GC25644@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

> There were two error paths in __cancel_reset() which return success
> instead of a negative error code as expected.
> 
> Fixes: 4e6835466771 ("drm/i915/selftests: Add a cancel request selftest that triggers a reset")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> >From static analysis.  I am not 100% sure this.  Please review extra
> carefully!
> 
>  drivers/gpu/drm/i915/selftests/i915_request.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 2a99dd7c2fe8..05e9f977757b 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -809,7 +809,8 @@ static int __cancel_reset(struct drm_i915_private *i915,
>  	preempt_timeout_ms = engine->props.preempt_timeout_ms;
>  	engine->props.preempt_timeout_ms = 100;
>  
> -	if (igt_spinner_init(&spin, engine->gt))
> +	err = igt_spinner_init(&spin, engine->gt);
> +	if (err)
>  		goto out_restore;
>  
>  	ce = intel_context_create(engine);
> @@ -838,8 +839,10 @@ static int __cancel_reset(struct drm_i915_private *i915,
>  	}
>  
>  	nop = intel_context_create_request(ce);
> -	if (IS_ERR(nop))
> +	if (IS_ERR(nop)) {
> +		err = PTR_ERR(nop);
>  		goto out_rq;
> +	}

Looks correct to me:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thank you,
Andi
