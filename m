Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9B0C19F29
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Aug 2022 06:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241657AbiHFGt3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 6 Aug 2022 02:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239694AbiHFGt3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Aug 2022 02:49:29 -0400
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1030414D34
        for <kernel-janitors@vger.kernel.org>; Fri,  5 Aug 2022 23:49:27 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id KDcioEFnQiBgAKDcioqrut; Sat, 06 Aug 2022 08:49:26 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 06 Aug 2022 08:49:26 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     gregkh@linuxfoundation.org, tglx@linutronix.de, jgg@ziepe.ca,
        ira.weiny@intel.com, dan.j.williams@intel.com,
        andriy.shevchenko@linux.intel.com, wonchung@google.com
Cc:     list@mail.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] driver core: Define dev_err_probe() as __cold
Date:   Sat,  6 Aug 2022 08:49:23 +0200
Message-Id: <0d4391f85d916508dba096caf132b0a973b08800.1659768386.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Give a hint to the compiler that dev_err_probe() is used for error
handling. So calling paths are unlikely.

From gcc documentation:
	The paths leading to calls of cold functions within code are marked
	as unlikely by the branch prediction mechanism.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 424b55df0272..4ac16bde9bf7 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1093,7 +1093,7 @@ void device_links_supplier_sync_state_pause(void);
 void device_links_supplier_sync_state_resume(void);
 
 extern __printf(3, 4)
-int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
+int __cold dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
 
 /* Create alias, so I can be autoloaded. */
 #define MODULE_ALIAS_CHARDEV(major,minor) \
-- 
2.34.1

