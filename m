Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08E7C43460
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 14:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACD7C613B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 14:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhDTOPU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Apr 2021 10:15:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:49487 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231758AbhDTOPS (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Apr 2021 10:15:18 -0400
IronPort-SDR: 3GSRU+0/fjMchpaxT+7TLXatCgJaYiV4yQq++Gq+nerpDq2f0evXuQq12KiOh7NyEPKQceWhf8
 ovoU9UFH/akw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="182644443"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="182644443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 07:14:46 -0700
IronPort-SDR: q/GQMT/wE/Kr2aQ6ZrfxZhx8yWoJSN1FQ0DyeD4QXmjxXaHoFZQWlL+UU+DixPiVNOH2H+pWkC
 Q07Owa5Fdlzw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="426970209"
Received: from jyick-mobl.amr.corp.intel.com (HELO intel.com) ([10.212.57.228])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 07:14:44 -0700
Date:   Tue, 20 Apr 2021 10:14:42 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915: fix an error code in
 intel_overlay_do_put_image()
Message-ID: <YH7h0jEiCcN2z5e8@intel.com>
References: <YHaFcEzcnh/hk1/Q@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHaFcEzcnh/hk1/Q@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 14, 2021 at 09:02:24AM +0300, Dan Carpenter wrote:
> This code should propagate the error from intel_overlay_pin_fb()
> but currently it returns success.
> 
> Fixes: 1b321026e213 ("drm/i915: Pass ww ctx to intel_pin_to_display_plane")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed. thanks for the patch.

> ---
>  drivers/gpu/drm/i915/display/intel_overlay.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index e477b6114a60..e5dadde422f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -803,8 +803,10 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
>  	atomic_inc(&dev_priv->gpu_error.pending_fb_pin);
>  
>  	vma = intel_overlay_pin_fb(new_bo);
> -	if (IS_ERR(vma))
> +	if (IS_ERR(vma)) {
> +		ret = PTR_ERR(vma);
>  		goto out_pin_section;
> +	}
>  
>  	i915_gem_object_flush_frontbuffer(new_bo, ORIGIN_DIRTYFB);
>  
> -- 
> 2.30.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
