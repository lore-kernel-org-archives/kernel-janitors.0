Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556D1EC873D
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 16:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbjIGQ1N (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjIGQ0d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 12:26:33 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D55459E2
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 09:23:43 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bd0d19a304so20705481fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103763; x=1694708563; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFwKknQkIgVeziygM7f8fcopzSN1Ty3LUsYRVOQc1fo=;
        b=OjlIr/bCZWENHrwNu4OvaYD4ucySC6lZ+jjdQD1ZfCffNCYwTNxzaMl066aX35Ncn4
         6a4NGDRmwO3+ofmpjGK0mPunT3ezw0VMpKcHlRvWlvhZ+RfdiFYUUNFKGtWnDjH0WeBL
         8K2MYiHatij9sBc4b3x7vezyxSjPp5KwKe8oJFXikgvpod5sUTu/4pLOG92ftYHvjUx7
         6yZNdiMf/PlY/Fvsefi+VXQsMDgEqi1uwskn6pJi6DFrDznV9v7haF4m/Gni7tSjrUEN
         MAlsKCJcxmxVWneNlKCu+bete68kx3WF/NCLmp1rnR9As4d6Bn0Yujtf7Y5GLn9lHUK0
         woLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103763; x=1694708563;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFwKknQkIgVeziygM7f8fcopzSN1Ty3LUsYRVOQc1fo=;
        b=E3C9WSuCz8VrcX+1KjWrXa1hLQwuDgkSW8n0Yn0DR0niYZiWJP+XE9lK976KRDerat
         nE05klxZ+ZCXuZAATmbnxTn8mZMAcw4tlkakOUmuqM6UwuLCwJwFDW4n9By1GEplht7+
         99dABkEgvuYPw1czhv6qlwrQdHStVGzRz+b1M/ahqH+AIWp3x0qDRoCggCBgvxhUySWV
         TSLP6iVLSzu8Uj5uWONdAEksfK3A5bgQFte0wSFmznmYErOgdLraw7rgPWQCmKGjCocb
         j8M6Ip2SzJJ6sdKGPDBfrUvfXbRLgIKHEWCACEq+zM0XkYpTf+nhQ0JtxOGRT6y3RCK1
         5inA==
X-Gm-Message-State: AOJu0YxXrFpNAq9aSzWWpHyMmUV5gwj3+rHQewzpBFJM2u5NST0wj/cJ
        aq7qgdatFgyVxR1jCiJT9ncunnt6ddCUUVCgWDs=
X-Google-Smtp-Source: AGHT+IH7LwAYk5bN2j2hB6H8pGnORfTqQHKJiXsJKF10TLPkNCZgbFLJyTMJUh+jPrwUJvfzZm7QFQ==
X-Received: by 2002:a7b:ce91:0:b0:3fe:4900:db95 with SMTP id q17-20020a7bce91000000b003fe4900db95mr4383812wmj.37.1694080494181;
        Thu, 07 Sep 2023 02:54:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c3b0600b004013797efb6sm2128337wms.9.2023.09.07.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:54:53 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:54:50 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Wenchao Chen <wenchao.chen@unisoc.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mmc: sdhci-sprd: Fix error code in sdhci_sprd_tuning()
Message-ID: <a8af0a08-8405-43cc-bd83-85ff25f572ca@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return an error code if sdhci_sprd_get_best_clk_sample() fails.
Currently, it returns success.

Fixes: d83d251bf3c2 ("mmc: sdhci-sprd: Add SD HS mode online tuning")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is from static analysis and has not been tested.
---
 drivers/mmc/host/sdhci-sprd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
index 649ae075e229..6b84ba27e6ab 100644
--- a/drivers/mmc/host/sdhci-sprd.c
+++ b/drivers/mmc/host/sdhci-sprd.c
@@ -644,6 +644,7 @@ static int sdhci_sprd_tuning(struct mmc_host *mmc, struct mmc_card *card,
 	best_clk_sample = sdhci_sprd_get_best_clk_sample(mmc, value);
 	if (best_clk_sample < 0) {
 		dev_err(mmc_dev(host->mmc), "all tuning phase fail!\n");
+		err = best_clk_sample;
 		goto out;
 	}
 
-- 
2.39.2

