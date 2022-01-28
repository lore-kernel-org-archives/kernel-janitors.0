Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA47C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 28 Jan 2022 06:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346377AbiA1GUI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 28 Jan 2022 01:20:08 -0500
Received: from mga02.intel.com ([134.134.136.20]:64296 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346369AbiA1GUG (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Jan 2022 01:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643350806; x=1674886806;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0IznKFNzLkK5AtzST9qgS019kmZNhuJXhcjZQ8npBxo=;
  b=cHBtrvdO9/ZSg59NKq8P6BYPAgwugpaxmQPmSLcQUK2VHhUGVC1/VFOf
   +sdh3myAPox80Jqtt244w9I2Nh5kn/lV97UQ1D6VG9AlRQGowqfYm2mYU
   Cbe2C/njx+fr8cRWUeO8T+a1CzHooP8+U/xS8NF/B44yr+42Ako4R4d2B
   Yc7uZORttX3+vVtEgBt9o1PnnFrMO9mrnYn8GQJpuEXTZGibfuQcpzutX
   eZwco3gO3/0sOvr3B+SeHcdSxgCKM5XV/om8wytw1m8ZboHw7i9N9sno3
   2j3H15dXeLNRCdzBFaQCD4mtvhJqRdbq11CvZprQWsNe+PvOrUHTYBBFQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="234433407"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="234433407"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 22:20:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="629001520"
Received: from mmazarel-mobl.ger.corp.intel.com (HELO [10.249.254.191]) ([10.249.254.191])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 22:20:04 -0800
Message-ID: <f8044efa53f2ea6f998a08592343c9a8f952c718.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: delete shadow "ret" variable
From:   Thomas =?ISO-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>
To:     Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Date:   Fri, 28 Jan 2022 07:20:02 +0100
In-Reply-To: <YfMcAzJgjeqzLVEB@intel.com>
References: <20220127085115.GD25644@kili> <YfMcAzJgjeqzLVEB@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2022-01-27 at 17:26 -0500, Rodrigo Vivi wrote:
> On Thu, Jan 27, 2022 at 11:51:15AM +0300, Dan Carpenter wrote:
> > This "ret" declaration shadows an existing "ret" variable at the
> > top of
> > the function.  Delete it.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> and pushing right now

Should probably have had a Fixes: tag on this one. I'm not 100% sure
whether the faulty patch is already upstream. In that case we might
need to manually include it in a -fixes pull.

/Thomas


> 
> > ---
> >  drivers/gpu/drm/i915/i915_vma.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_vma.c
> > b/drivers/gpu/drm/i915/i915_vma.c
> > index 0026e85a0a0d..b66591d6e436 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > @@ -505,8 +505,6 @@ int i915_vma_bind(struct i915_vma *vma,
> >                         work->pinned = i915_gem_object_get(vma-
> > >obj);
> >         } else {
> >                 if (vma->obj) {
> > -                       int ret;
> > -
> >                         ret =
> > i915_gem_object_wait_moving_fence(vma->obj, true);
> >                         if (ret) {
> >                                 i915_vma_resource_free(vma-
> > >resource);
> > -- 
> > 2.20.1
> > 


