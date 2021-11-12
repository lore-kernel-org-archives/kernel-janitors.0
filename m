Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6F3C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 14:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A2CF60F55
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 14:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhKLOJh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Nov 2021 09:09:37 -0500
Received: from mga05.intel.com ([192.55.52.43]:59226 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235095AbhKLOJh (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Nov 2021 09:09:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="319340499"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="319340499"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 06:06:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="504901034"
Received: from sbacanu-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.217.145])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 06:06:43 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Colin King <colin.king@canonical.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915: make array states static const
In-Reply-To: <20210915112702.12783-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210915112702.12783-1-colin.king@canonical.com>
Date:   Fri, 12 Nov 2021 16:06:41 +0200
Message-ID: <87wnld31u6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 15 Sep 2021, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the read-only array states on the stack but instead it
> static. Also makes the object code smaller.

Finally pushed, sorry for the delay.

BR,
Jani.

>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index cce1a926fcc1..a60710348613 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -893,7 +893,7 @@ static u32
>  sanitize_target_dc_state(struct drm_i915_private *dev_priv,
>  			 u32 target_dc_state)
>  {
> -	u32 states[] = {
> +	static const u32 states[] = {
>  		DC_STATE_EN_UPTO_DC6,
>  		DC_STATE_EN_UPTO_DC5,
>  		DC_STATE_EN_DC3CO,

-- 
Jani Nikula, Intel Open Source Graphics Center
