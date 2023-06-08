Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207D1C7EE25
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jun 2023 00:10:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbjFHAK5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 20:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbjFHAK4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 20:10:56 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A835213B
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686183055; x=1717719055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5Yp99t/4F/ho4lG5w0t57Lz87gdGg2J7dHYOlU8mwc=;
  b=H1mLCWLWwCxPhKNTWKGqqc+xWcQE24D4UmnKi8xL6ehs4nQ7I+3OiDnr
   iMfacrhICy6yBsWj5yqTscMoOSHbBYDN2rbfhmDIMx48GAqRY0tHm8j9n
   gWFixPJEziKsX66qnr7N3/p35JRhD3Q9JI0GRiHPn8OzqY9V2x6TM0k+m
   56blAl2Tqi/LzggEw+NIVuX5IvNFOlR84SoJukPcwUvAaK4tdSH7gM6oh
   5gc1eywNkAFpNFErFTr5H+SnODpPKo3fLZ+pn/wirF1/wCcHJ4k1N55XR
   e+D3RJySpr/MQ7Zkkl8MMqOjPBaPTGUNURKAMiwU0FsdzYURjBC/OZujr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346759465"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="346759465"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 17:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822377361"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="822377361"
Received: from operepel-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.58.149])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 17:10:51 -0700
Date:   Thu, 8 Jun 2023 02:10:44 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Alan Previn <alan.previn.teres.alexis@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gsc: Fix error code in
 intel_gsc_uc_heci_cmd_submit_nonpriv()
Message-ID: <ZIEchIIx5J2jDZlV@ashyti-mobl2.lan>
References: <ZH7sr+Vs4zOQoouU@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH7sr+Vs4zOQoouU@moroto>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Jun 06, 2023 at 11:22:07AM +0300, Dan Carpenter wrote:
> This should return negative -EAGAIN instead of positive EAGAIN.
> 
> Fixes: e5e1e6d28ebc ("drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
