Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1D7C77B7A
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 12:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242638AbjEZM6K (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 08:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjEZM6J (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 08:58:09 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB57D116
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685105888; x=1716641888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ogGvf2CxGG13dczWVpcuQ8rDvUNH3Z0IyjcNc/RhVEg=;
  b=YNTPZ1MdYit5dqzIdYNJ+EyzGAGj2sSzJVLEuDDWHGc9jx0vEb1UDFrd
   1KeZ/bqDUKCA1NI2Vw+/5Ut4N8csOYJB6C1kBGqseIrcJp8jQ6ksIh8i2
   ymREhyyi4wdFdZ5Sr1e2DmzK+sYhvcCdXf0gtIjjZuMFnYYQ2yvJ7B9D/
   O5yuls128/81eH9FJrtdzqnxY5dHeZz8qp6hp6qCdCP1IyEQdF83/B0cR
   FPNp0oKQL0rcjJFItQb0b852wWVxncYnVckOP4ZkS/R1GWCEQr4D3MnPb
   LWXvd4Zou4aDqbgYF+9s8eZZl6Zyq3PR20Y33NO20kay5zgOU9PPzFm6O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382438936"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="382438936"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 05:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682709520"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="682709520"
Received: from schoenfm-mobl1.ger.corp.intel.com (HELO intel.com) ([10.249.39.253])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 05:58:04 -0700
Date:   Fri, 26 May 2023 14:58:01 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Thomas =?iso-8859-15?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftests: fix an error code in copy()
Message-ID: <ZHCs2RU6+SNkq0GA@ashyti-mobl2.lan>
References: <f6b876f1-4dd7-4d96-bee5-966817cc1644@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6b876f1-4dd7-4d96-bee5-966817cc1644@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, May 26, 2023 at 02:59:31PM +0300, Dan Carpenter wrote:
> Return the error code if i915_gem_object_create_internal() fails,
> instead of returning success.
> 
> Fixes: cf586021642d ("drm/i915/gt: Pipelined page migration")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/i915/gt/selftest_migrate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index e677f2da093d..a26429fd5326 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -55,8 +55,10 @@ static int copy(struct intel_migrate *migrate,
>  
>  	sz = src->base.size;
>  	dst = i915_gem_object_create_internal(i915, sz);
> -	if (IS_ERR(dst))
> +	if (IS_ERR(dst)) {
> +		err = PTR_ERR(dst);
>  		goto err_free_src;
> +	}

I think it was intentional to return '0' when
i915_gem_object_create_internal() failed, as we are not testing
object creation here.

I don't really mind this patch, but, on the other hand, returning
an error value here might provide a biased information.

Thanks,
Andi

>  
>  	for_i915_gem_ww(&ww, err, true) {
>  		err = i915_gem_object_lock(src, &ww);
> -- 
> 2.39.2
