Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFD4C0015E
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Jul 2023 05:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbjGFFwU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Jul 2023 01:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjGFFwT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jul 2023 01:52:19 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD2210F7
        for <kernel-janitors@vger.kernel.org>; Wed,  5 Jul 2023 22:52:17 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso3110925e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Jul 2023 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688622736; x=1691214736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBnIxFbrZYBRg1JLoIaM7oiOzRTygjslunOs97rxcZI=;
        b=ivqjuHVzfLJDn9MOdly8U+ZCr8fLlJmVqX5jfDO++SfAkzezA3eZkBbw3VDEVTr1iw
         I+/NjuSk+iAIaXy9HjGMyE/gXWNwpL4JDhpUDdjcDfML4FOl3IwzbBue9h74hhqjxdAm
         vkF8g/v7iQECp3tB/99sM5pAtuolSI7ZptoprYUfEwSc54VljWIPC1aPWzG3qeRchQsV
         UdMVPTsOERsfk0CSRnI6Ku0NUnR0o0sty4Spr/1oE+uNsddNjwMuHN//E0GfGIxck6VE
         K4L0R7xtKw1hrcHRPtLj2a6NFT487wktqeNm0mzfbN8mxoo0o6ooVcV4sH/j9t0Pg8ia
         QnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688622736; x=1691214736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xBnIxFbrZYBRg1JLoIaM7oiOzRTygjslunOs97rxcZI=;
        b=hUOJK509i3QzuY3UmV0/TXKM3L7IzQRT+P+dC+IJ2OR1H2EHfhjnkxBvXqzU5CuUiW
         zFJhExgFKlXd6fY4kF9VFdn2t5yrM0K6MKSAbbcsK0ov4j8JwN3+FZfeT26cD9w42i+i
         3YrzULvesgj6fqRYFfnP79uLmPuVi4L+6LIl1u5Ofi93dkMPYF263LMa/03EG7stAT9r
         MURY++2/h82e6SDL1CDZQW7DtQSDCaZISpf3ywrZ8YUQIiwLJ9vWLxpksQR77JvHqCm7
         KKd9fD/4lFq3Wa9w2yJU2M7oCR85RqNI6oLJpzQMBeeOe7fKGKsHa05vmK7nJKpp7ySn
         Bwsg==
X-Gm-Message-State: ABy/qLb1/Zk8tqjLl6gxw5cpvZTbTbJlLBVU8pvz0iYshcN3TwA2XnZ3
        JT4r1uLqsrapC2gdMA+kixD+VyNc0r7jCO8J8O8=
X-Google-Smtp-Source: APBJJlEdnT5CsfLEze+SxP6AZhI5PIAj9Jkcr7yKYANPXjaEGIK5uo87cktbva2hd8k6ClKAQd1dJg==
X-Received: by 2002:a05:600c:ad8:b0:3fa:d160:fc6d with SMTP id c24-20020a05600c0ad800b003fad160fc6dmr481579wmr.30.1688622735764;
        Wed, 05 Jul 2023 22:52:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c029300b003fbe4cecc5fsm977367wmk.34.2023.07.05.22.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 22:52:14 -0700 (PDT)
Date:   Thu, 6 Jul 2023 08:52:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf: fix an error pointer vs NULL bug
Message-ID: <694691bf-f591-4286-a615-df91d2ebab93@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The __dma_fence_unwrap_merge() function is supposed to return NULL on
error.  But the dma_fence_allocate_private_stub() returns error pointers
so check for that and covert the error pointers to NULL returns.
Otherwise, the callers do not expect error pointers and it leads to an
Oops.

Fixes: f781f661e8c9 ("dma-buf: keep the signaling time of merged fences v3")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma-buf/dma-fence-unwrap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index c625bb2b5d56..d183eda0db89 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -94,8 +94,12 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	 * If we couldn't find a pending fence just return a private signaled
 	 * fence with the timestamp of the last signaled one.
 	 */
-	if (count == 0)
-		return dma_fence_allocate_private_stub(timestamp);
+	if (count == 0) {
+		tmp = dma_fence_allocate_private_stub(timestamp);
+		if (IS_ERR(tmp))
+			return NULL;
+		return tmp;
+	}
 
 	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
 	if (!array)
@@ -176,6 +180,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 
 return_tmp:
 	kfree(array);
+	if (IS_ERR(tmp))
+		return NULL;
 	return tmp;
 }
 EXPORT_SYMBOL_GPL(__dma_fence_unwrap_merge);
-- 
2.39.2

