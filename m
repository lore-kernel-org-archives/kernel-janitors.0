Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A38FC76196
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Apr 2023 13:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236677AbjDFNE5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Apr 2023 09:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDFNE4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Apr 2023 09:04:56 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B30123
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Apr 2023 06:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680786295; x=1712322295;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4m7lbwkH0xe8YoItCdZMQ65J4/rvO42XX0WYtA2Hflw=;
  b=PC9HybBJuIo95A4oPzIZNvMA42EM2HkjXn1gXP7XctSy3VivMaNtaJHH
   1aS4R8t4aclmsvOP7cPV1y4SKl6FPYMX4FgLtf6TtLQk/bN4dyqC8iS47
   YWuo/KP+mzUZw2IDblyRFkTOhUFopqYoEBAjeVABQglF7YtEcf5JxXuJ0
   7pJp5u9Z8t4DM3Mp1hRVQ3i5lWfJKFog8bQCo99Tpzphr4jCP47akn0Sd
   KTF7pDyq1InX6tbrKfIkqQ5W9YYsrPiHso4G/HI0iG3LPVly060Bzq+DP
   pMgJ7TBx+IC6NROjLEj3LmEnXhFgg1kdoZ2r+ztpZ0E+mzBwimX+agY2f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405524075"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="405524075"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="687115398"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="687115398"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.31.177]) ([10.255.31.177])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:48:03 -0700
Message-ID: <ac9ad124-8cfc-e0af-bf7c-5cbbee48a695@linux.intel.com>
Date:   Thu, 6 Apr 2023 20:48:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Cc:     baolu.lu@linux.intel.com, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/sva: fix signedness bug in iommu_sva_alloc_pasid()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <6b32095d-7491-4ebb-a850-12e96209eaaf@kili.mountain>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <6b32095d-7491-4ebb-a850-12e96209eaaf@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023/4/6 16:55, Dan Carpenter wrote:
> The ida_alloc_range() function returns negative error codes on error.
> On success it returns values in the min to max range (inclusive).  It
> never returns more then INT_MAX even if "max" is higher.  It never
> returns values in the 0 to (min - 1) range.
> 
> The bug is that "min" is an unsigned int so negative error codes will
> be promoted to high positive values errors treated as success.
> 
> Fixes: 1a14bf0fc7ed ("iommu/sva: Use GFP_KERNEL for pasid allocation")
> Signed-off-by: Dan Carpenter<error27@gmail.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
