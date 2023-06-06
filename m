Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6273C77B7A
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 09:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237434AbjFFJWn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237440AbjFFJWh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 05:22:37 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB253E4F
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686043355; x=1717579355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b9VXZntpeNRoTEkueHHlfro+jLGEiHISiRUwIaILg8Y=;
  b=COQQs9p2wyX+mhEJ5OhJU/di4ZEJBkYKZZ7JgtCHSjORTx9izs4EaPPh
   4mzhJZrSOtxvDwI/+Kjw6QhGb33xZzaBLhENTXu8/izTIEsFjDfLcyHcj
   01MiSI8S3Dyv0Un/GhY/18fhCsp3KkSq/dUYaPHh54jzGcMsVnuaPl2P6
   XX5YiDwWCL5qKLR9K/Y7q/bbxgZVzp9hnaGEAw2rXc+N2UOJXczRqU9R3
   o3YNH9HGZaPf9IfwDmqDBBtus0sVSTLq4a7EaMWbW8loE+yuP8d7YAyQQ
   9WUb1mNo6FUFHXZlB84SYClPwi1SsHmdooqBIMG9P11u1ikd61kgyYSA3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336242096"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="336242096"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 02:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712136053"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="712136053"
Received: from yuguen-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.57.68])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 02:22:30 -0700
Date:   Tue, 6 Jun 2023 11:22:24 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Nirmoy Das <nirmoy.das@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Fei Yang <fei.yang@intel.com>,
        Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix a NULL vs IS_ERR() bug
Message-ID: <ZH760GjGM+7XdTa5@ashyti-mobl2.lan>
References: <ZH7tHLRZ9oBjedjN@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH7tHLRZ9oBjedjN@moroto>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Jun 06, 2023 at 11:23:56AM +0300, Dan Carpenter wrote:
> The mmap_offset_attach() function returns error pointers, it doesn't
> return NULL.
> 
> Fixes: eaee1c085863 ("drm/i915: Add a function to mmap framebuffer obj")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for this series of fixes!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
