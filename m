Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2CEC77B7A
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jun 2023 00:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbjFHAPM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 20:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjFHAPL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 20:15:11 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632A4213B
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686183310; x=1717719310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6H/4ei8bcR0pZM5SL4/+5//drYDVxm/FSpM+JaGrVS4=;
  b=OtLEqKqdtT5uMTiIEmdGepaalPNhx616iJ6lp/+kVo9cVQuEiBNDwvcf
   TlXla892t4VOJr5p9DHNfUn0aq/AtEsTQkA60zbImBeFeHuKVrpiRqs+7
   oAE1UspHnXflsu+Y6fmhEB9A+P0aWdpHCcutiUq78IPT+cHk7S5aZdl95
   vt8dSCdpi0P9V+UdnrmBCz8J9+5DJ01uaT9tdLxO5YrObqm/4lwEc8Khk
   TE2nDvSXOhykrAFyD8ML2OC00R4klxlKyXBsIZiMsX1J1vdMVBWqcT0Jw
   Yz+cR6kpogeH2Gn/5/Eg3oHQiIC2z5TB2B2C6FltmBi1VXXZwPes4VMJh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385483944"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="385483944"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 17:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="833936059"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="833936059"
Received: from operepel-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.58.149])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 17:14:57 -0700
Date:   Thu, 8 Jun 2023 02:14:49 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Alan Previn <alan.previn.teres.alexis@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gsc: Fix error code in
 intel_gsc_uc_heci_cmd_submit_nonpriv()
Message-ID: <ZIEdeXroNzxrqFVP@ashyti-mobl2.lan>
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

pushed to drm-intel-gt-next.

Thanks,
Andi
