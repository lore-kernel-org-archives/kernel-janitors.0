Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D93C433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 11:29:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EA4F611AC
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 11:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhELLaU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 May 2021 07:30:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:50243 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230129AbhELLaU (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 May 2021 07:30:20 -0400
IronPort-SDR: 51dysQ7HlNvtZpMwFnpWP1ixc0Lm3JqB+9LcfBmibyu2FWErsBdNnQ6/lmdNNzJm3Jv4nJ2yFr
 oJBe3ydIDSbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="197704439"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="197704439"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 04:29:10 -0700
IronPort-SDR: vwofc9blLuvCRT9viNRVuUK/G8JMxsKeOxUm5riZ8qhbhvDb54JzXUlmw5gcTTu3O0RyADrPf6
 nI27Ri5F/i2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="622370632"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128]) ([10.239.159.128])
  by fmsmga006.fm.intel.com with ESMTP; 12 May 2021 04:29:08 -0700
Cc:     baolu.lu@linux.intel.com, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Xin Zeng <xin.zeng@intel.com>,
        iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/vt-d: check for allocation failure in
 aux_detach_device()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Liu Yi L <yi.l.liu@intel.com>
References: <YJuobKuSn81dOPLd@mwanda>
From:   Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <df451f5a-87e6-b101-a7f0-cb24d85fa7ca@linux.intel.com>
Date:   Wed, 12 May 2021 19:28:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJuobKuSn81dOPLd@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/12/21 6:05 PM, Dan Carpenter wrote:
> In current kernels small allocations never fail, but checking for
> allocation failure is the correct thing to do.
> 
> Fixes: 18abda7a2d55 ("iommu/vt-d: Fix general protection fault in aux_detach_device()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/iommu/intel/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 708f430af1c4..9a7b79b5af18 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4606,6 +4606,8 @@ static int auxiliary_link_device(struct dmar_domain *domain,
>   
>   	if (!sinfo) {
>   		sinfo = kzalloc(sizeof(*sinfo), GFP_ATOMIC);
> +		if (!sinfo)
> +			return -ENOMEM;
>   		sinfo->domain = domain;
>   		sinfo->pdev = dev;
>   		list_add(&sinfo->link_phys, &info->subdevices);
> 

Thank you!

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
