Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7616C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 16:43:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B339C613A3
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 16:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235390AbhKPQqr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Nov 2021 11:46:47 -0500
Received: from mga12.intel.com ([192.55.52.136]:41103 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234541AbhKPQqq (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Nov 2021 11:46:46 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213762809"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="213762809"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 08:42:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="494525139"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box) ([10.1.27.20])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 08:42:59 -0800
Date:   Tue, 16 Nov 2021 08:37:23 -0800
From:   Matthew Brost <matthew.brost@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Matthew Auld <matthew.auld@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix error pointer dereference in
 i915_gem_do_execbuffer()
Message-ID: <20211116163723.GA14280@jons-linux-dev-box>
References: <20211116114558.GA11936@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116114558.GA11936@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 16, 2021 at 02:48:17PM +0300, Dan Carpenter wrote:
> Originally "out_fence" was set using out_fence = sync_file_create() but
> which returns NULL, but now it is set with out_fence = eb_requests_create()
> which returns error pointers.  The error path needs to be modified to
> avoid an Oops in the "goto err_request;" path.
> 
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix. LGTM. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 4d7da07442f2..9b24d9b5ade1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3277,6 +3277,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
>  	if (IS_ERR(out_fence)) {
>  		err = PTR_ERR(out_fence);
> +		out_fence = NULL;
>  		if (eb.requests[0])
>  			goto err_request;
>  		else
> -- 
> 2.20.1
> 
