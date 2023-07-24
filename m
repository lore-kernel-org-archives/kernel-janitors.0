Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE37C001B0
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jul 2023 16:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjGXQYg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jul 2023 12:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGXQYf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 12:24:35 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B58E4F;
        Mon, 24 Jul 2023 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690215874; x=1721751874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UrlDO9w/AnWLaZUBmhVjpnmqS7Elf1R30ZuiU+UuJds=;
  b=UGIL84FIHpqWCh4QivC02xai2GREWppVtJ3YC/OOmQotjoze6PAHxsN3
   mbWsCuHO52U+EGGQwnStqPq4p/nhu6iO0P6QTLSxydON31ewnf6hoCWll
   W8f0KedSuTkpAd2KlWdAjJjVlmKx6FHhYyjplFX15Keuf1APfsZav89GZ
   tqPXx0XX3eBSUPYV4UIU7wfqQAKDd7Wl6ia1EKI1KtgYFiliv5qRmhCcs
   Yd8Xp435zbe5Rr5UeElFWYLFEr1IRYJ5s7cBtWmJZZI1LEeyVC9orpjK/
   5Dd4oDGSRtxbLDBkcSwS3UU/VaOLAKvdQ3X7NJKpLlJcUOkeZmCLhipb/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347093718"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="347093718"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 09:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="755362747"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="755362747"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.34.175])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 09:24:27 -0700
Date:   Mon, 24 Jul 2023 18:24:24 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix an error handling path in
 igt_write_huge()
Message-ID: <ZL6luGRLCEQs0HKG@ashyti-mobl2.lan>
References: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

On Mon, Jul 17, 2023 at 08:49:31PM +0200, Christophe JAILLET wrote:
> All error handling paths go to 'out', except this one. Be consistent and
> also branch to 'out' here.
> 
> Fixes: c10a652e239e ("drm/i915/selftests: Rework context handling in hugepages selftests")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> /!\ Speculative /!\
> 
>    This patch is based on analysis of the surrounding code and should be
>    reviewed with care !
> 
>    If the patch is wrong, maybe a comment in the code could explain why.
> 
> /!\ Speculative /!\
> ---
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index df6c9a84252c..6b9f6cf50bf6 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1246,8 +1246,10 @@ static int igt_write_huge(struct drm_i915_private *i915,
>  	 * times in succession a possibility by enlarging the permutation array.
>  	 */
>  	order = i915_random_order(count * count, &prng);
> -	if (!order)
> -		return -ENOMEM;
> +	if (!order) {
> +		err = -ENOMEM;
> +		goto out;
> +	}

Looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
