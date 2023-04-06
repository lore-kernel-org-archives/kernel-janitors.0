Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91949C7618D
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Apr 2023 13:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238566AbjDFNXY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Apr 2023 09:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238481AbjDFNXU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Apr 2023 09:23:20 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCE3A244
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Apr 2023 06:22:42 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id he13so2977380wmb.2
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Apr 2023 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680787360; x=1683379360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/VYyN4aT+7RK5+5vhV35MtnDLhdcOUHlRDMz2RR5gU=;
        b=B3eZbsNbKGWQAJbXPzGoKnejdO/W5SfNNme91c4rMGOOqhplK7Uw8TVYYZFTINVjDw
         VVLx0puCCepl5DRrmAw028+P78garpg/EUjYXYASf8Jsvgty2GixhBs3ihem8qhGqpra
         Xv9KkZ1LweoIvWvRC2MQDpQd81UndDBGVxJYRioXbCRPCnpeuRIAFZKNRmUnW9EJPnPA
         s/uyqR3xtSjCcpdv5yWYb1IsnfOz6aKyFJxLF5TpdwV1pXsdAt13/6mNs21fZL2ml7L/
         uTMrC51NRU64pIvvwMZwo9laHGHnXFxr4ayh5dIQJojcqKqSZ4PgzYEZULd5Gyx+oXb6
         uxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680787360; x=1683379360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/VYyN4aT+7RK5+5vhV35MtnDLhdcOUHlRDMz2RR5gU=;
        b=T5adVO1CoJr3kaYZoVIrJmT8oX3/bkSWM5gy9thgNqsBJGA3oyrHfEwXGkPCvDQm78
         ruMzzellFflPkss+Sdct9pGS/e8Xp5cG/2ybGS9uujoGGlvdMBsdwLB01u7F9wXHSdfU
         rVkUKJ4TX/3gXJXdfbo6NNIijO3X49ydxIanzzsGlAzYX69nb3iGgbtAcp/1cd8em1Xb
         AgrJCTuVVhpEDLRPqJiG3tvyKfSbtudWRCIUHdHXZDB3xfwPm5uGR/7vNBNK5IDPFgh6
         LaIdbg2rMVQTHgSN3Q1K+sonJgNuNStvbC/geO2ALLwrNeSwD3g/ZC5vSOCJUgZz67Z9
         ADkg==
X-Gm-Message-State: AAQBX9fXWQfdGkyJ2WTgZKrwjQrClaHIkjXIA1B76vFwGbjOgpc4Ncm+
        oJ4hJQ5xXXxrljFo9XE26uu5Pwuv+Ac=
X-Google-Smtp-Source: AKy350YZMoIKdCj1u6EHAJQP8zd+E2hjVkrncP2e/RmCEx2iHfjygYP87A64w6u3/kxnUuNVdDpUwA==
X-Received: by 2002:a05:600c:3644:b0:3eb:42fa:39d5 with SMTP id y4-20020a05600c364400b003eb42fa39d5mr7373848wmq.29.1680787360435;
        Thu, 06 Apr 2023 06:22:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c19cb00b003ede3f5c81fsm5411989wmq.41.2023.04.06.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 06:22:40 -0700 (PDT)
Date:   Thu, 6 Apr 2023 16:22:36 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] soundwire: amd: fix an error check in probe()
Message-ID: <390287d1-ddce-4414-873d-44ac0186a14c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code is testing the wrong variable.  It should be ->acp_mmio
instead of ->mmio.  It also should be a NULL check instead of an
IS_ERR() check.

Fixes: a673a8dfc214 ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: My first patch just fixed the NULL vs IS_ERR() but because it was
using the wrong variable that broke the driver completely.  Thanks,
Vijendar for finding this:

Fixes-from: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

 drivers/soundwire/amd_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 9fb7f91ca182..21c638e38c51 100644
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
2.39.1

