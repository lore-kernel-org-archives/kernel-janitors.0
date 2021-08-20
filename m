Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC08AC4320A
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Aug 2021 16:34:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B68B261154
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Aug 2021 16:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbhHTQeq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Aug 2021 12:34:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:5417 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231949AbhHTQen (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Aug 2021 12:34:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216804624"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; 
   d="scan'208";a="216804624"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 09:34:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; 
   d="scan'208";a="523768760"
Received: from rsriniv2-mobl.amr.corp.intel.com (HELO intel.com) ([10.255.34.126])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 09:34:03 -0700
Date:   Fri, 20 Aug 2021 12:34:01 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Thomas =?iso-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Potential error pointer dereference in
 pinned_context()
Message-ID: <YR/ZeRfyltL9ACSr@intel.com>
References: <20210813113600.GC30697@kili>
 <866cce10-f983-23d5-06db-b0effc11e50f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <866cce10-f983-23d5-06db-b0effc11e50f@linux.intel.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 13, 2021 at 04:01:06PM +0200, Thomas Hellström wrote:
> 
> On 8/13/21 1:36 PM, Dan Carpenter wrote:
> > If the intel_engine_create_pinned_context() function returns an error
> > pointer, then dereferencing "ce" will Oops.  Use "vm" instead of
> > "ce->vm".
> > 
> > Fixes: cf586021642d ("drm/i915/gt: Pipelined page migration")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index d0a7c934fd3b..1dac21aa7e5c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -177,7 +177,7 @@ static struct intel_context *pinned_context(struct intel_gt *gt)
> >   	ce = intel_engine_create_pinned_context(engine, vm, SZ_512K,
> >   						I915_GEM_HWS_MIGRATE,
> >   						&key, "migrate");
> > -	i915_vm_put(ce->vm);
> > +	i915_vm_put(vm);
> >   	return ce;
> >   }
> 
> Thanks,
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

And pushed to drm-intel-gt-next, thanks for the patch and review.

> 
> 
