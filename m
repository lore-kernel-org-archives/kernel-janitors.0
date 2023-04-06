Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A3AC76196
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Apr 2023 08:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235582AbjDFIzj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Apr 2023 04:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbjDFIzi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Apr 2023 04:55:38 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF97526C
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Apr 2023 01:55:36 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l27so38766673wrb.2
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Apr 2023 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680771335; x=1683363335;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7txVTxf4VgSRpVhYeEkO74+1AKmp0Ykpq11aY2byhk=;
        b=pfSmWPO3N8Z/GMBw8IydKi0iku0P+O92dK5LhpN58P47xOQXIptsOGaSs9neEUJKqg
         BOvkLDw9p0MMvadI/+5TNgKRLp1tMpJQoAQNULZd87C2us2gw0HoU91U9glatgdoji3x
         9TlRNAkRVec20j2pmoLrXk8B8fORaTh0t9LkFk0HpJO8X0YYQuYZ6++KCgGKC5/ENzHB
         jP13FmuPYy5bKSMyPj3juqOfmunMPAp3tr72ssJtkpw7cLlCw4orS56fatTW07UQMsME
         //l9E1BODxBE9qw/CfFDEFqCLgEwcwiWBC5hT0gyIkdTxnY9PjfsRnDIBYaqZHD8d4N4
         6wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680771335; x=1683363335;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7txVTxf4VgSRpVhYeEkO74+1AKmp0Ykpq11aY2byhk=;
        b=Z7cShcNQaGWxsBwx+PSrc094k0xLRCjfO237JvWVItCWP5JDxwv4Jn/fDS7Qdg6XGF
         4Rivr3bOYMb6Di98UW6F96FUfGY42jVRGSusgeDyJQniY6uZ47ra2p+OgsNZl5JC016V
         VtfKetL3eKOnGr6avtHHWISvdYvlxvLofVjKOetBvBGyVoLum2/7Pao2qayqJo/eSEB7
         xXUjFXUZMZCjKB/hfTh8jMSsiVvPAstbSkTSZSZUIWDRi4ZCoSiSwIgZ643j1AF/QuRs
         xb66oUWfO/cc9RZrQDygbXY5WwRzNibM/kGYO9bokLO4SB8Hew6BqEkrTCDmXM5kTrWm
         L5Hw==
X-Gm-Message-State: AAQBX9cfUM4/Q2w7NJyocvvIiG4o0lLxBh6Gc9FSob6WFnm7sVTEDQdu
        w8V5YRomH5z2a8fK6XWT7MXJmq0QRWI=
X-Google-Smtp-Source: AKy350Z/yqy0Ka8rHZ160xapJkbWkSFSsDNx8JryjDJ7M1zdz/g42+5DgPJhbaWIUQAq5RLttaL6jA==
X-Received: by 2002:adf:ef03:0:b0:2e4:ff71:1c8e with SMTP id e3-20020adfef03000000b002e4ff711c8emr5681057wro.68.1680771335087;
        Thu, 06 Apr 2023 01:55:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b5-20020adfde05000000b002d78a96cf5fsm1147318wrm.70.2023.04.06.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:55:34 -0700 (PDT)
Date:   Thu, 6 Apr 2023 11:55:31 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/sva: fix signedness bug in iommu_sva_alloc_pasid()
Message-ID: <6b32095d-7491-4ebb-a850-12e96209eaaf@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The ida_alloc_range() function returns negative error codes on error.
On success it returns values in the min to max range (inclusive).  It
never returns more then INT_MAX even if "max" is higher.  It never
returns values in the 0 to (min - 1) range.

The bug is that "min" is an unsigned int so negative error codes will
be promoted to high positive values errors treated as success.

Fixes: 1a14bf0fc7ed ("iommu/sva: Use GFP_KERNEL for pasid allocation")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/iommu/iommu-sva.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
index c4ab3c457fbc..6e4f1ba1c148 100644
--- a/drivers/iommu/iommu-sva.c
+++ b/drivers/iommu/iommu-sva.c
@@ -33,8 +33,9 @@ static int iommu_sva_alloc_pasid(struct mm_struct *mm, ioasid_t min, ioasid_t ma
 	}
 
 	ret = ida_alloc_range(&iommu_global_pasid_ida, min, max, GFP_KERNEL);
-	if (ret < min)
+	if (ret < 0)
 		goto out;
+
 	mm->pasid = ret;
 	ret = 0;
 out:
-- 
2.39.1

