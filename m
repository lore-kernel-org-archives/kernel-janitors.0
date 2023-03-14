Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF26C6FD1F
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Mar 2023 08:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbjCNIYC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjCNIXg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Mar 2023 04:23:36 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B118DCF7;
        Tue, 14 Mar 2023 01:22:07 -0700 (PDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id B544760003;
        Tue, 14 Mar 2023 08:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1678782121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Qs6UFeINzkIgSkEf14pHIAxamvFd4hhdhkcCNjbLS7g=;
        b=SsBxU8L2E6rui0OxPks3Vm12YbtJekvqPcAzczY4R2qW4Y3IcCgHI5EN9RlZOznXvotR5A
        HGyrgBtXK7K7KJ1DAhJF/WvD/E6xesC11vlVfq6TcB+C12G/LyWR12Bjz+DBXvDMiZDZPm
        52ucVhxNjMj0ErGZCutqomlkGkPbd2I8qKhlGY4cdOHJf+i9s3ACePT/XtE1aIB5fVD1ls
        I64ONP2jnIgTrVCvqdg/aSdT0Cyw7rYoqIxcydLedHTHSK8QZ6YrqCUNj/71CEfS1GuJf8
        LDNTrNczxV06b4DIEjUxSn7jO++tG9jRxh8I+7rCxFiaQNYw/WxbReW42VaG3Q==
From:   Herve Codina <herve.codina@bootlin.com>
To:     Herve Codina <herve.codina@bootlin.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Mark Brown <broonie@kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc:     linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Subject: [PATCH] soc: fsl: cpm1: qmc: Fix test dependency
Date:   Tue, 14 Mar 2023 09:21:57 +0100
Message-Id: <20230314082157.137176-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The QMC depends on (SOC_FSL && COMPILE_TEST). SOC_FSL does not exist.

Fix the dependency using the correct one: FSL_SOC.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index f90cfdf0c763..7268c2fbcbc1 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -47,7 +47,7 @@ config CPM_TSA
 config CPM_QMC
 	tristate "CPM QMC support"
 	depends on OF && HAS_IOMEM
-	depends on CPM1 || (SOC_FSL && COMPILE_TEST)
+	depends on CPM1 || (FSL_SOC && COMPILE_TEST)
 	depends on CPM_TSA
 	help
 	  Freescale CPM QUICC Multichannel Controller
-- 
2.39.2

