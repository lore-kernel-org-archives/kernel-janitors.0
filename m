Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4666CC001B0
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jul 2023 15:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjGCPZF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 11:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjGCPZE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 11:25:04 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370E9E58
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 08:25:00 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc587febfso37743175e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688397898; x=1690989898;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOoo0U993ZoETiAnjj1BgJ2aAKdPK1rKF3JmUFNH4F8=;
        b=SBu2AN5iPi5C4xwUtf3Cp/Uywi3LQXjo5gem4+0Em9+EZbabNQKtjrmrItUAk0ZtgD
         k1X5en/dc37ynzZ8bKzaHOJNkYdLk6wEXLHQwRd33TuYagKmENDbFOfw+Tpl00s7mSjn
         HV84Qhox5TmY0ADs1wxtTeb0j3i56ADMzzLAqGvpMC13tHII4MDFY+YVwdoSvho/dUMq
         xM5c7Jk6M+T7laeyuGsBzv6sXplvu7oLqQCa3bQJD2Hp+wQbG6LSf/IP0rNe2cEvRNXN
         0pDGFpHqJCNI/cu9lupYv4zZrgD9wQGRBraOGl6o7ZppOp0iYWYAvagGlunfP2HntOoN
         sVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688397898; x=1690989898;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOoo0U993ZoETiAnjj1BgJ2aAKdPK1rKF3JmUFNH4F8=;
        b=Ig2cwq7X1g5kkn5VzWdVbKVXn3AMdun/AmMl3S3AbZDQMYYJhJ2G8lwSnjrAGTD8xY
         D4y3c1+BDwv9HiPx95bg4VXThfryNSd3I3R45fHNwKzduiFv81BaVm5PQZfD0sdGcs2b
         wghWqTANURzstM0J0kgg+yRXyQnmnuf7d/kiuuqwujpoh8WyegSY6AoS2AuUrLumQTgv
         wrKKuwPijfgzY3WueQ8MmIjZHwg5SVdYWgt7fvkqwZO5C4iPUOCz6N+UJJCNk7hmhOtC
         LK5rMCi+XXq2pEvDAkmA7OTflq1SyfXYuTCqx4dyU9iPnbn2nPoV8cXt/ByF7LmWpMpJ
         edGg==
X-Gm-Message-State: AC+VfDxUAaeNk+X6VIoKkajNzHpA8aeD412PfQNzl46PFqpk39BV09qK
        J/EHKdYPcnDwT3zmzb1o8wGd9g==
X-Google-Smtp-Source: ACHHUZ5eKWRvf+MaKiAVRiNcRmJgJgV0QDRgJsVkcwqbUi1kCfnmwE27UxBo5TK2vTBqvNvRmWy6kw==
X-Received: by 2002:a7b:ce0a:0:b0:3fb:b1fd:4172 with SMTP id m10-20020a7bce0a000000b003fbb1fd4172mr8046842wmc.22.1688397898719;
        Mon, 03 Jul 2023 08:24:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d58e3000000b00314329f7d8asm4571482wrd.29.2023.07.03.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 08:24:56 -0700 (PDT)
Date:   Mon, 3 Jul 2023 18:24:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Petr Machata <petrm@nvidia.com>
Cc:     Ido Schimmel <idosch@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Danielle Ratson <danieller@nvidia.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net] mlxsw: spectrum_router: Fix an IS_ERR() vs NULL check
Message-ID: <16334acc-dc95-45be-bc12-53b2a60d9a59@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The mlxsw_sp_crif_alloc() function returns NULL on error.  It doesn't
return error pointers.  Fix the check.

Fixes: 78126cfd5dc9 ("mlxsw: spectrum_router: Maintain CRIF for fallback loopback RIF")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Applies to net.

 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
index 445ba7fe3c40..b32adf277a22 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
@@ -10794,8 +10794,8 @@ static int mlxsw_sp_lb_rif_init(struct mlxsw_sp *mlxsw_sp,
 	int err;
 
 	router->lb_crif = mlxsw_sp_crif_alloc(NULL);
-	if (IS_ERR(router->lb_crif))
-		return PTR_ERR(router->lb_crif);
+	if (!router->lb_crif)
+		return -ENOMEM;
 
 	/* Create a generic loopback RIF associated with the main table
 	 * (default VRF). Any table can be used, but the main table exists
-- 
2.39.2

