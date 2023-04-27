Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F573C77B60
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Apr 2023 01:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242809AbjD0BkH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Apr 2023 21:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242808AbjD0BkF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Apr 2023 21:40:05 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 63FF43AA1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Apr 2023 18:40:04 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 379C1180118167;
        Thu, 27 Apr 2023 09:39:51 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc:     kernel-janitors@vger.kernel.org, Suhui <suhui@nfschina.com>
Subject: [PATCH] tpm: Remove unnecessary (void*) conversions
Date:   Thu, 27 Apr 2023 09:39:26 +0800
Message-Id: <20230427013926.28873-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Suhui <suhui@nfschina.com>

No need cast (void*) to (struct seq_file*) or (struct tpm_chip*).

Signed-off-by: Suhui <suhui@nfschina.com>
---
 drivers/char/tpm/eventlog/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/eventlog/common.c b/drivers/char/tpm/eventlog/common.c
index 8512ec76d526..df6eb8167e30 100644
--- a/drivers/char/tpm/eventlog/common.c
+++ b/drivers/char/tpm/eventlog/common.c
@@ -55,8 +55,8 @@ static int tpm_bios_measurements_open(struct inode *inode,
 static int tpm_bios_measurements_release(struct inode *inode,
 					 struct file *file)
 {
-	struct seq_file *seq = (struct seq_file *)file->private_data;
-	struct tpm_chip *chip = (struct tpm_chip *)seq->private;
+	struct seq_file *seq = file->private_data;
+	struct tpm_chip *chip = seq->private;
 
 	put_device(&chip->dev);
 
-- 
2.30.2

