Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3152CA550A
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Sep 2023 09:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239120AbjIMJBn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Sep 2023 05:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236929AbjIMJBn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Sep 2023 05:01:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ECF71997
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Sep 2023 02:01:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711E6C433C8;
        Wed, 13 Sep 2023 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694595698;
        bh=Feb4J9LX4ImkTbr7yjcTSpSpgAU86GJulnnkLr0gYrw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BkuW1dDbZkdBCmIICjA3dSTunrbBByXY/vrx4Vz13Fmom6MsGlUKezfJxA8r2b1ig
         k9IGGYVYlrcTO3PnipRC60R7oyBxkV91CZ628WHxyB5pxEBvjJbSbppFOKiDbV4M8x
         ZdK2fcI6QrHA7fI5V5dcoZrLXW+p/GTjn8OD+SHn3tnevmqLe/ScFL41e8bqk2EG/E
         T7dN6enkt5awz+v9kR+z6y9JbILGKfmdqnqVy2BUnlwKaMi7V1BffdGFkOKhFFUtgV
         CekUnziijoqLwhcBEi5/AqS3siDsfCgPe3k/NoV6Zn1A/HMl40SwdmLTYJHkGI8R2r
         N8H2mJrx7fADQ==
Date:   Wed, 13 Sep 2023 11:01:35 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Zhanjun Dong <zhanjun.dong@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matt Roper <matthew.d.roper@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Fei Yang <fei.yang@intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Prevent error pointer dereference
Message-ID: <20230913090135.yikme2rv2kjmcqag@zenone.zhora.eu>
References: <455b2279-2e08-4d00-9784-be56d8ee42e3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <455b2279-2e08-4d00-9784-be56d8ee42e3@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Sep 13, 2023 at 11:17:41AM +0300, Dan Carpenter wrote:
> Move the check for "if (IS_ERR(obj))" in front of the call to
> i915_gem_object_set_cache_coherency() which dereferences "obj".
> Otherwise it will lead to a crash.
> 
> Fixes: 43aa755eae2c ("drm/i915/mtl: Update cache coherency setting for context structure")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 957d0aeb0c02..c378cc7c953c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1094,6 +1094,9 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>  					  I915_BO_ALLOC_PM_VOLATILE);
>  	if (IS_ERR(obj)) {
>  		obj = i915_gem_object_create_shmem(engine->i915, context_size);
> +		if (IS_ERR(obj))
> +			return ERR_CAST(obj);
> +

that's correct! When the workaround was added later it wasn't
checking whether obj had a valid value or not, leading to a
potential segfault.

Thanks for fixing it!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

>  		/*
>  		 * Wa_22016122933: For Media version 13.0, all Media GT shared
>  		 * memory needs to be mapped as WC on CPU side and UC (PAT
> @@ -1102,8 +1105,6 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>  		if (intel_gt_needs_wa_22016122933(engine->gt))
>  			i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>  	}
> -	if (IS_ERR(obj))
> -		return ERR_CAST(obj);
>  
>  	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
>  	if (IS_ERR(vma)) {
