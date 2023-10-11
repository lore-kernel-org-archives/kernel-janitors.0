Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D14CD98FA
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Oct 2023 08:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345420AbjJKIBa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Oct 2023 04:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345393AbjJKIB3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Oct 2023 04:01:29 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80C191
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 01:01:26 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-406619b53caso60986765e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697011285; x=1697616085; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6DPOMkbV8m1dOR5Sk90YZJLjnmUA8RGbfyNkiDIQZzk=;
        b=cmwhYQMDZS4ukxRrOweuD7fRE7FQcGmo/x81tQgfZ8DT8w/CwNXMtdzz7sArkA4RTl
         wWxGnz8sY2yIE7uUBk9uTMCPV6D/Rx7ck60Oj6EXL9OIRnQs2hFNeOvQbpZ8JbT9laVO
         iRrc9rSKp5cyYD/A7pNIeCrpIxoEd3t8QBa2c5iB5ZEo2XNwSxKLcct25+TZ5+yMoV2l
         xC5ZD+MGdZIkK7QBEDoBjmVBLnQWPVM4yZ2lMmGOEZsoo0DzqVmvNQrxY4Kj4Zumk6od
         hylg4jFjb1PjC2dwuohlg6fPrvEs1Rfh5zeP4694Mk8u450o9ZadPnRp37BfKhPNcWvH
         SYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697011285; x=1697616085;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DPOMkbV8m1dOR5Sk90YZJLjnmUA8RGbfyNkiDIQZzk=;
        b=vqfqOkt4LCaby6msr1x2LAqXZuyTfvfibOAt8lfWdZZ0e5/jt1F4qz2ldG0bqipLKb
         OB4hkhGszFPmUAIJqldq/gVTLbTDc+GWHsgOsJjmPx18jAjT/NsMUvzlGXNMhOTsElxr
         e/yFvplqXYHWex5Xe3EVfa7AlEMaWMq1UdhgibLhwyTFQKwMzrkWIHUzeHomeQmOMj3i
         BmMEEpuQ6XnARdgFQ3aSOnSoWPALy2YScTR75rszol0wxUVIAyyCajmkZVuHoAal2Nz2
         U0zcDS62Wlo9WKHhGDJvCBuMeUFLx3m3If7Ul4++wfTJT587TWOw0uXj7e8DoRiIqifm
         DBCw==
X-Gm-Message-State: AOJu0YwzqQ5hFYEpXTC9pKL0VENopsjA6R8GyC8IYmeVQzpoAcfW8D5x
        fyzmPFF/0vrCekpTKqj/QVRtqQ==
X-Google-Smtp-Source: AGHT+IE7TrMElZ+MD00E1lGL1rYFkYEf2CQuJZ7ft6WMMefYmJIMZYoJAQLIUtkDtLsxIDRMMlS7aQ==
X-Received: by 2002:a05:600c:22cf:b0:401:4542:5edd with SMTP id 15-20020a05600c22cf00b0040145425eddmr17894937wmg.34.1697011285253;
        Wed, 11 Oct 2023 01:01:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c3b9000b0040684abb623sm18613958wms.24.2023.10.11.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:01:24 -0700 (PDT)
Date:   Wed, 11 Oct 2023 11:01:21 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu: change iommu_map_sgtable to return signed values
Message-ID: <06672b96-23fd-424c-8880-1626e7bf119c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The iommu_map_sgtable() function returns ssize_t and negative error
codes but it's declared as size_t instead.  I think that static checkers
would have complained if this caused a bug, but even though it doesn't
cause a bug, it's definitely worth fixing.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 include/linux/iommu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 0c4d8ae985ac..b5b254e205c6 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1118,7 +1118,7 @@ static inline void iommu_free_global_pasid(ioasid_t pasid) {}
  * Creates a mapping at @iova for the buffer described by a scatterlist
  * stored in the given sg_table object in the provided IOMMU domain.
  */
-static inline size_t iommu_map_sgtable(struct iommu_domain *domain,
+static inline ssize_t iommu_map_sgtable(struct iommu_domain *domain,
 			unsigned long iova, struct sg_table *sgt, int prot)
 {
 	return iommu_map_sg(domain, iova, sgt->sgl, sgt->orig_nents, prot,
-- 
2.39.2

