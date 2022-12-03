Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5717C4332F
	for <kernel-janitors@archiver.kernel.org>; Sat,  3 Dec 2022 20:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiLCUuv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 3 Dec 2022 15:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiLCUuu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 3 Dec 2022 15:50:50 -0500
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C56A1B9D6
        for <kernel-janitors@vger.kernel.org>; Sat,  3 Dec 2022 12:50:47 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id 1ZT8pbwYw3PfJ1ZT8pxIWr; Sat, 03 Dec 2022 21:50:45 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 03 Dec 2022 21:50:45 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ebiederm@xmission.com, russell.h.weight@intel.com,
        mcgrof@kernel.org, gregkh@linuxfoundation.org,
        peterz@infradead.org, keescook@chromium.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] cred: Include <linux/securebits.h> in the right file
Date:   Sat,  3 Dec 2022 21:50:41 +0100
Message-Id: <1a3d5bd51b7807471a913f8fa621e5a4ecd08e6a.1670100520.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is no need to include <linux/securebits.h> in init_task.h.
Move it to the right place, in kernel/cred.c which uses SECUREBITS_DEFAULT.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Let see if build-bots agree with me!
---
 include/linux/init_task.h | 1 -
 kernel/cred.c             | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index 40fc5813cf93..079c190de56d 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -10,7 +10,6 @@
 #include <linux/ipc.h>
 #include <linux/pid_namespace.h>
 #include <linux/user_namespace.h>
-#include <linux/securebits.h>
 #include <linux/seqlock.h>
 #include <linux/rbtree.h>
 #include <linux/refcount.h>
diff --git a/kernel/cred.c b/kernel/cred.c
index 811ad654abd1..cfe8ad309b92 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -12,6 +12,7 @@
 #include <linux/key.h>
 #include <linux/keyctl.h>
 #include <linux/init_task.h>
+#include <linux/securebits.h>
 #include <linux/security.h>
 #include <linux/binfmts.h>
 #include <linux/cn_proc.h>
-- 
2.34.1

