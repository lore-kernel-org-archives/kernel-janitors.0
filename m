Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8E4C001DB
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Aug 2023 19:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjHHTua (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbjHHTuP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Aug 2023 15:50:15 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36A2A2BE
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Aug 2023 09:56:38 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe5c0e587eso21724785e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Aug 2023 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691513797; x=1692118597;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRMNIql4h6i50DoW9rO+SQKBVq3u6OMyHVjggvsaHiY=;
        b=XJ2thEz0926gfZVa9/5N5jbPRnjXXRkiBNzaRqSvNHfw5jX8HssZTwycUzJ+lApX0C
         Btnibd0oBAZXuoKhIMu9U83aOhzR6NzfeoSCdGwSnyUTC2VNf09i78HeFAo8YTuhoAbB
         AvXn5HTtMddwnXllJ2R+dmsjRAioBttSxC3LJB8rPEasZJdkd26ggAsSWZEm1MfPEDLW
         Hr/fibkl9SP0FzUWJy4gxD+6DQ/krqFPPUjbb4Yav+knfF57mrXLEqAy6JsQo5dDtx2j
         ZDnycyhvfJaagKPDRYV88KfUD/yGDW0KAvE/UTFoWmIEdgZ3D+jKuMhnEL6nbLPoJz8T
         VZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513797; x=1692118597;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRMNIql4h6i50DoW9rO+SQKBVq3u6OMyHVjggvsaHiY=;
        b=VzrmAkP9aDCowOgoNFFnkxi5OxQ0WENUSBG+RxAlXKICXMl8MUssDLz1R+7/u06gQm
         yBH+GJTMfVgX2U196BaWGRg5C2kGJ2ctN3BRtt1bBCFUy6g+So6w1VHant0Pz0ZblBgT
         VTR1lQPQuez68fPOo5ohnl7vISyYdKIiBnMaJg0B+z9NGaw9Zq6qwRVbE5QTLrTw7UF9
         7VSpP64s7Xy6Lr9cnTaX+EU1CKA+XMhSrzSJssF5ENCgIubFM0VXGdPrUEydPOzgbgoW
         kT5SgF/JR4rYQQcJgjT9Bf1CDh2gwTH+xlvpBj6L9FPYNZjIJQi7uRPDbnNsb9CxwM1A
         HnlA==
X-Gm-Message-State: AOJu0Yx23UTq2pk7uDdYVTacL7E6Cw7g2U2/bdZgOWMry4Bbnw9HErxa
        w9EzV6NsCL7jUU8t3W9MONJQ+K/xbXF78N4U8UA=
X-Google-Smtp-Source: AGHT+IG+xa/G0KUFOC99116SrrI42b1Qeto1ZUGnZKL3zxEPkqVqherNWGnAP7AYkTuw2scsVZ/Dtg==
X-Received: by 2002:a1c:f216:0:b0:3fe:1fdb:cf5 with SMTP id s22-20020a1cf216000000b003fe1fdb0cf5mr9645023wmc.1.1691483293856;
        Tue, 08 Aug 2023 01:28:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c261400b003fe2ebf479fsm12982952wma.36.2023.08.08.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:28:13 -0700 (PDT)
Date:   Tue, 8 Aug 2023 11:28:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
Cc:     "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] misc: microchip: pci1xxxx: Fix some NULL vs IS_ERR() bugs
Message-ID: <043df330-222b-4c2c-ae19-ed2f731bfe0b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The devm_nvmem_register() function returns error pointers.  It never
returns NULL.  Update the checks accordingly.

Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index 3d3d1578119a..16695cb5e69c 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -379,8 +379,8 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
 
 		priv->nvmem_eeprom = devm_nvmem_register(&aux_dev->dev,
 							 &priv->nvmem_config_eeprom);
-		if (!priv->nvmem_eeprom)
-			return -ENOMEM;
+		if (IS_ERR(priv->nvmem_eeprom))
+			return PTR_ERR(priv->nvmem_eeprom);
 	}
 
 	release_sys_lock(priv);
@@ -398,8 +398,8 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
 
 	priv->nvmem_otp = devm_nvmem_register(&aux_dev->dev,
 					      &priv->nvmem_config_otp);
-	if (!priv->nvmem_otp)
-		return -ENOMEM;
+	if (IS_ERR(priv->nvmem_otp))
+		return PTR_ERR(priv->nvmem_otp);
 
 	return ret;
 }
-- 
2.39.2

