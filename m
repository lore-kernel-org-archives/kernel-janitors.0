Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6CAC4332F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Nov 2022 21:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbiKAVQN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Nov 2022 17:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiKAVPf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 17:15:35 -0400
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFB31F609
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Nov 2022 14:15:22 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id pyanoKD2rsfCIpybRoWfKB; Tue, 01 Nov 2022 22:15:21 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 01 Nov 2022 22:15:21 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 17/30] initramfs: Use kstrtobool() instead of strtobool()
Date:   Tue,  1 Nov 2022 22:14:05 +0100
Message-Id: <bc3f60f1cde68546363a4bfdab32d19b85892409.1667336095.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

strtobool() is the same as kstrtobool().
However, the latter is more used within the kernel.

In order to remove strtobool() and slightly simplify kstrtox.h, switch to
the other function name.

While at it, include the corresponding header file (<linux/kstrtox.h>)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is part of a serie that axes all usages of strtobool().
Each patch can be applied independently from the other ones.

The last patch of the serie removes the definition of strtobool().

You may not be in copy of the cover letter. So, if needed, it is available
at [1].

[1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
---
 init/initramfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 62321883fe61..174e15236c8e 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -11,6 +11,7 @@
 #include <linux/syscalls.h>
 #include <linux/utime.h>
 #include <linux/file.h>
+#include <linux/kstrtox.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/namei.h>
@@ -571,7 +572,12 @@ __setup("keepinitrd", keepinitrd_setup);
 static bool __initdata initramfs_async = true;
 static int __init initramfs_async_setup(char *str)
 {
-	strtobool(str, &initramfs_async);
+	int ret;
+
+	ret = kstrtobool(str, &initramfs_async);
+	if (ret)
+		return 0;
+
 	return 1;
 }
 __setup("initramfs_async=", initramfs_async_setup);
-- 
2.34.1

