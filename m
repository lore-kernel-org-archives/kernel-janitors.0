Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA05C4332F
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Nov 2022 18:18:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiKYSSb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 25 Nov 2022 13:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiKYSSa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Nov 2022 13:18:30 -0500
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A62E4A9CA
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Nov 2022 10:18:29 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id ydHPo88zt1SdMydHPoYhIK; Fri, 25 Nov 2022 19:18:27 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 25 Nov 2022 19:18:27 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] initramfs: Remove a useless include
Date:   Fri, 25 Nov 2022 19:18:25 +0100
Message-Id: <06ab5dd1d3ed3f5e08d10efd4391aae5b1264e67.1669400298.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

<linux/dirent.h> only define the 'linux_dirent64' structure that is not
used in this file since commit	b2a74d5f9d44 ("initramfs: remove
clean_rootfs")

So remove the useless include.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 init/initramfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 62321883fe61..3eae875d1ff7 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -7,7 +7,6 @@
 #include <linux/fcntl.h>
 #include <linux/delay.h>
 #include <linux/string.h>
-#include <linux/dirent.h>
 #include <linux/syscalls.h>
 #include <linux/utime.h>
 #include <linux/file.h>
-- 
2.34.1

