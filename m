Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C11C48BE5
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 14:07:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70FD961446
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 14:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhFOOJG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 10:09:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33202 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhFOOJF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 10:09:05 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lt9iO-00029g-Sq; Tue, 15 Jun 2021 14:06:52 +0000
From:   Colin King <colin.king@canonical.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: devices: mchp48l640: Fix return of uninitialized value in ret
Date:   Tue, 15 Jun 2021 15:06:52 +0100
Message-Id: <20210615140652.59521-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where the read or write lengths are zero bytes the return
value in variable ret has not been initialized and a garbage value
is returned. Fix this by initializing ret to zero.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/devices/mchp48l640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index efc2003bd13a..0833f41e9d17 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -210,7 +210,7 @@ static int mchp48l640_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const unsigned char *buf)
 {
 	struct mchp48l640_flash *flash = to_mchp48l640_flash(mtd);
-	int ret;
+	int ret = 0;
 	size_t wlen = 0;
 	loff_t woff = to;
 	size_t ws;
@@ -267,7 +267,7 @@ static int mchp48l640_read(struct mtd_info *mtd, loff_t from, size_t len,
 			   size_t *retlen, unsigned char *buf)
 {
 	struct mchp48l640_flash *flash = to_mchp48l640_flash(mtd);
-	int ret;
+	int ret = 0;
 	size_t wlen = 0;
 	loff_t woff = from;
 	size_t ws;
-- 
2.31.1

