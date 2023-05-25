Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33B5C7EE2C
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 08:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238828AbjEYIFd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 04:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235188AbjEYIFc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 04:05:32 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C470122
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 01:05:30 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f655a8135bso1936175e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 01:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685001929; x=1687593929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEaBmzb77Yfj4NT5Cv6mQfZ6VRH3pcFg5KkRGTmBOZ8=;
        b=A0u68dVhg/5A0DP6/oeFiqIA7ss/S/4G1tOj0bHIIenfPcYcQZ1xGxadrD02u80RVR
         Nmido22xyDD7a8nwx6X/pSQ7u1cEe69fpyAtMHCHbuJ+MY507gqScGIa6P2kpuyRNPhe
         CZrrJr8Oblb0+VCOStG4Sf0Rc9R+/ZssjRk/eYS+0Db8b1GJSN1rlb5/IEizYjS0RyMw
         +O3NZcV3rt2w+cZyr8Ip4nH6yxzD1nqrfBAvoPF6ZwTQgGlZc5HgONcAlMklThl+5eq/
         ULmAYlWEWFbtEgNwT8WL3aP2z/wFQptVVKsOD/48OlpBB+delvkNHL+pDyvMSzzlkSCm
         QiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685001929; x=1687593929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEaBmzb77Yfj4NT5Cv6mQfZ6VRH3pcFg5KkRGTmBOZ8=;
        b=dDvW4gDKcSdOv0Lc1ZwjEZVNGrOOjFn/yKPx777NAyQJ05uv/V3lhwAbDVmxK4kIeR
         UGpD/Mc+GLGTMezgh7TNQlx7fIkY2WT8vnGOQi5NhFe6Ie2GIAHIDYKbcyEZ+MnCgh3m
         yuSOzhc1gqVOuuk5HLIfjGNpqd225egCTac8bEzrY95DSsIHPXPTzkyTdowte5LKD4VP
         bZJ9TmsSsBK6G+BDy2c9Ic2/mQLILAwZrjZiKbZSeeB7Btn5yfuJl0cT9X3K65GuFl3q
         OEOBV+YfvuJMYcYcBxDdHMi1yseO2iCwQ11fV6opRYmjiPwCBC1isdFogCrUvtisX5R+
         8bVg==
X-Gm-Message-State: AC+VfDzhChVFzZCK+FaxdqlBf8nhoS5DFDZ/EEIbWnX35LtLD74JaqPV
        y9v6+UBFWJzuXgFH65hXN6b/ZA==
X-Google-Smtp-Source: ACHHUZ5O8zLR7hgpDa++vgvNxVPsuKlJj3giFo2RNRpcZa5gxEBB6tIO3W6VDK0VNufvUi9m4R2EJA==
X-Received: by 2002:a1c:7415:0:b0:3f6:11cb:4926 with SMTP id p21-20020a1c7415000000b003f611cb4926mr2255542wmc.22.1685001929090;
        Thu, 25 May 2023 01:05:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s15-20020a7bc38f000000b003f6028a4c85sm4779312wmj.16.2023.05.25.01.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:05:27 -0700 (PDT)
Date:   Thu, 25 May 2023 11:05:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Felipe Balbi <balbi@kernel.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: phy: tahvo: release resources on error in probe()
Message-ID: <80496b6d-990e-4fb3-808b-daf3143cef15@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We need to do some clean up before returning on this error path.

Fixes: 0d45a1373e66 ("usb: phy: tahvo: add IRQ check")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/phy/phy-tahvo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
index 47562d49dfc1..5cac31c6029b 100644
--- a/drivers/usb/phy/phy-tahvo.c
+++ b/drivers/usb/phy/phy-tahvo.c
@@ -391,7 +391,7 @@ static int tahvo_usb_probe(struct platform_device *pdev)
 
 	tu->irq = ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		return ret;
+		goto err_remove_phy;
 	ret = request_threaded_irq(tu->irq, NULL, tahvo_usb_vbus_interrupt,
 				   IRQF_ONESHOT,
 				   "tahvo-vbus", tu);
-- 
2.39.2

