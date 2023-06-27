Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0346AEB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jun 2023 05:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjF0Fm2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jun 2023 01:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjF0FmU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 01:42:20 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D6D10FE
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 22:42:18 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3094910b150so4925841f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 22:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687844537; x=1690436537;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulR4ivQIhJ1l/oBTs/p+pGMIWg2ZKFF2T+fQE8UqO7Q=;
        b=AXLCkaknqRPTLvSNzKOecb3LAe7Gqzwk9Y08eXY/CQm2tKL39Ot/35C2r5m2KRBsDE
         utNTFY3htod9Fc2TwFkiwm5KOfxobqxVuxlsxsnhQgtXPSJ4oUUau8hdtQu290dZD7Sz
         V1x76o+ZQ2duyz8gfmt7JaKTzLdDRzhL6hnSFyxX168Fx/6IWS8adntNhrWsMAB4zSIH
         55mgxJF7CUiRmYlGPNdsMusXDXSSkIu/6IosNeAkkF5gNUPQhTQPrmtSNqkmfBlshlXb
         VELZV5Dl8SuXFD7giRJ1ywVFg2OTC6Y4/dKVfVRtcXhOBF1NG5RfjmmIhxiqpkuXb3qo
         dG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687844537; x=1690436537;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulR4ivQIhJ1l/oBTs/p+pGMIWg2ZKFF2T+fQE8UqO7Q=;
        b=cKJ8Xvdf6UiPs9v8/K0OQl8U/mCD+7SazkcwtmBkdzLzHsS5/2/4EltvCoPaSIowzk
         Vgc2Yx5oheCr5kFkNptn8eXHS/qmzhq+W162oeo/G9k9UjG3/jDgPRbG4ut7czZHpC2O
         +nzU9gEuANiWbbZ132wTwRfosM81EUICkGg82uEVd0xS1J+Ge3wTug3ABudpNUtfVJCR
         06h3L4chygQpL0v+QwoLQFUzrBJcNXQVdPGM8klw5I5Pj094+sozYBjN5oCSV9d28B+l
         gIQ/jk16qqhvOeBqTLqBukhXTBjre4WCGKizYngPcrlOk3Z3ByOUBJPBrAp7Je5Jk9S6
         1iUA==
X-Gm-Message-State: AC+VfDyPDiKyJ1Wvq6ymq8v6ZQoCXl6WXIZF91zTREr5D4vOFNsYWYWD
        QRi1tXIVXhGAo2GYFhbHrOmUMA==
X-Google-Smtp-Source: ACHHUZ7Zp5+uRz6d5ee0l1lmoea0gtR6KnNww7WDkTx4AKpOp2uVH4UYxGbkQ7iXjjiQIyIVBhgc7g==
X-Received: by 2002:adf:ffce:0:b0:30a:ec3b:58d8 with SMTP id x14-20020adfffce000000b0030aec3b58d8mr25394627wrs.3.1687844536934;
        Mon, 26 Jun 2023 22:42:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u12-20020adfdd4c000000b0030903d44dbcsm9275843wrm.33.2023.06.26.22.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 22:42:14 -0700 (PDT)
Date:   Tue, 27 Jun 2023 08:42:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] soundwire: amd: Fix a check for errors in probe()
Message-ID: <9863b2bf-0de2-4bf8-8f09-fe24dc5c63ff@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code has two problems:
1) The devm_ioremap() function returns NULL, not error pointers.
2) It's checking the wrong variable.  ->mmio instead of ->acp_mmio.

Fixes: a673a8dfc214 ("soundwire: amd: Add support for AMD Manager driver")
Suggested-by: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Change the variable.  My original fix would have prevented the
driver from loading so many thanks to Vijendar for pointing that out.

 drivers/soundwire/amd_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 08aeb7ed00e1..3a99f6dcdfaf 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -910,9 +910,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(amd_manager->mmio)) {
+	if (!amd_manager->acp_mmio) {
 		dev_err(dev, "mmio not found\n");
-		return PTR_ERR(amd_manager->mmio);
+		return -ENOMEM;
 	}
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
-- 
2.39.2

