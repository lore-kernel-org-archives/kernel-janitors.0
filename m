Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CE3EB64DA
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Jul 2023 13:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbjGNNCC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbjGNNCB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jul 2023 09:02:01 -0400
X-Greylist: delayed 491 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Jul 2023 06:01:58 PDT
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 12E0C12E
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jul 2023 06:01:57 -0700 (PDT)
Received: from 8bytes.org (p200300f6af03f600fd690381fa83412b.dip0.t-ipconnect.de [IPv6:2003:f6:af03:f600:fd69:381:fa83:412b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id E4E6428012A;
        Fri, 14 Jul 2023 14:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1689339224;
        bh=lkD8TmGSRaY9Zn5gN70FLIyunGvFhzFcj6rPT2CTADs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nk40X6UxAFy1QYjV+Tqa3NJSjxL/7dRhvbgOy4nzdUSEZHB2mOrzIXVTsam89YBuK
         FMRFrGj8gs9EtFUTCo2kRB6At0LWM3i18glYtI2DKoazhu4dlo7JhrZFRoduOxHfbW
         sVbxqpxbS3Lhgnz1BgUpIYyIP7+r8zhhR2IzD9IZ0cK8YTMKHjDunj5r/+HowrRI3W
         w8omSGtALWCOQncKIREdMEPT7VWFUEXhb7Th3s63s33X3VDmbEpg6eZewTAzZoBwpE
         B704qtCUuysOtNCgK7/pZCayRikFZgBXv55BrzyRfwaGb4Zi7qHFquzEM1TKo1K0+K
         7hd+ZIW+2q34w==
Date:   Fri, 14 Jul 2023 14:53:42 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Dan Carpenter <error27@gmail.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/sva: fix signedness bug in iommu_sva_alloc_pasid()
Message-ID: <ZLFFVrGB3hjZhr2B@8bytes.org>
References: <6b32095d-7491-4ebb-a850-12e96209eaaf@kili.mountain>
 <5e474464-34ee-414a-8eb3-b11e74540b14@kadam.mountain>
 <20230710092713.GA32673@willie-the-truck>
 <5574a5bc-e108-4206-b189-03ec79bc08ec@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5574a5bc-e108-4206-b189-03ec79bc08ec@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2023 at 12:34:19PM +0300, Dan Carpenter wrote:
> I should probably resend this?

No, just applied it, thanks.
