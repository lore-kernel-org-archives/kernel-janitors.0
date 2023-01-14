Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032DFC46467
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Jan 2023 17:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjANRVz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 14 Jan 2023 12:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbjANRVv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Jan 2023 12:21:51 -0500
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264E193E5
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Jan 2023 09:21:48 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id GkDwpTOYE2zC1GkDwp5Jc6; Sat, 14 Jan 2023 18:21:47 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 14 Jan 2023 18:21:47 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     akpm@linux-foundation.org, ddiss@suse.de, mwilck@suse.com,
        brauner@kernel.org, wuchi.zero@gmail.com, ebiederm@xmission.com,
        xupengfei@nfschina.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] initramfs: Use kstrtobool() instead of strtobool()
Date:   Sat, 14 Jan 2023 18:21:38 +0100
Message-Id: <2597e80cb7059ec6ad63a01b77d7c944dcc99195.1673716768.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
This patch was already sent as a part of a serie ([1]) that axed all usages
of strtobool().
Most of the patches have been merged in -next.

I synch'ed with latest -next and re-send the remaining ones as individual
patches.

This patch slightly changes the existing code with an additional error
handling.

Note that the first version was sent to no-one, only mailing lists,
because "get_maintainer.pl --nogit-fallback" returns an empty list.

Changes in v2:
  - Re-write to code to be more consistent with other kstrtobool() usage
    in __setup() functions

[1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
---
 init/initramfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 62321883fe61..f6c112e30bd4 100644
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
@@ -571,8 +572,7 @@ __setup("keepinitrd", keepinitrd_setup);
 static bool __initdata initramfs_async = true;
 static int __init initramfs_async_setup(char *str)
 {
-	strtobool(str, &initramfs_async);
-	return 1;
+	return kstrtobool(str, &initramfs_async) == 0;
 }
 __setup("initramfs_async=", initramfs_async_setup);
 
-- 
2.34.1

