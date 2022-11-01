Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72184C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Nov 2022 21:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiKAVQB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Nov 2022 17:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiKAVPb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 17:15:31 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E4B1F2C6
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Nov 2022 14:15:17 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id pyanoKD2rsfCIpybLoWfJW; Tue, 01 Nov 2022 22:15:15 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 01 Nov 2022 22:15:15 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-input@vger.kernel.org
Subject: [PATCH 12/30] input: Use kstrtobool() instead of strtobool()
Date:   Tue,  1 Nov 2022 22:14:00 +0100
Message-Id: <4311e9cb62687449f4175e2b062abcd77aada059.1667336095.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
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
This patch is part of a serie that axes all usages of strtobool().
Each patch can be applied independently from the other ones.

The last patch of the serie removes the definition of strtobool().

You may not be in copy of the cover letter. So, if needed, it is available
at [1].

[1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
---
 drivers/input/input.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ebb2b7f0f8ff..783961df3626 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -21,6 +21,7 @@
 #include <linux/seq_file.h>
 #include <linux/poll.h>
 #include <linux/device.h>
+#include <linux/kstrtox.h>
 #include <linux/mutex.h>
 #include <linux/rcupdate.h>
 #include "input-compat.h"
@@ -1465,7 +1466,7 @@ static ssize_t inhibited_store(struct device *dev,
 	ssize_t rv;
 	bool inhibited;
 
-	if (strtobool(buf, &inhibited))
+	if (kstrtobool(buf, &inhibited))
 		return -EINVAL;
 
 	if (inhibited)
-- 
2.34.1

