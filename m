Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F08C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  8 Jul 2022 08:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237827AbiGHI4F (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 8 Jul 2022 04:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbiGHI4F (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Jul 2022 04:56:05 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AAE71BED
        for <kernel-janitors@vger.kernel.org>; Fri,  8 Jul 2022 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657270564; x=1688806564;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xoIRMoc7m/H4mzgfZ4Ama9uI5xZ/IoArvNaKA9ERL5Y=;
  b=l8creNpN541rsKxVKcsdKUT3+QoqviKu9lm/Qg4UYOvHIAtGiwK9VIHC
   daKPnFug1l4X6/70ZcSINgGhg8uyF+K3xvuZr90P6OIzFV4Dfcxny6u0Z
   oP+ctOAYhtEyZfUNiL4A7DJhiCkM1ey+Evtv9mG1XXr8NfSbdKIex8Oby
   35UJeQcAoWj6wKQd/5tV1dSXNTpM++eoLAnQ8CZOh3/nJvYbPm9LFHl5y
   QOWmuzmMjgOgFsu71yP6569bDZgrx++6VxDl92TKaHF6OszqGHCvEPcip
   HahW6AdCiALHV4OjLNRH0edlSKfq6O3H9HBKR4O4SI1Dr03p0zSLL1oMu
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="345923718"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="345923718"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 01:56:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="568870123"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.16.201]) ([10.213.16.201])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 01:55:57 -0700
Message-ID: <01c7440e-8198-878c-cfb6-b54468b1dca5@intel.com>
Date:   Fri, 8 Jul 2022 10:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: IS_ERR() vs NULL bug in
 intel_gvt_update_reg_whitelist()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gvt-dev@lists.freedesktop.org
References: <Ysftoia2BPUyqVcD@kili>
From:   Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Ysftoia2BPUyqVcD@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08.07.2022 10:41, Dan Carpenter wrote:
> The shmem_pin_map() function returns NULL, it doesn't return error
> pointers.
> 
> Fixes: 97ea656521c8 ("drm/i915/gvt: Parse default state to update reg whitelist")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index b9eb75a2b400..1c35a41620ae 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -3117,9 +3117,9 @@ void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
>   			continue;
>   
>   		vaddr = shmem_pin_map(engine->default_state);
> -		if (IS_ERR(vaddr)) {
> -			gvt_err("failed to map %s->default state, err:%zd\n",
> -				engine->name, PTR_ERR(vaddr));
> +		if (!vaddr) {
> +			gvt_err("failed to map %s->default state\n",
> +				engine->name);
>   			return;
>   		}
>   

