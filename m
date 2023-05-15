Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83337C77B7D
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 10:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240485AbjEOKcp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 06:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjEOKcn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 06:32:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FD8109
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 03:32:42 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f42c865535so68681125e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684146761; x=1686738761;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyq2IDVQ8Koxb8i2Fqds+u7dIPO9GBSy91tKXS3ElHY=;
        b=yj6O8zJNOUW/ETGrMs0yLzMrtGjBSsNxkxjvW7yzXZuKo2B4XuPA4HnpeS1vhWUcmO
         FGBvSKwtUbO6zvfKYkqtjVRZABuLPJwkIOcCtPyOshWLjY4pJmBonTaE3Wa/WItuazGE
         0AdYB/L4kNU5SEWpswEVfjqn3gPP3qOwNdih079JFtTaws3KeA+fxOu0s3DkqYEtY0Rh
         Sy2tpu3Ec+AJAfry+2VdsKtPV/XcQtole9Dh4/aPoNAiINd1GpL72m1g1D5QNr8SSz2z
         qrPuwRIsKfrxC7STQPDI//VSnFXomDle+4Naok5DjUF0c0YrDoHl6L21rBgLB8qB850B
         sU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684146761; x=1686738761;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyq2IDVQ8Koxb8i2Fqds+u7dIPO9GBSy91tKXS3ElHY=;
        b=gy330ARfqQmf5RoMfrOF7j9WltOe5QyKt6jzqRv1CxobmjfrYO9zQNV6PN5qWPXT8J
         0QGRYZcrKUZml1OsvTwSok7W9wXVd6M8MEayD6TvxcFSyhTdq2P2PF7wzSoc1XVgrqac
         /S4LOsXVBItCyC7InHhLjQ/Sg1Y6OBhZtVQJDNEK0jDJCvOYS4IVRQjGHP2N5B/uHTmo
         SbHXtrcI4ZHY6QV6ZvKiDJs4AeG6weHtGWQFQ2Yg4BKVpGqoSOiGkeuTWWzETKTa+h0q
         tkDVYbYOfJxjXVd1QgyoSQe6trbXNr5yVVd/b/ER7WtMAoK0vWifwc3O9fY7iCVoFCtp
         3Rcg==
X-Gm-Message-State: AC+VfDxjIMAJC0KjPTJVaA7/GL6POhviobYbQ43IyBfLZfRX6VL/H+Ao
        aGVaOcNwJs5osj7s03ejYGlpNg==
X-Google-Smtp-Source: ACHHUZ4TgXPxC0zkVIx75a/IOzdlhMLrQ37Io5cC3z8fgmckuGx+5HOS+nK0YularrQ00wuHI/QHsQ==
X-Received: by 2002:a1c:f202:0:b0:3f1:75b0:dc47 with SMTP id s2-20020a1cf202000000b003f175b0dc47mr24014950wmc.15.1684146761099;
        Mon, 15 May 2023 03:32:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p14-20020a1c740e000000b003f420667807sm26612570wmc.11.2023.05.15.03.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 03:32:39 -0700 (PDT)
Date:   Mon, 15 May 2023 13:32:37 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Shravan Kumar Ramani <shravankr@nvidia.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/mellanox: mlxbf-pmc: fix sscanf() error checking
Message-ID: <4ccdfd28-099b-40bf-8d77-ad4ea2e76b93@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sscanf() function never returns negatives.  It returns the number of
items successfully read.

Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index c2c9b0d3244c..be967d797c28 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -1348,9 +1348,8 @@ static int mlxbf_pmc_map_counters(struct device *dev)
 
 	for (i = 0; i < pmc->total_blocks; ++i) {
 		if (strstr(pmc->block_name[i], "tile")) {
-			ret = sscanf(pmc->block_name[i], "tile%d", &tile_num);
-			if (ret < 0)
-				return ret;
+			if (sscanf(pmc->block_name[i], "tile%d", &tile_num) != 1)
+				return -EINVAL;
 
 			if (tile_num >= pmc->tile_count)
 				continue;
-- 
2.39.2

