Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F293CC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 14:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4DB761A6C
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 14:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237550AbhKPO4j (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Nov 2021 09:56:39 -0500
Received: from mga17.intel.com ([192.55.52.151]:38292 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237436AbhKPO4i (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Nov 2021 09:56:38 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="214427369"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="214427369"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 06:53:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="454476963"
Received: from jprocter-mobl.amr.corp.intel.com (HELO intel.com) ([10.255.39.135])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 06:53:39 -0800
Date:   Tue, 16 Nov 2021 09:53:38 -0500
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: fix NULL vs IS_ERR() checking
Message-ID: <YZPF8vuxAsLmWQln@intel.com>
References: <20211116114916.GB11936@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116114916.GB11936@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 16, 2021 at 02:49:16PM +0300, Dan Carpenter wrote:
> The intel_engine_create_virtual() function does not return NULL.  It
> returns error pointers.
> 
> Fixes: e5e32171a2cf ("drm/i915/guc: Connect UAPI to GuC multi-lrc interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 38b47e73e35d..c48557dfa04c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3080,8 +3080,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
>  
>  		ce = intel_engine_create_virtual(siblings, num_siblings,
>  						 FORCE_VIRTUAL);
> -		if (!ce) {
> -			err = ERR_PTR(-ENOMEM);
> +		if (IS_ERR(ce)) {
> +			err = ERR_CAST(ce);
>  			goto unwind;
>  		}
>  
> -- 
> 2.20.1
> 
