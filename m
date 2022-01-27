Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F82C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Jan 2022 22:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbiA0W0P (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Jan 2022 17:26:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:42145 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229796AbiA0W0P (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jan 2022 17:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643322375; x=1674858375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DFD6DTmCY8gllT9JYJeAvRmQ1JOyPKL07DPGPY7ZyI4=;
  b=Y/paVZcSxqR97XDvenTTbS0SFd2N/CLI89cOBa2XXXKwfgxrEUOO8A4P
   x5n8E2eemWGdc/QaKJZO47n1nmGcf1JPI5rw7mEoJ4qNkQsJKV1tstaPM
   QeItQtgTRvD6zHxG7Ffd1COknY7g2QInZ45JVcNIftpBYvQlR5L5rvQDJ
   VY6c7HA3NN9ZCzogMOpwWRhLynmvYPiWDSbGY+Uyq4V/psxLmLlv1TtTS
   EGGxcx4PO2Am73p6lA360kMqnkANMJYVzGZrReoYGdiE/eNydnq7X+wcS
   m8jPY6OlCkIQEzioJ1BILML0nUTPLWQmeocj84ZqfwCmDLpsazvGXFoH+
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="234360058"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="234360058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 14:26:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="535860787"
Received: from jhbabine-mobl.amr.corp.intel.com (HELO intel.com) ([10.255.34.10])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 14:26:13 -0800
Date:   Thu, 27 Jan 2022 17:26:11 -0500
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: delete shadow "ret" variable
Message-ID: <YfMcAzJgjeqzLVEB@intel.com>
References: <20220127085115.GD25644@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127085115.GD25644@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jan 27, 2022 at 11:51:15AM +0300, Dan Carpenter wrote:
> This "ret" declaration shadows an existing "ret" variable at the top of
> the function.  Delete it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing right now

> ---
>  drivers/gpu/drm/i915/i915_vma.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 0026e85a0a0d..b66591d6e436 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -505,8 +505,6 @@ int i915_vma_bind(struct i915_vma *vma,
>  			work->pinned = i915_gem_object_get(vma->obj);
>  	} else {
>  		if (vma->obj) {
> -			int ret;
> -
>  			ret = i915_gem_object_wait_moving_fence(vma->obj, true);
>  			if (ret) {
>  				i915_vma_resource_free(vma->resource);
> -- 
> 2.20.1
> 
