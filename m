Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD39C433F5
	for <kernel-janitors@archiver.kernel.org>; Sun, 26 Dec 2021 14:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233703AbhLZOct (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 26 Dec 2021 09:32:49 -0500
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:56970 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhLZOct (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Dec 2021 09:32:49 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id 1UZrniTMy1UGB1UZrnOPBj; Sun, 26 Dec 2021 15:32:48 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 26 Dec 2021 15:32:48 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jens.wiklander@linaro.org, sumit.garg@linaro.org
Cc:     op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] optee: Use bitmap_free() to free bitmap
Date:   Sun, 26 Dec 2021 15:32:45 +0100
Message-Id: <0e30e1f1bde74bc95085093fb0289007d510a68c.1640529121.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

kfree() and bitmap_free() are the same. But using the latter is more
consistent when freeing memory allocated with bitmap_zalloc().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/tee/optee/notif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
index a28fa03dcd0e..05212842b0a5 100644
--- a/drivers/tee/optee/notif.c
+++ b/drivers/tee/optee/notif.c
@@ -121,5 +121,5 @@ int optee_notif_init(struct optee *optee, u_int max_key)
 
 void optee_notif_uninit(struct optee *optee)
 {
-	kfree(optee->notif.bitmap);
+	bitmap_free(optee->notif.bitmap);
 }
-- 
2.32.0

