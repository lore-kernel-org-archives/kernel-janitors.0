Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CCCC433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 11 Jul 2022 10:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbiGKKBX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 11 Jul 2022 06:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbiGKKAR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Jul 2022 06:00:17 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C20B7D7F
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Jul 2022 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657531691; x=1689067691;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6kUqRpT1oVjf83SPNw1oqSkNlJoRSr7PKWZJfs4a+gg=;
  b=UaEmL+CJpnhYkxuWmB8lhCr7Q3tWbMVRQxfyGXWDZIycZyTwNtFi1y7z
   UqUxMd75Xu0XQaqkU9iwwmAUprLz8thls02iZRnrKXkzYXKiyQZCyCxfY
   Y61dNYA2g8X+5nb98m/8HMitOXS/ILJ4+N8Zz9SyYq1iq/9naZdd71aCT
   svmA+mseqKjv2gmIXd/2XABOLDrdPYZl57quyNdNp3EK6r31oemFbgsUn
   eyyznVHY2YgNQSrlN839ky46N2Spr0HGT27X5YXo5YHSFtcvBDUzEZWUX
   MuiFhUEEprvXdebN46/S2NyLozioUFDdZ6yg6NJAtbhh93LC8+DYqdtNs
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="265026825"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
   d="scan'208";a="265026825"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 02:28:10 -0700
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
   d="scan'208";a="594815550"
Received: from roniellx-mobl.ger.corp.intel.com (HELO [10.213.211.225]) ([10.213.211.225])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 02:28:06 -0700
Message-ID: <575a6b06-9d0b-6866-1569-d30359c9a280@intel.com>
Date:   Mon, 11 Jul 2022 10:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/i915/selftests: fix a couple IS_ERR() vs NULL
 tests
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris.p.wilson@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ramalingam C <ramalingam.c@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
        =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20220708094104.GL2316@kadam>
From:   Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220708094104.GL2316@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08/07/2022 10:41, Dan Carpenter wrote:
> The shmem_pin_map() function doesn't return error pointers, it returns
> NULL.
> 
> Fixes: be1cb55a07bf ("drm/i915/gt: Keep a no-frills swappable copy of the default context state")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Pushed to drm-intel-gt-next. Thanks for the fix.

> ---
> v2: Correct the Fixes tag.  Add Matthew's reviewed-by tag.
> 
>   drivers/gpu/drm/i915/gt/selftest_lrc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index 8b2c11dbe354..1109088fe8f6 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -176,8 +176,8 @@ static int live_lrc_layout(void *arg)
>   			continue;
>   
>   		hw = shmem_pin_map(engine->default_state);
> -		if (IS_ERR(hw)) {
> -			err = PTR_ERR(hw);
> +		if (!hw) {
> +			err = -ENOMEM;
>   			break;
>   		}
>   		hw += LRC_STATE_OFFSET / sizeof(*hw);
> @@ -365,8 +365,8 @@ static int live_lrc_fixed(void *arg)
>   			continue;
>   
>   		hw = shmem_pin_map(engine->default_state);
> -		if (IS_ERR(hw)) {
> -			err = PTR_ERR(hw);
> +		if (!hw) {
> +			err = -ENOMEM;
>   			break;
>   		}
>   		hw += LRC_STATE_OFFSET / sizeof(*hw);
