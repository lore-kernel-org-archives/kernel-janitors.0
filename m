Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EB1C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Jan 2022 05:55:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241119AbiAYFzb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Jan 2022 00:55:31 -0500
Received: from mga04.intel.com ([192.55.52.120]:21601 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229667AbiAYF3h (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Jan 2022 00:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643088577; x=1674624577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=szMhn+GZucHPTDtHBcqaEh1jiwyMxWJmIcgFkQpSSbQ=;
  b=JUrRQvlEErBUiJx4Eulam1oi85Wi9ulHMC/5TBrUC5XXPD5reL4TDfWr
   BpZxTOCAJ+b5Nqnl0F6DliCV9ArxDAy0xxPkMYjPwJk3fFbDJwKVDPj1G
   mTqfgtMdG5mh5xY9luELc/Jw39tQpjtyhBrDO2otuBFUnBoLTgfVwg7qT
   Ab+IRhjXIcvQeNlEvuD27fUtcUzoRHGSXUyrgKL/tNK9AbK/fH10CCH8e
   RYmgjArU9rIluL23qZyfJ0aV9Y5KHCpJ6oiV2UW/OOqMZ4ySl5JJUYgba
   Skru88DW2j6+TvWyJKxgedTHhMhPvB+Fg799AFAg8EI5YGti1vELBoIQK
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="245056447"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="245056447"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 21:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="624343984"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
  by fmsmga002.fm.intel.com with SMTP; 24 Jan 2022 21:17:26 -0800
Received: by stinkbox (sSMTP sendmail emulation); Tue, 25 Jan 2022 07:17:25 +0200
Date:   Tue, 25 Jan 2022 07:17:25 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Sean Paul <seanpaul@chromium.org>,
        Fernando Ramos <greenfoo@u92.eu>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Eric Anholt <eric@anholt.net>, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/overlay: Prevent divide by zero bugs in scaling
Message-ID: <Ye+H5fF6KeNA1Be3@intel.com>
References: <20220124122409.GA31673@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124122409.GA31673@kili>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 24, 2022 at 03:24:09PM +0300, Dan Carpenter wrote:
> Smatch detected a divide by zero bug in check_overlay_scaling().
> 
>     drivers/gpu/drm/i915/display/intel_overlay.c:976 check_overlay_scaling()
>     error: potential divide by zero bug '/ rec->dst_height'.
>     drivers/gpu/drm/i915/display/intel_overlay.c:980 check_overlay_scaling()
>     error: potential divide by zero bug '/ rec->dst_width'.
> 
> Prevent this by ensuring that the dst height and width are non-zero.
> 
> Fixes: 02e792fbaadb ("drm/i915: implement drmmode overlay support v4")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks. Pushed to drm-intel-next.

> ---
> >From static analysis.  Not tested.
> 
>  drivers/gpu/drm/i915/display/intel_overlay.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index 1a376e9a1ff3..d610e48cab94 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -959,6 +959,9 @@ static int check_overlay_dst(struct intel_overlay *overlay,
>  	const struct intel_crtc_state *pipe_config =
>  		overlay->crtc->config;
>  
> +	if (rec->dst_height == 0 || rec->dst_width == 0)
> +		return -EINVAL;
> +
>  	if (rec->dst_x < pipe_config->pipe_src_w &&
>  	    rec->dst_x + rec->dst_width <= pipe_config->pipe_src_w &&
>  	    rec->dst_y < pipe_config->pipe_src_h &&
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
