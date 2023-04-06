Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC244C7618D
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Apr 2023 08:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbjDFI4X (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Apr 2023 04:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233973AbjDFI4W (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Apr 2023 04:56:22 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152ED4EFD
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Apr 2023 01:56:21 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso3211194wmo.0
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Apr 2023 01:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680771379; x=1683363379;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9Kdnu6pWU6JngfT3ASHVDK3Q32SnxG/gqB2Vtaw6uE=;
        b=UbQmeUNaGxqXV8cdupXlUOSJ1lkWClQr2ZiZRedNp0nBYQeKzEA4Ml4c3TGZpx7te3
         Va8EX3exUgL4dZnmcFFQ7vVFMKT1fSFc4zlY5czZ/czINhmbptwL/YpBNaoue+ox7gSo
         9MueZF3tMcsZaGmnGyWomB6EjP0eXz369Z4TO6L+dO4xG8psxPM+34ssHFQfMUAXfCkT
         uaSr77WKKCzbDs2E6AboSq2B/vPHcxnta0goVmoeHuVd82q8Nux/h1MTeFE5JnFsWhaQ
         8kkYpUYXLGA+AaaCVf0rMLLjKEU7ACFpywK+l1BK5I34vhV6OdE4v/tdgZXMqi8ttaEC
         AIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680771379; x=1683363379;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9Kdnu6pWU6JngfT3ASHVDK3Q32SnxG/gqB2Vtaw6uE=;
        b=Ht64pdsBxboDOkaTQGdTjGgFKZM7wl6Kbtdxh29NRAu5i0zu+KPy8uE3tW9Md42Qfj
         V/8teOvlPXkdr6DpOCozMISy5D/5jLtprHOsobxCsJV/HcCMZp1Oa+4OsVdu144n2be9
         CYsGXXTsv77u3ITuadqbKbgIpeR16CWJ4/s8qlbm78x/JTP35gbdYkD26wvx7i+yoFJW
         miqNXEbRFUwTE82nMARlkJuxgIvM0W88FuHvABNS4DalnQG27kIYUjljE5FOA88SGeUH
         THPQEznZKxfBXJ2BulEn1mlCbbPGd3z+wxjMpjdfj/OJ1FrsPWsrJIv9kCt0kO6vxN9k
         oujw==
X-Gm-Message-State: AAQBX9fXTpywA0aA5MbHhmb4oiO2wZmXptdSEyAgFAVJMkLgpYgyxZAb
        cLo7LqEd+lNpDegujTy8JpA=
X-Google-Smtp-Source: AKy350ZuxTCGF6FAybs+H9pOieULS+SaRroYklAtuYdOERGcF4RL65O7ukIKRncyeouzdv6vz9jBuA==
X-Received: by 2002:a05:600c:254:b0:3ee:2552:7512 with SMTP id 20-20020a05600c025400b003ee25527512mr6402080wmj.13.1680771379290;
        Thu, 06 Apr 2023 01:56:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b003ef5b011b30sm1001876wml.8.2023.04.06.01.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:56:18 -0700 (PDT)
Date:   Thu, 6 Apr 2023 11:56:14 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] soundwire: amd: fix an IS_ERR() vs NULL bug
Message-ID: <3be30516-a1b0-412b-8379-06011855e46f@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The devm_ioremap() function returns NULL on error.  It never returns
error pointers.  Update the error checking accordingly.

Fixes: a673a8dfc214 ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/soundwire/amd_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 9fb7f91ca182..9bb8ae8c5f32 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -910,9 +910,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(amd_manager->mmio)) {
+	if (!amd_manager->mmio) {
 		dev_err(dev, "mmio not found\n");
-		return PTR_ERR(amd_manager->mmio);
+		return -ENOMEM;
 	}
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
-- 
2.39.1

