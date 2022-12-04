Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D90EC4708D
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Dec 2022 10:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiLDKCM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Dec 2022 05:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiLDKCL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Dec 2022 05:02:11 -0500
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258251402D
        for <kernel-janitors@vger.kernel.org>; Sun,  4 Dec 2022 02:02:08 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id 1lozppAz9pJKl1lozpN141; Sun, 04 Dec 2022 11:02:06 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Dec 2022 11:02:06 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     paulmck@kernel.org, elver@google.com, mark.rutland@arm.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] init_task: Remove unneeded pid_namespace.h and utsname.h includes
Date:   Sun,  4 Dec 2022 11:02:02 +0100
Message-Id: <94c8f2123a8833b61d84a662ec35f9c070cdf4dd.1670147823.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Remove pid_namespace.h and utsname.h from init_task.h
They are not needed any more.

<linux/pid_namespace.h>
  - added in commit 9a575a92db33 ("[PATCH] to nsproxy")
  - needed because of 'init_pid_ns'

<linux/utsname.h>
  - added in commit 4865ecf1315b ("[PATCH] namespaces: utsname: implement
    utsname namespaces")
  - needed because of 'init_uts_ns'

Both use have been moved in "kernel/nsproxy.c" in commit 8467005da3ef
("nsproxy: remove INIT_NSPROXY()").

"kernel/nsproxy.c" already includes the 2 corresponding includes.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Let see if build-bots agree with me!
---
 include/linux/init_task.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index 079c190de56d..6d2c4ea4c97a 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -4,11 +4,9 @@
 
 #include <linux/rcupdate.h>
 #include <linux/irqflags.h>
-#include <linux/utsname.h>
 #include <linux/lockdep.h>
 #include <linux/ftrace.h>
 #include <linux/ipc.h>
-#include <linux/pid_namespace.h>
 #include <linux/user_namespace.h>
 #include <linux/seqlock.h>
 #include <linux/rbtree.h>
-- 
2.34.1

