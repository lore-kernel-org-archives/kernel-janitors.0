Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D558FC433B4
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 01:56:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD1AB610D1
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 01:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbhDIB4V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Apr 2021 21:56:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16850 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIB4U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 21:56:20 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGh4d4Gmwz9x8Z;
        Fri,  9 Apr 2021 09:53:53 +0800 (CST)
Received: from huawei.com (10.67.174.78) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 09:55:57 +0800
From:   Chen Lifu <chenlifu@huawei.com>
To:     Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Russell King <linux@armlinux.org.uk>
CC:     Chen Lifu <chenlifu@huawei.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] ARM: spear: Fix build error with CONFIG_ARCH_SPEAR3XX
Date:   Fri, 9 Apr 2021 09:55:15 +0800
Message-ID: <20210409015515.258653-1-chenlifu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.174.78]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

commit 77f983a9df42 ("spi: pl022: Use GPIOs looked up by the core")
deleted 'struct pl022_ssp_controller' member 'num_chipselect'.
We get build error when CONFIG_ARCH_SPEAR3XX is set:
arch/arm/mach-spear/spear3xx.c:42:3: error: 'struct pl022_ssp_controller' has no member named 'num_chipselect'
   42 |  .num_chipselect = 2,
      |   ^~~~~~~~~~~~~~
arch/arm/mach-spear/spear3xx.c:42:20: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   42 |  .num_chipselect = 2,
      |                    ^

Fix the issue by deleting the initialization of 'num_chipselect'
in spear3xx.c.

Fixes: 77f983a9df42 ("spi: pl022: Use GPIOs looked up by the core")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Lifu <chenlifu@huawei.com>
---
 arch/arm/mach-spear/spear3xx.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/mach-spear/spear3xx.c b/arch/arm/mach-spear/spear3xx.c
index 8537fcffe5a8..f83321d5e353 100644
--- a/arch/arm/mach-spear/spear3xx.c
+++ b/arch/arm/mach-spear/spear3xx.c
@@ -30,16 +30,6 @@ struct pl022_ssp_controller pl022_plat_data = {
 	.dma_filter = pl08x_filter_id,
 	.dma_tx_param = "ssp0_tx",
 	.dma_rx_param = "ssp0_rx",
-	/*
-	 * This is number of spi devices that can be connected to spi. There are
-	 * two type of chipselects on which slave devices can work. One is chip
-	 * select provided by spi masters other is controlled through external
-	 * gpio's. We can't use chipselect provided from spi master (because as
-	 * soon as FIFO becomes empty, CS is disabled and transfer ends). So
-	 * this number now depends on number of gpios available for spi. each
-	 * slave on each master requires a separate gpio pin.
-	 */
-	.num_chipselect = 2,
 };
 
 /* dmac device registration */

