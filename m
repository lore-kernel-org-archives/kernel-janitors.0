Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50EC4338F
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Aug 2021 14:01:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEE3D60F57
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Aug 2021 14:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240767AbhHMOCC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Aug 2021 10:02:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:12776 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240703AbhHMOCB (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Aug 2021 10:02:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="215555621"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; 
   d="scan'208";a="215555621"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2021 07:01:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; 
   d="scan'208";a="422873063"
Received: from pheino-mobl.ger.corp.intel.com (HELO [10.249.254.189]) ([10.249.254.189])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2021 07:01:08 -0700
Subject: Re: [PATCH] drm/i915/gt: Potential error pointer dereference in
 pinned_context()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
References: <20210813113600.GC30697@kili>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>
Message-ID: <866cce10-f983-23d5-06db-b0effc11e50f@linux.intel.com>
Date:   Fri, 13 Aug 2021 16:01:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813113600.GC30697@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 8/13/21 1:36 PM, Dan Carpenter wrote:
> If the intel_engine_create_pinned_context() function returns an error
> pointer, then dereferencing "ce" will Oops.  Use "vm" instead of
> "ce->vm".
>
> Fixes: cf586021642d ("drm/i915/gt: Pipelined page migration")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index d0a7c934fd3b..1dac21aa7e5c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -177,7 +177,7 @@ static struct intel_context *pinned_context(struct intel_gt *gt)
>   	ce = intel_engine_create_pinned_context(engine, vm, SZ_512K,
>   						I915_GEM_HWS_MIGRATE,
>   						&key, "migrate");
> -	i915_vm_put(ce->vm);
> +	i915_vm_put(vm);
>   	return ce;
>   }
>   

Thanks,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


