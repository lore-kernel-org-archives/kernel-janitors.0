Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78066C7EE23
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 May 2023 01:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjE2Bvd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 28 May 2023 21:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjE2Bvc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 May 2023 21:51:32 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8B694B8;
        Sun, 28 May 2023 18:51:30 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id BE84418011D6BC;
        Mon, 29 May 2023 09:50:12 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Su Hui <suhui@nfschina.com>
Subject: [PATCH] mtd: devices: docg3: Remove unnecessary (void*) conversions
Date:   Mon, 29 May 2023 09:50:11 +0800
Message-Id: <20230529015011.38811-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pointer variables of (void*) type do not require type cast.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/mtd/devices/docg3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index a7714e3de887..22e73dd6118b 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1599,7 +1599,7 @@ static void doc_unregister_sysfs(struct platform_device *pdev,
  */
 static int flashcontrol_show(struct seq_file *s, void *p)
 {
-	struct docg3 *docg3 = (struct docg3 *)s->private;
+	struct docg3 *docg3 = s->private;
 
 	u8 fctrl;
 
@@ -1621,7 +1621,7 @@ DEFINE_SHOW_ATTRIBUTE(flashcontrol);
 
 static int asic_mode_show(struct seq_file *s, void *p)
 {
-	struct docg3 *docg3 = (struct docg3 *)s->private;
+	struct docg3 *docg3 = s->private;
 
 	int pctrl, mode;
 
@@ -1658,7 +1658,7 @@ DEFINE_SHOW_ATTRIBUTE(asic_mode);
 
 static int device_id_show(struct seq_file *s, void *p)
 {
-	struct docg3 *docg3 = (struct docg3 *)s->private;
+	struct docg3 *docg3 = s->private;
 	int id;
 
 	mutex_lock(&docg3->cascade->lock);
@@ -1672,7 +1672,7 @@ DEFINE_SHOW_ATTRIBUTE(device_id);
 
 static int protection_show(struct seq_file *s, void *p)
 {
-	struct docg3 *docg3 = (struct docg3 *)s->private;
+	struct docg3 *docg3 = s->private;
 	int protect, dps0, dps0_low, dps0_high, dps1, dps1_low, dps1_high;
 
 	mutex_lock(&docg3->cascade->lock);
-- 
2.30.2

