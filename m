Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A107CC433FE
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Nov 2022 11:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiKELRB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 5 Nov 2022 07:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiKELQ7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Nov 2022 07:16:59 -0400
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55FB1401D
        for <kernel-janitors@vger.kernel.org>; Sat,  5 Nov 2022 04:16:58 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id rHAWoPKKvr5PdrHAWoUSkv; Sat, 05 Nov 2022 12:16:57 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Nov 2022 12:16:57 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Corey Minyard <minyard@acm.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        openipmi-developer@lists.sourceforge.net
Subject: [PATCH] ipmi/watchdog: Include <linux/kstrtox.h> when appropriate
Date:   Sat,  5 Nov 2022 12:16:54 +0100
Message-Id: <37daa028845d90ee77f1e547121a051a983fec2e.1667647002.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The kstrto<something>() functions have been moved from kernel.h to
kstrtox.h.

So, in order to eventually remove <linux/kernel.h> from <linux/watchdog.h>,
include the latter directly in the appropriate files.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/char/ipmi/ipmi_watchdog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
index 5b4e677929ca..47365150e431 100644
--- a/drivers/char/ipmi/ipmi_watchdog.c
+++ b/drivers/char/ipmi/ipmi_watchdog.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/completion.h>
 #include <linux/kdebug.h>
+#include <linux/kstrtox.h>
 #include <linux/rwsem.h>
 #include <linux/errno.h>
 #include <linux/uaccess.h>
-- 
2.34.1

