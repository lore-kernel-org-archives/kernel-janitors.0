Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF0FEC8738
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 15:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbjIGPW2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjIGPVW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 11:21:22 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418FB19C
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 08:21:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-501cba1ec0aso1784848e87.2
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100030; x=1694704830; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1Xg8daKkiRDx70DYNoiC72rqrty0xVzo35tP0pXzLM=;
        b=WogZqgrIfkFN/mV7lU6O9uIhXseBf4Br/BrPT2bi5XlnkQ88RNtlHouQZyACXiF+QY
         J9l81o/4tMYzIiKkddeDWB0gNnQBgqJNslmzTMZl5ToTqLYfaXohdGDP5o1i/stEIt4U
         mCnjBUeAD4uCQa3tbFQ2jk7A16oE7uVHKH3xzwQg2oX5VHq/7ibU3TctGNRGFvrf1CQN
         ylKbpHIYxZuPmOLy55F59wAyLtyVyvDHInkgFJ6uUlX/QWAMYLqeWBrcKBmEPSOpvvmB
         Ub2IDPlrixnGiqt0wVhMkgb4u8OB21fBtMkBzk4ieb5EbkFk7TRLmsBK/l41vhIox6wi
         +A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100030; x=1694704830;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t1Xg8daKkiRDx70DYNoiC72rqrty0xVzo35tP0pXzLM=;
        b=HPlzXZtqB6IFdxU3JKZG/us35Rf/bE0OT10MwAjXAzFQMg1dj2VgklDrbtPTo6n9bD
         9FxXvbsHsayPQ0NJZVYV3aI71Us5YzvlUavx0THAFiytfQE1Y5oeJG1qQwezZ2zcXsbT
         hTsgshpBNyIUKjY2oh2ruinTO9cjllJB63Bu40pMef9s9WuanWwX5mD1Uwl2u3NNiPcr
         E5aNJzv7uaEq8FfWLeLkCmmm+n0xr7eKrkn8M0J/5emhc34X2MoROsBcjX0bpNUHoriG
         duFbtV7h0p6yZ4Xmae6JuxIx1XFRyFAkBq3fpwJfMgUc0nLp/wuB+8NPwgtH0v6NP0Lq
         UedA==
X-Gm-Message-State: AOJu0Yz9UYs+p/8ubu6f4dvXYK5Wys/O6DlrmWRkzUCfrtl0qVSnC1U3
        ZiLfQhAXKS8eJD8PwkWc4entBllmGd8tTTJ+qpE=
X-Google-Smtp-Source: AGHT+IFmOiv05mocpi1VtcAzIkJzCg0pJhhEwIKxEuNtBoOnNOTF9KpuJgW2+cmwkNw5fVoET3C7lg==
X-Received: by 2002:a05:600c:151:b0:400:6b36:ee2a with SMTP id w17-20020a05600c015100b004006b36ee2amr4511896wmm.26.1694080399345;
        Thu, 07 Sep 2023 02:53:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay30-20020a5d6f1e000000b0031f65cdd271sm3827670wrb.100.2023.09.07.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:53:19 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:53:15 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bharat Bhushan <bbhushan2@marvell.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] watchdog: marvell_gti_wdt: Fix error code in probe()
Message-ID: <af326fd7-ac71-43a1-b7de-81779b61d242@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This error path accidentally returns success.  Return -EINVAL instead.

Fixes: ef9e7fe2c890 ("Watchdog: Add marvell GTI watchdog driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/watchdog/marvell_gti_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/marvell_gti_wdt.c b/drivers/watchdog/marvell_gti_wdt.c
index d7eb8286e11e..1ec1e014ba83 100644
--- a/drivers/watchdog/marvell_gti_wdt.c
+++ b/drivers/watchdog/marvell_gti_wdt.c
@@ -271,7 +271,7 @@ static int gti_wdt_probe(struct platform_device *pdev)
 				   &wdt_idx);
 	if (!err) {
 		if (wdt_idx >= priv->data->gti_num_timers)
-			return dev_err_probe(&pdev->dev, err,
+			return dev_err_probe(&pdev->dev, -EINVAL,
 				"GTI wdog timer index not valid");
 
 		priv->wdt_timer_idx = wdt_idx;
-- 
2.39.2

