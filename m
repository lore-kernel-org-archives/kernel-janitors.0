Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2EBC25B48
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Oct 2023 02:07:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345099AbjJ0CHo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Oct 2023 22:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjJ0CHm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Oct 2023 22:07:42 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 919B4187;
        Thu, 26 Oct 2023 19:07:36 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id D80666027ECD5;
        Fri, 27 Oct 2023 10:07:19 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     joel@jms.id.au, andrew@codeconstruct.com.au
Cc:     Su Hui <suhui@nfschina.com>, robh@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, roblip@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: aspeed: lpc: Fix impossible judgment condition
Date:   Fri, 27 Oct 2023 10:07:04 +0800
Message-Id: <20231027020703.1231875-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

smatch error：
drivers/soc/aspeed/aspeed-lpc-snoop.c:169
aspeed_lpc_snoop_config_irq() warn: platform_get_irq() does not return zero

platform_get_irq() return non-zero IRQ number or negative error code,
change '!lpc_snoop->irq' to 'lpc_snoop->irq < 0' to fix this.

Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 773dbcbc03a6..8cb3a0b4692c 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -166,7 +166,7 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	int rc;
 
 	lpc_snoop->irq = platform_get_irq(pdev, 0);
-	if (!lpc_snoop->irq)
+	if (lpc_snoop->irq < 0)
 		return -ENODEV;
 
 	rc = devm_request_irq(dev, lpc_snoop->irq,
-- 
2.30.2

