Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781D3ECAAD3
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Sep 2022 03:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiIID3E (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Sep 2022 23:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiIID3D (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Sep 2022 23:29:03 -0400
Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E569411EA45;
        Thu,  8 Sep 2022 20:29:00 -0700 (PDT)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id 1EC861E80D78;
        Fri,  9 Sep 2022 11:27:20 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FVM48eWZGjJP; Fri,  9 Sep 2022 11:27:17 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
        (Authenticated sender: yuzhe@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id 0B9671E80D75;
        Fri,  9 Sep 2022 11:27:17 +0800 (CST)
From:   Yu Zhe <yuzhe@nfschina.com>
To:     daniel@zonque.org, haojian.zhuang@gmail.com,
        robert.jarzmik@free.fr, linux@armlinux.org.uk
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, liqiong@nfschina.com,
        Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] ARM: pxa: fix platform_get_irq error checking
Date:   Fri,  9 Sep 2022 11:27:58 +0800
Message-Id: <20220909032758.29388-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The platform_get_irq() function returns negative error codes on error,
so change the '<=0' check to '<0' to make code more explicit.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 arch/arm/mach-pxa/pxa_cplds_irqs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa_cplds_irqs.c b/arch/arm/mach-pxa/pxa_cplds_irqs.c
index eda5a47d7fbb..aa284031071d 100644
--- a/arch/arm/mach-pxa/pxa_cplds_irqs.c
+++ b/arch/arm/mach-pxa/pxa_cplds_irqs.c
@@ -115,7 +115,7 @@ static int cplds_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	fpga->irq = platform_get_irq(pdev, 0);
-	if (fpga->irq <= 0)
+	if (fpga->irq < 0)
 		return fpga->irq;
 
 	base_irq = platform_get_irq(pdev, 1);
-- 
2.11.0

