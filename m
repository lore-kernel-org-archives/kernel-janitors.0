Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAEDCDB46E
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Oct 2023 02:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbjJLCKc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Oct 2023 22:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233794AbjJLCKb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Oct 2023 22:10:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BEE9D
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 19:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697076629; x=1728612629;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t1vIK7JXKv8WT99rVeioMzC8BuOwbIY4b9dnxtFA/lU=;
  b=jGv8aWn3dhsEFod4u4bJXBV02O6VR/txCWazMvRT2HujMVtjcoczLrM6
   EawsEVrB3PARSaMDkd18RuhMaDP7VwovarDDkx6gXiyQdfUtzh+brM3ul
   /cUY8jFfaSbmfvmILI2A6AaeEIGCr0Wv/uKAj5nhYrooNOK4mMNhT+c6V
   OvFZsq0Nnw2Ai37LVy5/u+zzCUqAn2j4JZXjdhsSJugAB5Y/a2GjH+2dH
   K6XAq258vqUqGMcx3XuR1f/8Kww2v/qJTK4gF5P8QbASMLPbMx6qN2415
   wrBC0qP4vZOAkEsh6HmBGDL4Srv3Xgw4fQlqp60fLlGZWyV642wR7AmZ4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="365087264"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="365087264"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 19:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="754061834"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="754061834"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127]) ([10.239.159.127])
  by orsmga002.jf.intel.com with ESMTP; 11 Oct 2023 19:10:25 -0700
Message-ID: <3252ab70-10dc-4eeb-b566-8a89c6b4abac@linux.intel.com>
Date:   Thu, 12 Oct 2023 10:06:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc:     baolu.lu@linux.intel.com, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu: change iommu_map_sgtable to return signed values
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Joerg Roedel <joro@8bytes.org>
References: <06672b96-23fd-424c-8880-1626e7bf119c@moroto.mountain>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <06672b96-23fd-424c-8880-1626e7bf119c@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/11/23 4:01 PM, Dan Carpenter wrote:
> The iommu_map_sgtable() function returns ssize_t and negative error 
> codes but it's declared as size_t instead. I think that static checkers 
> would have complained if this caused a bug, but even though it doesn't 
> cause a bug, it's definitely worth fixing. Signed-off-by: Dan Carpenter 
> <dan.carpenter@linaro.org> --- include/linux/iommu.h | 2 +- 1 file 
> changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
