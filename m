Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAEFC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Nov 2021 23:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C689610D2
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Nov 2021 23:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243595AbhKIXDX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 Nov 2021 18:03:23 -0500
Received: from mga01.intel.com ([192.55.52.88]:12436 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243355AbhKIXDK (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Nov 2021 18:03:10 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="256242498"
X-IronPort-AV: E=Sophos;i="5.87,221,1631602800"; 
   d="scan'208";a="256242498"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 15:00:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,221,1631602800"; 
   d="scan'208";a="491848189"
Received: from shanthyw-mobl1.amr.corp.intel.com (HELO intel.com) ([10.255.34.193])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 15:00:22 -0800
Date:   Tue, 9 Nov 2021 18:00:20 -0500
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm/i915: pin: delete duplicate check in
 intel_pin_and_fence_fb_obj()
Message-ID: <YYr9hKKh0/OM2rLf@intel.com>
References: <20211109114850.GB16587@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109114850.GB16587@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 09, 2021 at 02:48:50PM +0300, Dan Carpenter wrote:
> The "ret" variable is checked on the previous line so we know it's
> zero.  No need to check again.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed.
thanks for the patch

> ---
>  drivers/gpu/drm/i915/display/intel_fb_pin.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> index 3f77f3013584..3b20f69e0240 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> @@ -142,13 +142,11 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
>  	if (ret)
>  		goto err;
>  
> -	if (!ret) {
> -		vma = i915_gem_object_pin_to_display_plane(obj, &ww, alignment,
> -							   view, pinctl);
> -		if (IS_ERR(vma)) {
> -			ret = PTR_ERR(vma);
> -			goto err_unpin;
> -		}
> +	vma = i915_gem_object_pin_to_display_plane(obj, &ww, alignment,
> +						   view, pinctl);
> +	if (IS_ERR(vma)) {
> +		ret = PTR_ERR(vma);
> +		goto err_unpin;
>  	}
>  
>  	if (uses_fence && i915_vma_is_map_and_fenceable(vma)) {
> -- 
> 2.20.1
> 
