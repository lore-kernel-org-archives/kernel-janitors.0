Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57BCC7EE26
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 May 2023 19:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbjESTnT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 May 2023 15:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjESTnS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 May 2023 15:43:18 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FFDE5D
        for <kernel-janitors@vger.kernel.org>; Fri, 19 May 2023 12:43:13 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3063891d61aso3462451f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 May 2023 12:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684525392; x=1687117392;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7jXzBlv/x7knTLTZdsLaKRxP5YKCfI/UXXz7YCoBcM=;
        b=AAMELdw1xlnh4GC6SpyFNwIYZQ5R9G3EWmccd9Cxd60tUlESVZ7mnnAstuqu3fSEFl
         la1heueb27DGnNSC7ZjfouoB5el3sO46TXpJXLE7cV6HCXo3T4HmJa7/Y7IODVpubD3u
         XcBWObJj/odhut67KgjlDRnVUZEMXSu2iosu4G9oqQQoLdSkgpwVIJCIoPhlQ6ah1LMv
         cDpD55jSRg+hWivaNtJnYyQwnleuMvxAl4zmuoIYDySUvh8t7p61vZiQ4lyUJJhAf8H0
         EzA9YnflDWtxhCBk6AkHCfbWV3ISIPoeRpZbmd+XhdgHi3XXnOA0ZL5V2sx7lkCXTsv/
         dnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684525392; x=1687117392;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7jXzBlv/x7knTLTZdsLaKRxP5YKCfI/UXXz7YCoBcM=;
        b=Tj58r89ABLrivsqTo5nDOsbVSv0GTfYm4m8L1motek0YgADg3d6wB3HwkSC54dxtv2
         YoAeHMZcsz5JeuBUP/qDkULSNHxf+ngSahDAxfo/zf7vxYNgmUI4mKMTEHjlZCRQ6WdV
         Ibex1K4SJdi8mU0Y/2TBIb75PoPIGwB7buE/dEIsbxto3gw7W/F2NqPG9Eop2b5xYMRG
         7Jzhm/DTCCvZCrYT5TBhLokz3H9z1hkHGgzaG2XinC0b15E3Z0PCG0tfhBYWuvKsUf+w
         Ro6aA/Ux2uwRANfbeNv6eRuIKOOFUBrp+iJ9XwocS0h6uhcyysbH1U4xkj/Na195sjvn
         85gw==
X-Gm-Message-State: AC+VfDzfnYDsh44aPrliTEcT73rGpCH7Z6nxlLGS3Ar1epo2gTFpYPzv
        R0RGNe7Dy7nV4AKCGrJ8EzangA==
X-Google-Smtp-Source: ACHHUZ4Dldx3i06cCQyq05HLtiBc9WOfjvyjvCQsAw5LF/bDperqlV+k+zCeVD/Ej7ZkEZzfElsqEw==
X-Received: by 2002:a5d:6091:0:b0:306:3361:6cbf with SMTP id w17-20020a5d6091000000b0030633616cbfmr2476488wrt.21.1684525392266;
        Fri, 19 May 2023 12:43:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6442000000b002c70ce264bfsm6149863wrw.76.2023.05.19.12.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 12:43:09 -0700 (PDT)
Date:   Fri, 19 May 2023 22:43:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Eli Cohen <elic@nvidia.com>
Cc:     Leon Romanovsky <leon@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Shay Drory <shayd@nvidia.com>, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net RESEND] net/mlx5: Fix check for allocation failure in
 comp_irqs_request_pci()
Message-ID: <ZGfRR//to6FusOLq@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This function accidentally dereferences "cpus" instead of returning
directly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202305200354.KV3jU94w-lkp@intel.com/
Fixes: b48a0f72bc3e ("net/mlx5: Refactor completion irq request/release code")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
---
I sent this earlier, but it wasn't applied and the kbuild caught it.
https://lore.kernel.org/all/6652003b-e89c-4011-9e7d-a730a50bcfce@kili.mountain/

 drivers/net/ethernet/mellanox/mlx5/core/eq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eq.c b/drivers/net/ethernet/mellanox/mlx5/core/eq.c
index eb41f0abf798..13491246c9e9 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eq.c
@@ -824,7 +824,7 @@ static int comp_irqs_request_pci(struct mlx5_core_dev *dev)
 	ncomp_eqs = table->num_comp_eqs;
 	cpus = kcalloc(ncomp_eqs, sizeof(*cpus), GFP_KERNEL);
 	if (!cpus)
-		ret = -ENOMEM;
+		return -ENOMEM;
 
 	i = 0;
 	rcu_read_lock();
-- 
2.39.1

