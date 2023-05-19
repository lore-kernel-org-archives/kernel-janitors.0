Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04449C77B73
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 May 2023 01:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjESBhk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 May 2023 21:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjESBhi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 May 2023 21:37:38 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9366910C2;
        Thu, 18 May 2023 18:37:34 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 2B0331801097CD;
        Fri, 19 May 2023 09:37:12 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
        Alistar Popple <alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>
Cc:     eajames@us.ibm.com, cbostic@linux.vnet.ibm.com,
        gregkh@linuxfoundation.org, linux-fsi@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Su Hui <suhui@nfschina.com>
Subject: [PATCH] drivers/fsi/scom: Return -EFAULT if copy fails
Date:   Fri, 19 May 2023 09:37:10 +0800
Message-Id: <20230519013710.34954-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The copy_to/from_user() functions return the number of bytes remaining
to be copied, but we want to return -EFAULT to the user.

Fixes: 680ca6dcf5c2 ("drivers/fsi: Add SCOM FSI client device driver")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/fsi/fsi-scom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index bcb756dc9866..caaf7738eb98 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -335,7 +335,7 @@ static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
 	if (rc)
 		dev_dbg(dev, "copy to user failed:%d\n", rc);
 
-	return rc ? rc : len;
+	return rc ? -EFAULT : len;
 }
 
 static ssize_t scom_write(struct file *filep, const char __user *buf,
-- 
2.30.2

