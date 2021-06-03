Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605CAC47096
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Jun 2021 12:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 482B6613E6
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Jun 2021 12:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhFCMaI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Jun 2021 08:30:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36973 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhFCMaH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Jun 2021 08:30:07 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lomSL-0001qK-5S; Thu, 03 Jun 2021 12:28:13 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
        Alistar Popple <alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-fsi@lists.ozlabs.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fsi: core: Fix return of error values on failures
Date:   Thu,  3 Jun 2021 13:28:12 +0100
Message-Id: <20210603122812.83587-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the cfam_read and cfam_write functions return the provided
number of bytes given in the count parameter and not the error return
code in variable rc, hence all failures of read/writes are being
silently ignored. Fix this by returning the error code in rc.

Addresses-Coverity: ("Unused value")
Fixes: d1dcd6782576 ("fsi: Add cfam char devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/fsi/fsi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4e60e84cd17a..59ddc9fd5bca 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -724,7 +724,7 @@ static ssize_t cfam_read(struct file *filep, char __user *buf, size_t count,
 	rc = count;
  fail:
 	*offset = off;
-	return count;
+	return rc;
 }
 
 static ssize_t cfam_write(struct file *filep, const char __user *buf,
@@ -761,7 +761,7 @@ static ssize_t cfam_write(struct file *filep, const char __user *buf,
 	rc = count;
  fail:
 	*offset = off;
-	return count;
+	return rc;
 }
 
 static loff_t cfam_llseek(struct file *file, loff_t offset, int whence)
-- 
2.31.1

